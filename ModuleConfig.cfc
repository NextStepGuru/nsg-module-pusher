component {

	// Module Properties
	this.title 				= "Pusher Monitor";
	this.author 			= "Jeremy R DeYoung";
	this.webURL 			= "http://www.LunarFly.com/admin/pusher-monitor";
	this.description 		= "";
	this.version			= "1.0";

	this.viewParentLookup 	= false;
	this.layoutParentLookup = false;

	this.entryPoint			= "pusher-monitor:pusher-monitor.index";

	function configure(){

		// module settings - stored in modules.name.settings
		settings = {
			pusher = {
					channel	= "LogBox",
					id 		= "{{Need Pusher App_ID}}",
					key 	= "{{Need Pusher Key}}",
					secret 	= "{{Need Pusher Secret}}"
				}
		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Bootstrap.cfm"
		};

		// SES Routes
		routes = [

		];

	}

}