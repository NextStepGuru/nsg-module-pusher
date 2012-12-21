<cfoutput>


	<div class="tabbable">
		<ul class="nav nav-tabs">
			<li class="active"><a href="##all" data-toggle="tab" id="tab-all">All</a></li>
			<li><a href="##debug" data-toggle="tab" id="tab-debug">Debug <span class="badge"></span></a></li>
			<li><a href="##info" data-toggle="tab" id="tab-info">Info <span class="badge badge-info"></span></a></li>
			<li><a href="##warn" data-toggle="tab" id="tab-warn">Warn <span class="badge badge-warning"></span></a></li>
			<li><a href="##error" data-toggle="tab" id="tab-error">Error <span class="badge badge-important"></span></a></li>
			<li><a href="##fatal" data-toggle="tab" id="tab-fatal">Fatal <span class="badge badge-inverse"></span></a></li>
		</ul>
		<div class="tab-content">
			<div id="all" class="tab-pane active">
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="span2">Timestamp</th>
							<th class="span1">Severity</th>
							<th class="span2">Category</th>
							<th class="span5">Message</th>
							<th class="span2">Extra</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="debug" class="tab-pane">
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="span2">Timestamp</th>
							<th class="span1">Severity</th>
							<th class="span2">Category</th>
							<th class="span5">Message</th>
							<th class="span2">Extra</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="info" class="tab-pane">
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="span2">Timestamp</th>
							<th class="span1">Severity</th>
							<th class="span2">Category</th>
							<th class="span5">Message</th>
							<th class="span2">Extra</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="warn" class="tab-pane">
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="span2">Timestamp</th>
							<th class="span1">Severity</th>
							<th class="span2">Category</th>
							<th class="span5">Message</th>
							<th class="span2">Extra</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="error" class="tab-pane">
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="span2">Timestamp</th>
							<th class="span1">Severity</th>
							<th class="span2">Category</th>
							<th class="span5">Message</th>
							<th class="span2">Extra</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="fatal" class="tab-pane">
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="span2">Timestamp</th>
							<th class="span1">Severity</th>
							<th class="span2">Category</th>
							<th class="span5">Message</th>
							<th class="span2">Extra</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>

<script type="text/javascript">
	// Enable pusher logging - don't include this in production
	Pusher.log = function(message) {
		//if (window.console && window.console.log) window.console.log(message);
	};

	// Flash fallback logging - don't include this in production
	WEB_SOCKET_DEBUG = false;

	var pusher = new Pusher('#getModuleSettings('pusher-monitor')['settings']['pusher']['key']#');
	var channel = pusher.subscribe('#getModuleSettings('pusher-monitor')['settings']['pusher']['channel']#');
	channel.bind('DeBUG', function(data) {
		writeLog(data);
	});
	channel.bind('INFO', function(data) {
		writeLog(data);
	});
	channel.bind('WARN', function(data) {
		writeLog(data);
	});
	channel.bind('ERROR', function(data) {
		writeLog(data);
	});
	channel.bind('FATAL', function(data) {
		writeLog(data);
	});

	$(function() {
		$('a[data-toggle="tab"]').on('shown', function (e) {
			$('a##' + e.target.id + ' > span').text('');
		});
	});
</script>
</cfoutput>
