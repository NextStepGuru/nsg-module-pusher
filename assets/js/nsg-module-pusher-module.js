var logSeverity = ["DEBUG","INFO","WARN","ERROR","FATAL"];
$(function() {

	$('.buttons').on('click',function(e){
		$('#filters .active').removeClass('active');
		$(this).addClass('active');

		$('#logBox > tbody tr').removeClass('hidden');
		for( var key in logSeverity){
			if( logSeverity[key] != $(this).attr('rel') && $(this).attr('rel') != 'ALL' ){
				$('#logBox > tbody tr.' + logSeverity[key]).addClass('hidden');
			}
		}
	});

});

function writeLog(data){
	var hiddenClass = "";

	if( $('#filters .active').attr('rel') != data.SEVERITY &&  $('#filters .active').attr('rel') != 'ALL'){
		hiddenClass = " hidden";
	}

	$('#logBox > tbody').prepend(
		$('<tr class="' + data.SEVERITY + hiddenClass + '"><td>' + data.TIMESTAMP + '</td>' +
			  '<td>' + data.SEVERITY + '</td>' +
			  '<td>' + data.CATEGORY + '</td>' +
			  '<td>' + data.MESSAGE + '</td></tr>') );

	for( var key in logSeverity){
		$('#btn-' + logSeverity[key] + ' > span').text($('.' + logSeverity[key]).length);

		if($('#logBox > tbody > tr.' + data.SEVERITY).length > 100){
			$('#logBox > tbody > tr.' + data.SEVERITY + ':last').remove();
		}
	}
	$('#btn-ALL > span').text($('#logBox > tbody >  tr').length);

	if($('#logBox > tbody > tr').length > 500){
		$('#logBox > tbody > tr:last').remove();
	}

}

function isNumber(n) {
	return !isNaN(parseFloat(n)) && isFinite(n);
}