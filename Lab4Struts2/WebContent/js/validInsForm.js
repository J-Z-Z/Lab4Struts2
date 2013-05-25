

$(document).ready(function () {

});

function langEn(){
	var request = $.ajax
	       ({
	           type: "GET",
	           url: "/Lab4Struts2/locale.html",
	           data: {"request_locale":"en"}
	});

	request.done(function(){
	alert("Engligh Content Selected");
	});

	request.fail(function(jqXHR, textStatus) {
		alert( "Request failed: " + textStatus );
	});
	};

function langRo(){
	var request = $.ajax
	       ({
	           type: "GET",
	           url: "/Lab4Struts2/locale.html",
	           data: {"request_locale":"ro"}
	});

	request.done(function(){
	alert("Limba Romana a fost aleasa");
	});

	request.fail(function(jqXHR, textStatus) {
		alert( "Request failed: " + textStatus );
	});
	};


	
function ajxNavLoad(pageName){
	var linkPage = '/Lab4Struts2/' + pageName + '_list.html';
	$('#container').load(linkPage, function(response, status, xhr) {
		if(status=="error"){
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

$nxtPgStudent = function loadData(page) {
    loading_show();
    var request = $.ajax
       ({
           type: "GET",
           url: "/Lab4Struts2/Studentpg.html",
           data: "pgNr=" + page,


       });

    request.done(function (htmlData) {
        $("#ajxTableData").html(htmlData);
        loading_hide();
    });
};

$nxtPgProfesor = function loadData(page) {
    loading_show();
    var request = $.ajax
       ({
           type: "GET",
           url: "/Lab4Struts2/Profesorpg.html",
           data: "pgNr=" + page,

       });

    request.done(function (htmlData) {
        $("#ajxTableData").html(htmlData);
        loading_hide();
    });
};

$nxtPgStudCurs = function loadData(page) {
    loading_show();
    var request = $.ajax
       ({
           type: "GET",
           url: "/Lab4Struts2/StudCurspg.html",
           data: "pgNr=" + page,

       });

    request.done(function (htmlData) {
        $("#ajxTableData").html(htmlData);
        loading_hide();
    });
};

$nxtPgUniversitate = function loadData(page) {
    loading_show();
    var request = $.ajax
       ({
           type: "GET",
           url: "/Lab4Struts2/Universitatepg.html",
           data: "pgNr=" + page,

       });

    request.done(function (htmlData) {
        $("#ajxTableData").html(htmlData);
        loading_hide();
    });
};

$nxtPgCurs = function loadData(page) {
    loading_show();
    var request = $.ajax
       ({
           type: "GET",
           url: "/Lab4Struts2/Curspg.html",
           data: "pgNr=" + page,

       });

    request.done(function (htmlData) {
        $("#ajxTableData").html(htmlData);
        loading_hide();
    });
};
