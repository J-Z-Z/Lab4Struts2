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
    $('#loading').html("<img src='images/loading.gif'/>").fadeIn('fast');
};

function loading_hide() {
    $('#loading').fadeOut('fast');
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



  
/**
 * Object that executes the editing of Student Object
 * @param Id of the Student that will be edited and updated
 */ 
var editStudent = function(IdOfStudent){
	var loadFunction = $("#StudentEditForm").load("Studentedit.html?id="+IdOfStudent, function(){
		$("#StudentEditForm").dialog(
		            {
		            	
		                autoOpen:true,
		                width:370,
		                position:[ 450, 100 ],
		                modal:true,
		                buttons:{
		                    "Update student":function () {
		                        var request = $.ajax({
		                            url:"Studentupdate.html",
		                            type:"POST",
		                            data:{
										"studentModel.SId": $("#st_edt_id").val(),
		                                "studentModel.nume":$("#st_edt_nume").val(),
		                                "studentModel.prenume":$("#st_edt_prenume").val(),
		                                "studentModel.grupa":$("#st_edt_grupa").val(),
		                                "studentModel.email":$("#st_edt_email").val(),
		                                "studentModel.telFix":$("#st_edt_telFix").val(),
		                                "struts.validateOnly":true
		                            },
		                            dataType:"html",
		                            traditional:true
		                        });

		                        request.done(function (htmlData) {
		                            $("#StudentEditForm").html(htmlData);
		                        });
		                        
		                        request.fail(function(jqXHR, textStatus) {
		                			alert( "Request failed: " + textStatus );
		                		});
		                    },
		                    Cancel:function () {
		                        $(this).dialog("close");
		                    }
		                },
		                close:function () {
							$("#st_edt_id").val(""),
		                    $("#st_edt_nume").val("");
		                    $("#st_edt_prenume").val("");
		                    $("#st_edt_grupa").val("");
		                    $("#st_edt_email").val("");
		                    $("#st_edt_telFix").val("");
		                    var $errInpClear = $('tr[errorFor]');
		                    if ($errInpClear.length > 0) {
		                        for (var i = 0; i < $errInpClear.length; i++) {
		                        	$errInpClear[i].remove();
		                        }
		                    }
		                    $("#StudentEditForm").dialog("close");
		                }
		            });
		});
	
	loadFunction();
};


/**
 * Object that executes the editing of the Curs 
 * @param Id of  the curs that will be edited and updated
 */
var editCurs = function(IdOfCurs){
	$("#CursEditForm").load("Cursedit.html?id="+IdOfCurs, function(){
		$("#CursEditForm").dialog(
		            {
		            	
		                autoOpen:true,
		                width:370,
		                position:[ 450, 100 ],
		                modal:true,
		                buttons:{
		                    "Update Curs":function () {
		                        var request = $.ajax({
		                            url:"Cursupdate.html",
		                            type:"POST",
		                            data:{
										"cursModel.cursId": $("#crs_edt_id").val(),
		                                "cursModel.numeCurs":$("#crs_edt_numeCurs").val(),
		                                "cursModel.universitateId":$("#crs_edt_univId").val(),
		                                "cursModel.profesorId":$("#crs_edt_profId").val(),
		                                "struts.validateOnly":true
		                            },
		                            dataType:"html",
		                            traditional:true
		                        });

		                        request.done(function (htmlData) {
		                            $("#CursEditForm").html(htmlData);
		                        });
		                        
		                        request.fail(function(jqXHR, textStatus) {
		                			alert( "Request failed: " + textStatus );
		                		});
		                    },
		                    Cancel:function () {
		                        $(this).dialog("close");
		                    }
		                },
		                close:function () {
							$("#crs_edt_id").val(""),
		                    $("#crs_edt_numeCurs").val("");
		                    $("#crs_edt_univId").val("");
		                    $("#crs_edt_profId").val("");
		                    var $errInpClear = $('tr[errorFor]');
		                    if ($errInpClear.length > 0) {
		                        for (var i = 0; i < $errInpClear.length; i++) {
		                        	$errInpClear[i].remove();
		                        }
		                    }
		                    $("#CursEditForm").dialog("close");
		                }
		            });
		});
};



/**
 * Object for editing the Profesor and updating it
 * @param Id if the Profesor
 * 
 */
var editProf = function(IdOfProf){
	$("#ProfesorEditForm").load("Profesoredit.html?id="+IdOfProf, function(){
		$("#ProfesorEditForm").dialog(
		            {
		            	
		                autoOpen:true,
		                width:370,
		                position:[ 450, 100 ],
		                modal:true,
		                buttons:{
		                    "Update Profesor":function () {
		                        var request = $.ajax({
		                            url:"Profesorupdate.html",
		                            type:"POST",
		                            data:{
										"profesorModel.PId": $("#prf_edt_id").val(),
		                                "profesorModel.nume":$("#prf_edt_nume").val(),
		                                "profesorModel.prenume":$("#prf_edt_prenume").val(),
		                                "profesorModel.adresa":$("#prf_edt_adresa").val(),
		                                "struts.validateOnly":true
		                            },
		                            dataType:"html",
		                            traditional:true
		                        });

		                        request.done(function (htmlData) {
		                            $("#ProfesorEditForm").html(htmlData);
		                        });
		                        
		                        request.fail(function(jqXHR, textStatus) {
		                			alert( "Request failed: " + textStatus );
		                		});
		                    },
		                    Cancel:function () {
		                        $(this).dialog("close");
		                    }
		                },
		                close:function () {
							$("#prf_edt_id").val(""),
		                    $("#prf_edt_nume").val("");
		                    $("#prf_edt_prenume").val("");
		                    $("#prf_edt_adresa").val("");
		                    var $errInpClear = $('tr[errorFor]');
		                    if ($errInpClear.length > 0) {
		                        for (var i = 0; i < $errInpClear.length; i++) {
		                        	$errInpClear[i].remove();
		                        }
		                    }
		                    $("#ProfesorEditForm").dialog("close");
		                }
		            });
		});
};


/**
 * Object for editing the StudCurs and updating
 * @param Id if the Student Curs
 * 
 */
var editStudCurs = function(IdOfStudCurs){
	$("#StudCursEditForm").load("StudCursedit.html?id="+IdOfStudCurs, function(){
		$("#StudCursEditForm").dialog(
		            {
		            	
		                autoOpen:true,
		                width:370,
		                position:[ 450, 100 ],
		                modal:true,
		                buttons:{
		                    "Update Student-Curs":function () {
		                        var request = $.ajax({
		                            url:"StudCursupdate.html",
		                            type:"POST",
		                            data:{
										"studCursModel.scId": $("#stdc_edt_id").val(),
		                                "studCursModel.studentId":$("#stdc_edt_sId").val(),
		                                "studCursModel.cursId":$("#stdc_edt_cId").val(),
		                                "struts.validateOnly":true
		                            },
		                            dataType:"html",
		                            traditional:true
		                        });

		                        request.done(function (htmlData) {
		                            $("#StudCursEditForm").html(htmlData);
		                        });
		                        
		                        request.fail(function(jqXHR, textStatus) {
		                			alert( "Request failed: " + textStatus );
		                		});
		                    },
		                    Cancel:function () {
		                        $(this).dialog("close");
		                    }
		                },
		                close:function () {
							$("#stdc_edt_id").val(""),
		                    $("#stdc_edt_sId").val("");
		                    $("#stdc_edt_cId").val("");
		                    var $errInpClear = $('tr[errorFor]');
		                    if ($errInpClear.length > 0) {
		                        for (var i = 0; i < $errInpClear.length; i++) {
		                        	$errInpClear[i].remove();
		                        }
		                    }
		                    $("#StudCursEditForm").dialog("close");
		                }
		            });
		});
};


/**
 * Function for editing the Universitate and Update it
 * @param Id if the Universitate
 * 
 */
var editUniversitate = function(IdOfUniv){
	$("#UniversitateEditForm").load("Universitateedit.html?id="+IdOfUniv, function(){
		$("#UniversitateEditForm").dialog(
		            {
		            	
		                autoOpen:true,
		                width:370,
		                position:[ 450, 100 ],
		                modal:true,
		                buttons:{
		                    "Update Universitate":function () {
		                        var request = $.ajax({
		                            url:"Universitateupdate.html",
		                            type:"POST",
		                            data:{
										"universitateModel.UId": $("#unv_edt_id").val(),
		                                "universitateModel.numeUniver":$("#unv_edt_denum").val(),
		                                "universitateModel.adresa":$("#unv_edt_adresa").val(),
		                                "universitateModel.telefon": $("#unv_edt_phone").val(),
		                                "struts.validateOnly":true
		                            },
		                            dataType:"html",
		                            traditional:true
		                        });

		                        request.done(function (htmlData) {
		                            $("#UniversitateEditForm").html(htmlData);
		                        });
		                        
		                        request.fail(function(jqXHR, textStatus) {
		                			alert( "Request failed: " + textStatus );
		                		});
		                    },
		                    Cancel:function () {
		                        $(this).dialog("close");
		                    }
		                },
		                close:function () {
							$("#unv_edt_id").val(""),
		                    $("#unv_edt_denum").val("");
		                    $("#unv_edt_adresa").val("");
		                    $("#unv_edt_phone").val("");
		                    var $errInpClear = $('tr[errorFor]');
		                    if ($errInpClear.length > 0) {
		                        for (var i = 0; i < $errInpClear.length; i++) {
		                        	$errInpClear[i].remove();
		                        }
		                    }
		                    $("#UniversitateEditForm").dialog("close");
		                }
		            });
		});
};


/**
 * Function for deleting University from Db
 * @param Id of universitate
 */
var deleteUniversitate = function(univDeleteById){
    
	if(confirm("Delete Record ?")){
		 var request = $.ajax({
             url:"Universitate_delete.html",
             data:{"id":univDeleteById},
             dataType:"html",
             traditional:true
         });

         request.done(function () {
        	 $("#delUnivLink"+univDeleteById).remove();
             
             
         });
         
         request.fail(function(jqXHR, textStatus) {
 			alert( "Request failed: " + textStatus );
 		});
	}
};


/**
 * Function for deleting Student from Db
 * @param Id of student
 */
var deleteStudent = function(studDeleteById){
    
	if(confirm("Delete Record ?")){
		 var request = $.ajax({
             url:"Student_delete.html",
             data:{"id":studDeleteById},
             dataType:"html",
             traditional:true
         });

         request.done(function () {
        	 $("#delStudentLink"+studDeleteById).remove();
             
             
         });
         
         request.fail(function(jqXHR, textStatus) {
 			alert( "Request failed: " + textStatus );
 		});
	}
};


/**
 * Function for deleting Curs from Db
 * @param Id of curs
 */
var deleteCurs = function(cursDeleteById){
    
	if(confirm("Delete Record ?")){
		 var request = $.ajax({
             url:"Curs_delete.html",
             data:{"id":cursDeleteById},
             dataType:"html",
             traditional:true
         });

         request.done(function () {
        	 $("#delCursLink"+cursDeleteById).remove();
        	 
             
         });
         
         request.fail(function(jqXHR, textStatus) {
 			alert( "Request failed: " + textStatus );
 		});
	}
};

/**
 * Function for deleting Student Curs from Db
 * @param Id of studCurs
 */
var deleteStudCurs = function(studCursDeleteById){
    
	if(confirm("Delete Record ?")){
		 var request = $.ajax({
             url:"StudCurs_delete.html",
             data:{"id":studCursDeleteById},
             dataType:"html",
             traditional:true
         });

         request.done(function () {
        	 $("#delStudCursLink"+studCursDeleteById).remove();
         });
         
         request.fail(function(jqXHR, textStatus) {
 			alert( "Request failed: " + textStatus );
 		});
	}
};

/**
 * Function for deleting Profesor from Db
 * @param Id of profesor
 */
var deleteProfesor = function(profesorDeleteById){
    
	if(confirm("Delete Record ?")){
		 var request = $.ajax({
             url:"Profesor_delete.html",
             data:{"id":profesorDeleteById},
             dataType:"html",
             traditional:true
         });

         request.done(function () {
        	 $("#delProfLink"+profesorDeleteById).remove();
         });
         
         request.fail(function(jqXHR, textStatus) {
 			alert( "Request failed: " + textStatus );
 		});
	}
};
/**
 * Add Student Curs function
 * After insertion of object and displaying success page, will give oportunity to insert another
 */
function addStudCurs() {
    $("#StudCursAddForm").load("StudCursadd.jsp", function () {
        $("#StudCursAddForm").dialog(
        {
            title: "Insert Student-Curs",
            autoOpen: true,
            width: 370,
            position: [450, 100],
            modal: true,
            buttons: {
                "Create a Student Curs": function () {
                    var request = $.ajax({
                        url: "StudCurs_add.html",
                        type: "POST",
                        data: {
                            "studCursModel.studentId": $("#studCursModelStudentId").val(),
                            "studCursModel.cursId": $("#studCursModelCursId").val(),
                            "struts.validateOnly": true
                        },
                        dataType: "html",
                        traditional: true
                    });

                    request.done(function (htmlData) {
                        $("#StudCursAddForm").html(htmlData);
                    });
                },
                Cancel: function () {
                    $(this).dialog("close");
                },
                "Insert Another": function () {
                    addStudCurs();
                }
            },
            close: function () {
                $("#StudCursAddForm").dialog("close");
            }
        });

    });
};


/**
 * Function for adding Student
 * Doesn't take parameters, will load dinamically the form for data insertion for url specified
 * in this case Studentadd.jsp and load it into div StudentAddForm
 */
function addStudent() {
    $("#StudentAddForm").load("Studentadd.jsp", function () {
        $("#StudentAddForm").dialog(
        {
            autoOpen: true,
            width: 370,
            position: [450, 100],
            modal: true,
            buttons: {
                "Create a student": function () {
                    var request = $.ajax({
                        url: "Student_add.html",
                        type: "POST",
                        data: {
                            "studentModel.nume": $("#stdntNume").val(),
                            "studentModel.prenume": $("#stdnPrenume").val(),
                            "studentModel.grupa": $("#stdntGrp").val(),
                            "studentModel.email": $("#stdntEmail").val(),
                            "studentModel.telFix": $("#stdntTel").val(),
                            "struts.validateOnly": true
                        },
                        dataType: "html",
                        traditional: true
                    });

                    request.done(function (htmlData) {
                        $("#StudentAddForm").html(htmlData);
                    });
                },
                Cancel: function () {
                    $(this).dialog("close");
                },
                "Insert Another": function () {
                    addStudent();
                }
            },
            close: function () {
                $("#StudentAddForm").dialog("close");
            }
        });

    });
};

/**
 *Function for inserting the University Object
 *Will load window form from the url specified 
 * 
*/
function addUniversitate() {
    $("#UnivAddForm").load("Universitateadd.jsp", function () {
        $("#UnivAddForm").dialog(
         {
                    autoOpen:true,
                    width:370,
                    position:[ 450, 100 ],
                    modal:true,
                    buttons:{
                        "Create a Universitate":function () {
                            var request = $.ajax({
                                url:"Universitate_add.html",
                                type:"POST",
                                data:{
                                    "universitateModel.numeUniver":$("#univNume").val(),
                                    "universitateModel.adresa":$("#univAdresa").val(),
                                    "universitateModel.telefon":$("#univTel").val(),
                                    "struts.validateOnly":true
                                },
                                dataType:"html",
                                traditional:true
                            });

                            request.done(function (htmlData) {
                                $("#UnivAddForm").html(htmlData);
                            });
                            
                        },
                        Cancel:function () {
                            $(this).dialog("close");
                        },
						"Insert Another": function(){
							addUniversitate();
						}
                    },
                    close:function () {
                        $("#UnivAddForm").dialog("close");
                    }
                });

    });
};

/**
 * Function for inserting new Curs Object
 * Will load  the curs Object from another page into div specified
 */
function addCurs() {
    $("#CursAddForm").load("Cursadd.jsp", function () {
        $("#CursAddForm").dialog(
         {
					title: "Insert Curs ",
                    autoOpen:true,
                    width:370,
                    position:[ 'center', 100 ],
                    modal:true,
                    buttons:{
                        "Create Curs":function () {
                            var request = $.ajax({
                                url:"Curs_add.html",
                                type:"POST",
                                data:{
                                    "cursModel.numeCurs":$("#cursModelNumeCurs").val(),
                                    "cursModel.universitateId":$("#cursModelUniversitateId").val(),
                                    "cursModel.profesorId":$("#cursModelProfesorId").val(),
                                    "struts.validateOnly":true
                                },
                                dataType:"html",
                                traditional:true
                            });

                            request.done(function (htmlData) {
                                $("#CursAddForm").html(htmlData);
                            });
                        },
                        Cancel:function () {
                            $(this).dialog("close");
                        },
						"Insert Another": function(){
							addCurs();
						}
                    },
                    close:function () {
                        $("#CursAddForm").dialog("close");
                    }
                });
    });
};

/**
 * Function for adding Profesor object
 * will load form dinamically into dialog window
 * after insertion will display the success message 
 */
function addProf() {
    $("#ProfAddForm").load("Profesoradd.jsp", function () {
        $("#ProfAddForm").dialog(
        {
            autoOpen: true,
            width: 370,
            position: [450, 100],
            modal: true,
            buttons: {
                "Create Profesor": function () {
                    var request = $.ajax({
                        url: "Profesor_add.html",
                        type: "POST",
                        data: {
                            "profesorModel.nume": $("#profesorModelNume").val(),
                            "profesorModel.prenume": $("#profesorModelPrenume").val(),
                            "profesorModel.adresa": $("#profesorModelAdresa").val(),
                            "struts.validateOnly": true
                        },
                        dataType: "html",
                        traditional: true
                    });

                    request.done(function (htmlData) {
                        $("#ProfAddForm").html(htmlData);
                    });
                },
                Cancel: function () {
                    $(this).dialog("close");
                },
                "Insert Another": function () {
                    addProf();
                }
            },
            close: function () {
                $("#ProfAddForm").dialog("close");
            }
        });

    });
};