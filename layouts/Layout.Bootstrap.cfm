<cfoutput>
	<!DOCTYPE HTML>
	<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
	<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
	<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
	<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!--> <html class=""> <!--<![endif]-->
		<meta charset="utf-8">
		<title>#rc.title#</title>
		<link href="/modules/pusher-monitor/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="/modules/pusher-monitor/assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="/modules/pusher-monitor/assets/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>

		<div class="container">
			<cfif !getPlugin("MessageBox").isEmpty()>
				<div class="row-fluid">
					<div class="alert alert-#getPlugin("MessageBox").getMessage()['type']#">
						<a class="close" href="?"><i class="icon-large icon-remove-circle"></i></a>
						#getPlugin("MessageBox").getMessage()['message']##getPlugin("MessageBox").clearMessage()#
					</div>
				</div>
			</cfif>
			#renderView()#
		</div>

	</body>
</html>

</cfoutput>