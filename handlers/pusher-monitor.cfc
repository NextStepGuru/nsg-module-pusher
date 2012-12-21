component output="false" cache="true"{


	property name="log"	inject="logbox:logger:{this}";

	public void function preHandler(required any event,required any rc,required any prc){
		addAsset('http://js.pusher.com/1.12/pusher.min.js');
		addAsset('/modules/pusher-monitor/assets/js/pusher.js');
		rc.title = "Pusher Monitor Module";
	}

	public void function index(required any event,required any rc,required any prc){


	}


	public void function test(required any event,required any rc,required any prc){

		log.debug('Test Debug Logging', getTickCount());
		log.info('Test Info Logging', getTickCount());
		log.warn('Test Warn Logging', getTickCount());
		log.error('Test Error Logging', getTickCount());
		log.fatal('Test Fatal Logging', getTickCount());
		event.noRender();
	}


}
