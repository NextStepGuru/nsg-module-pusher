<cfoutput>
	<br>
	<div class="row">
		<div class="col-xs-12">
			<div id="filters" class="btn-group" role="group" aria-label="buttonbar">
				<button id="btn-ALL" type="button" rel="ALL" class="buttons btn btn-default active">All <span class="badge">0</span></button>
				<button id="btn-DEBUG" type="button" rel="DEBUG" class="buttons btn btn-default">Debug <span class="badge">0</span></button>
				<button id="btn-INFO" type="button" rel="INFO" class="buttons btn btn-default">Info <span class="badge">0</span></button>
				<button id="btn-WARN" type="button" rel="WARN" class="buttons btn btn-default">Warn <span class="badge">0</span></button>
				<button id="btn-ERROR" type="button" rel="ERROR" class="buttons btn btn-default">Error <span class="badge">0</span></button>
				<button id="btn-FATAL" type="button" rel="FATAL" class="buttons btn btn-default">Fatal <span class="badge">0</span></button>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-xs-12">
			<table id="logBox" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th class="timestamp">Timestamp</th>
						<th class="severity">Severity</th>
						<th class="category">Category</th>
						<th class="message">Message</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
<script src="#event.getModuleRoot('nsg-module-layout')#/assets/js/jquery-2.1.3.js" type="text/javascript"></script>
<script src="//js.pusher.com/2.2/pusher.min.js" type="text/javascript"></script>
<script type="text/javascript">
	Pusher.log = function(message) {
	};

	WEB_SOCKET_DEBUG = false;

	var pusher = new Pusher('#getSetting('pusher')['pusherAppKey']#');
	var channel = pusher.subscribe('#getSetting('pusher')['pusherChannel']#');
	channel.bind('DEBUG', function(data) {
		writeLog(data);
	}).bind('INFO', function(data) {
		writeLog(data);
	}).bind('WARN', function(data) {
		writeLog(data);
	}).bind('ERROR', function(data) {
		writeLog(data);
	}).bind('FATAL', function(data) {
		writeLog(data);
	});

	$(function() {
		$('a[data-toggle="tab"]').on('shown', function (e) {
			$('a##' + e.target.id + ' > span').text('');
		});
	});
</script>
</cfoutput>
