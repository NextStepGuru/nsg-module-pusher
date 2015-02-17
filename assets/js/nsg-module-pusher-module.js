// js

function writeLog(data){

	$('.tab-content #ALL > table > tbody').prepend( $('<tr><td>' + data.TIMESTAMP + '</td><td>' + data.SEVERITY + '</td><td>' + data.CATEGORY + '</td><td>' + data.MESSAGE + '</td><td>' + data.EXTRA + '</td></tr>') );
	$('.tab-content #' + data.SEVERITY + ' > table > tbody').prepend( $('<tr><td>' + data.TIMESTAMP + '</td><td>' + data.SEVERITY + '</td><td>' + data.CATEGORY + '</td><td>' + data.MESSAGE + '</td><td>' + data.EXTRA + '</td></tr>') );
	if(isNumber($('.nav-tabs #tab-' + data.SEVERITY + ' > span').text())){
		$('.nav-tabs #tab-' + data.SEVERITY + ' > span').text( parseInt($('.nav-tabs #tab-' + data.SEVERITY + ' > span').text()) + 1);
	}else{
		$('.nav-tabs #tab-' + data.SEVERITY + ' > span').text(1);
	}

	if($('.tab-content #ALL table > tbody > tr').length > 15){
		$('.tab-content #ALL table > tbody > tr :last').remove();
	}
	if($('.tab-content #' + data.SEVERITY + ' table > tbody > tr').length > 15){
		$('.tab-content #' + data.SEVERITY + ' table > tbody > tr :last').remove();
	}
}


function isNumber(n) {
	return !isNaN(parseFloat(n)) && isFinite(n);
}