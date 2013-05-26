
$(document).ready(function() {
	$('a.langChange').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		var language = $(this).attr('href');

		var request = $.ajax({
			type : "GET",
			url : "/Lab4Struts2/locale.html",
			data : {
				"request_locale" : language
			}
		});

		request.done(function() {
			alert(language.toUpperCase());
		});

		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		});
	});
});

function ajxNavLoad(pageName) {
	var linkPage = '/Lab4Struts2/' + pageName + '_list.html';
	$('#container').load(linkPage, function(response, status, xhr) {
		if (status == "error") {
			alert("The page could not be loaded");
		}
	});
};

function loading_show() {
	$('#loading').html("<img src='images/loading.gif'/>").fadeIn(20);
};

function loading_hide() {
	$('#loading').fadeOut(20);
};

/**
 * 
 * @param page can be Student, Profesor, Curs, StudCurs, Universitate
 * @param pageNr
 */
function $nxtPg(page, pageNr) {
	loading_show();
	var request = $.ajax({
		type : "GET",
		url : "/Lab4Struts2/" + page + "pg.html",
		data : "pgNr=" + pageNr
	});

	request.done(function(htmlData) {
		$("#ajxTableData").html(htmlData);
		loading_hide();
	});
};