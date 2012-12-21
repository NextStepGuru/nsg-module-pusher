// js

function writeLog(data){
	$('.tab-content #all > table > tbody').prepend( $('<tr><td>' + data.timestamp + '</td><td>' + data.severity + '</td><td>' + data.category + '</td><td>' + data.message + '</td><td>' + data.extra + '</td></tr>') );
	$('.tab-content #' + data.severity.toLowerCase() + ' > table > tbody').prepend( $('<tr><td>' + data.timestamp + '</td><td>' + data.severity + '</td><td>' + data.category + '</td><td>' + data.message + '</td><td>' + data.extra + '</td></tr>') );
	if(isNumber($('.nav-tabs #tab-' + data.severity.toLowerCase() + ' > span').text())){
		$('.nav-tabs #tab-' + data.severity.toLowerCase() + ' > span').text( parseInt($('.nav-tabs #tab-' + data.severity.toLowerCase() + ' > span').text()) + 1);
	}else{
		$('.nav-tabs #tab-' + data.severity.toLowerCase() + ' > span').text(1);
	}

	if($('.tab-content #all table > tbody > tr').length > 15){
		$('.tab-content #all table > tbody > tr :last').remove();
	}
	if($('.tab-content #' + data.severity.toLowerCase() + ' table > tbody > tr').length > 15){
		$('.tab-content #' + data.severity.toLowerCase() + ' table > tbody > tr :last').remove();
	}
}


function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}