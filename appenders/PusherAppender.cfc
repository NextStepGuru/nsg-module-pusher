
component extends="coldbox.system.logging.AbstractAppender" output="false" hint="An appender that sends out a pusher request"{

	public PusherAppender function init(required name, required struct properties="#structNew()#", required numeric levelMin=0, required numeric levelMax=4) hint="Constructor" output="false"{
		// Init supertype
		super.init(argumentCollection=arguments);

		// Property Checks
		if( NOT propertyExists("channel") ){
			$throw(message="Pusher Channel is required",type="PusherAppender.PropertyNotFound");
		}
		if( NOT propertyExists("id") ){
			$throw(message="Pusher App_ID is required",type="PusherAppender.PropertyNotFound");
		}
		if( NOT propertyExists("key") ){
			$throw(message="Pusher Key is required",type="PusherAppender.PropertyNotFound");
		}
		if( NOT propertyExists("secret") ){
			$throw(message="Pusher Secret is required",type="PusherAppender.PropertyNotFound");
		}

		return this;
	}

	// Log Message
	public void function logMessage(required any logEvent) hint="Write an entry into the logger."{

		thread name=reReplace(createUUID(),'\W','','all') loge=arguments.logEvent {
			try{
				triggerPush(channel=getProperty("channel"),event=getSeverity(loge.getSeverity()),jsonData=serializeJSON({timestamp = loge.getTimestamp(), category=loge.getCategory(), severity=getSeverity(loge.getSeverity()), message = loge.getMessage(), extra = loge.getExtraInfo() }));

			}catch(any e){
				$log("ERROR","Error sending email from appender #getName()#. #e.message# #e.detail# #e.stacktrace#");
			}
		};

	}

	// private events

	private string function getSeverity(required numeric severity){
		switch(arguments.severity){
			case 0:
				var eventType = "FATAL";
				break;
			case 1:
				var eventType = "ERROR";
				break;
			case 2:
				var eventType = "WARN";
				break;
			case 3:
				var eventType = "INFO";
				break;
			default:
				var eventType = "DEBUG";
		}

		return eventType;
	}

	private string function byteArrayToString(required any data){
		var hash="";
		var bigInteger = createObject("java", "java.math.BigInteger");

		bigInteger.init(1, data);
		hash = bigInteger.toString(16);

		hash = reReplace(rJustify(hash,64),' ',0,'all');

		return hash;
	}

	private any function md5Representation(required any data){

		return LCase(Hash(data));
	}

	private any function HmacSHA256Hex(required any data){
		var secret="";
		var mac="";
		var digest="";

		secret = createObject('java', 'javax.crypto.spec.SecretKeySpec' );
		secret.init(getProperty("secret").getBytes(), 'HmacSHA256');
		mac = createObject('java', "javax.crypto.Mac");
		mac = mac.getInstance("HmacSHA256");
		mac.init(secret);
		digest = mac.doFinal(data.GetBytes());
		digest = mac.doFinal(data.getBytes("UTF-8"));

		return byteArrayToString(digest);
	}

	private any function buildQuery(required any eventName, required any jsonData, any socketID){
		var buffer="";

		// Auth_Key
		buffer=buffer & "auth_key=";
		buffer=buffer & getProperty("key");
		// Timestamp
		buffer=buffer & "&auth_timestamp=";
		buffer=buffer & (CreateObject("java", "java.lang.System").currentTimeMillis() / 1000);
		// Auth_version
		buffer=buffer & "&auth_version=1.0";
		// MD5 body
		buffer=buffer & "&body_md5=";
		buffer=buffer & md5Representation(jsonData);
		// Event Name
		buffer=buffer & "&name=";
		buffer=buffer & eventName;

		// Append socket id if set
		if(len(arguments.socketID)){
			buffer=buffer & "&socket_id=";
			buffer=buffer & socketID;
		}

		return buffer;
	}

	private any function buildURIPath(required any channelName){
		var buffer="";

		// Application ID
		buffer=buffer & "/apps/";
		buffer=buffer & getProperty("id");
		// Channel name
		buffer=buffer & "/channels/";
		buffer=buffer & channelName;
		// Event
		buffer=buffer & "/events";

		return buffer;
	}

	private any function buildAuthenticationSignature(required any uriPath, required any query){
		var buffer="";

		// request method
		buffer=buffer & "POST" & Chr(10);
		// URI Path
		buffer=buffer & uriPath & Chr(10);
		// Query string
		buffer=buffer & query;

		// return encoded data
		return HmacSHA256Hex(buffer);
	}

	private any function buildURI(required any uriPath, required any query, required any signature){
		var buffer="";

		// Protocol
		buffer=buffer & "http://";
		// Host
		buffer=buffer & "api.pusherapp.com";
		// URI Path
		buffer=buffer & uriPath;
		// Query string
		buffer=buffer & "?";
		buffer=buffer & query;
		// Authentication signature
		buffer=buffer & "&auth_signature=";
		buffer=buffer & signature;

		return buffer;
	}

	private any function triggerPush(required any channel, required any event, required any jsonData, required any socketID=""){
		var httpRequest="";

		// Build URI path
		var uriPath = buildURIPath(channel);
		// Build query
		var query = buildQuery(event, jsonData, socketId);
		// Generate signature
		var signature = buildAuthenticationSignature(uriPath, query);
		// Build URI
		var pusherURL = buildURI(uriPath, query, signature);

		// send HTTP request
		var httpService = new http();
			httpService.setURL(pusherURL);
			httpService.setMethod('POST');
			httpService.setTimeout(5);
			httpService.setUserAgent('LogBox Pusher Logger');
			httpService.addParam(type="header",name="content-type",value="application/json");
			httpService.addParam(type="body",name="body",value=jsonData.getBytes());

		return httpService.send().getPrefix();
	}

}