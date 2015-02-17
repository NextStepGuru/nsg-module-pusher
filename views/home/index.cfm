<cfoutput>

	<cfset logType = ["All","Debug","Info","Warn","Error","Fatal"]>

	<div class="tabbable">
		<ul class="nav nav-tabs">
			<cfloop index="i" from="1" to="6">
				<li <cfif i eq 1>class="active"</cfif>><a href="###ucase(logType[i])#" data-toggle="tab" id="tab-#ucase(logType[i])#">#logType[i]# <span class="badge"></span></a></li>
			</cfloop>
		</ul>
		<div class="tab-content">
			<cfloop index="i" from="1" to="6">
				<div id="#ucase(logType[i])#" class="tab-pane <cfif i eq 1>active</cfif>">
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
			</cfloop>
		</div>
	</div>

<script src="/modules/nsg-module-layout/assets/js/jquery-2.1.3.js" type="text/javascript"></script>
<script src="//js.pusher.com/2.2/pusher.min.js" type="text/javascript"></script>
<script type="text/javascript">
	Pusher.log = function(message) {
	};

	WEB_SOCKET_DEBUG = false;

	var pusher = new Pusher('#getSetting('pusher')['pusherAppKey']#');
	var channel = pusher.subscribe('#getSetting('pusher')['pusherChannel']#');
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
