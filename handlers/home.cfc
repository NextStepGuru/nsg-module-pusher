component output="false" {

	property name="log"	inject="logbox:logger:{this}";

	function index(event,rc,prc){


	}

	function test(event,rc,prc){

		log.debug('Test Debug Logging', getTickCount());
		log.info('Test Info Logging', getTickCount());
		log.warn('Test Warn Logging', getTickCount());
		log.error('Test Error Logging', getTickCount());
		log.fatal('Test Fatal Logging', getTickCount());
		event.noRender();
	}
}
