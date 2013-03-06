  $(document).ready(function () {


        $("#StudentInsForm").dialog(
                {
                    autoOpen:false,
                    width:370,
                    position:[ 450, 100 ],
                    modal:true,
                    buttons:{
                        "Create a student":function () {
                            var request = $.ajax({
                                url:"Student_add.html",
                                type:"POST",
                                data:{
                                    "studentModel.nume":$("#stdntNume").val(),
                                    "studentModel.prenume":$("#stdnPrenume").val(),
                                    "studentModel.grupa":$("#stdntGrp").val(),
                                    "studentModel.email":$("#stdntEmail").val(),
                                    "studentModel.telFix":$("#stdntTel").val(),
                                    "struts.validateOnly":true
                                },
                                dataType:"html",
                                traditional:true
                            });

                            request.done(function (htmlData) {
                                $("#StudentInsForm").html(htmlData);
                            });
                        },
                        Cancel:function () {
                            $("#stdntNume").val("").removeClass("ui-state-error");
                            $(this).dialog("close");
                        }
                    },
                    close:function () {
                        $("#stdntNume").val("");
                        $("#stdnPrenume").val("");
                        $("#stdntGrp").val("");
                        $("#stdntEmail").val("");
                        $("#stdntTel").val("");
                        var $errInpClear = $('tr[errorFor]');
                        if ($errInpClear.length > 0) {
                            for (var i = 0; i < $errInpClear.length; i++) {
                            	$errInpClear[i].remove();
                            }
                        }
                        $("#StudentInsForm").dialog("close");
                    }
                });

        $("#create-Student").button().click(function () {
            $("#StudentInsForm").dialog("open");
        });
        
        $("#UniversitateInsForm").dialog(
                {
                    autoOpen:false,
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
                                $("#UniversitateInsForm").html(htmlData);
                            });
                            
                        },
                        Cancel:function () {
                            $(this).dialog("close");
                        }
                    },
                    close:function () {
                        $("#univNume").val("").removeClass("ui-state-error");
                        $("#univAdresa").val("").removeClass("ui-state-error");
                        $("#univTel").val("").removeClass("ui-state-error");
                        var $errInpClear = $('tr[errorFor]');
                        if ($errInpClear.length > 0) {
                            for (var i = 0; i < $errInpClear.length; i++) {
                            	$errInpClear[i].remove();
                            }
                        }
                        $("#UniversitateInsForm").dialog("close");
                    }
                });

        $("#create-Universitate").button().click(function () {
            $("#UniversitateInsForm").dialog("open");
        });
        
        $("#CursInsForm").dialog(
                {
                    autoOpen:false,
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
                                $("#CursInsForm").html(htmlData);
                            });
                        },
                        Cancel:function () {
                            $(this).dialog("close");
                        }
                    },
                    close:function () {
                        $("#cursModelNumeCurs").val("").removeClass("ui-state-error");
                        $("#cursModelUniversitateId").val("").removeClass("ui-state-error");
                        $("#cursModelProfesorId").val("").removeClass("ui-state-error");
                        var $errInpClear = $('tr[errorFor]');
                        if ($errInpClear.length > 0) {
                            for (var i = 0; i < $errInpClear.length; i++) {
                            	$errInpClear[i].remove();
                            }
                        }
                        $("#CursInsForm").dialog("close");
                    }
                });

        $("#create-Curs").button().click(function () {
            $("#CursInsForm").dialog("open");
        });
        
        $("#ProfesorInsForm").dialog(
                {
                    autoOpen:false,
                    width:370,
                    position:[ 450, 100 ],
                    modal:true,
                    buttons:{
                        "Create Profesor":function () {
                            var request = $.ajax({
                                url:"Profesor_add.html",
                                type:"POST",
                                data:{
                                    "profesorModel.nume":$("#profesorModelNume").val(),
                                    "profesorModel.prenume":$("#profesorModelPrenume").val(),
                                    "profesorModel.adresa":$("#profesorModelAdresa").val(),
                                    "struts.validateOnly":true
                                },
                                dataType:"html",
                                traditional:true
                            });

                            request.done(function (htmlData) {
                                $("#ProfesorInsForm").html(htmlData);
                            });
                        },
                        Cancel:function () {
                            $(this).dialog("close");
                        }
                    },
                    close:function () {
                        $("#profesorModelNume").val("").removeClass("ui-state-error");
                        $("#profesorModelPrenume").val("").removeClass("ui-state-error");
                        $("#profesorModelAdresa").val("").removeClass("ui-state-error");
                        var $errInpClear = $('tr[errorFor]');
                        if ($errInpClear.length > 0) {
                            for (var i = 0; i < $errInpClear.length; i++) {
                            	$errInpClear[i].remove();
                            }
                        }
                        $("#ProfesorInsForm").dialog("close");
                    }
                });

        $("#create-Profesor").button().click(function () {
            $("#ProfesorInsForm").dialog("open");
        });
        
        $("#StudCursInsForm").dialog(
                {
                    autoOpen:false,
                    width:370,
                    position:[ 450, 100 ],
                    modal:true,
                    buttons:{
                        "Create a Student Curs":function () {
                            var request = $.ajax({
                                url:"StudCurs_add.html",
                                type:"POST",
                                data:{
                                    "studCursModel.studentId":$("#studCursModelStudentId").val(),
                                    "studCursModel.cursId":$("#studCursModelCursId").val(),
                                    "struts.validateOnly":true
                                },
                                dataType:"html",
                                traditional:true
                            });

                            request.done(function (htmlData) {
                                $("#StudCursInsForm").html(htmlData);
                            });
                        },
                        Cancel:function () {
                            $(this).dialog("close");
                        }
                    },
                    close:function () {
                        $("#studCursModelStudentId").val("").removeClass("ui-state-error");
                        $("#studCursModelCursId").val("").removeClass("ui-state-error");
                        var $errInpClear = $('tr[errorFor]');
                        if ($errInpClear.length > 0) {
                            for (var i = 0; i < $errInpClear.length; i++) {
                            	$errInpClear[i].remove();
                            }
                        }
                        $("#StudCursInsForm").dialog("close");
                    }
                });

        $("#create-StudCurs").button().click(function () {
            $("#StudCursInsForm").dialog("open");
        });
        

        
        
        
        
        function loading_show(){
            $('#loading').html("<img src='images/loading.gif'/>").fadeIn('fast');
        };
        function loading_hide(){
            $('#loading').fadeOut('fast');
        };                
     $nxtPgStudent =    function loadData(page){
            loading_show();                    
         var request=   $.ajax
            ({
                type: "GET",
                url: "/Lab4Struts2/Studentpg.html",
                data: "pgNr="+page,
    
            
            });
            
            request.done(function (htmlData) {
                $("#ajxTableData").html(htmlData );
                loading_hide();
            });
        };
        
        $nxtPgProfesor =    function loadData(page){
            loading_show();                    
         var request=   $.ajax
            ({
                type: "GET",
                url: "/Lab4Struts2/Profesorpg.html",
                data: "pgNr="+page,
                
            });
            
            request.done(function (htmlData) {
                $("#ajxTableData").html(htmlData );
                loading_hide();
            });
        };
           
        $nxtPgStudCurs =    function loadData(page){
            loading_show();                    
         var request=   $.ajax
            ({
                type: "GET",
                url: "/Lab4Struts2/StudCurspg.html",
                data: "pgNr="+page,
                
            });
            
            request.done(function (htmlData) {
                $("#ajxTableData").html(htmlData );
                loading_hide();
            });
        };
        
        $nxtPgUniversitate =    function loadData(page){
            loading_show();                    
         var request=   $.ajax
            ({
                type: "GET",
                url: "/Lab4Struts2/Universitatepg.html",
                data: "pgNr="+page,
                
            });
            
            request.done(function (htmlData) {
                $("#ajxTableData").html(htmlData );
                loading_hide();
            });
        };
        
        $nxtPgCurs =    function loadData(page){
            loading_show();                    
         var request=   $.ajax
            ({
                type: "GET",
                url: "/Lab4Struts2/Curspg.html",
                data: "pgNr="+page,
                
            });
            
            request.done(function (htmlData) {
                $("#ajxTableData").html(htmlData );
                loading_hide();
            });
        };
        
        
    });
  
  
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
 * Function for editing Curs page 
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
 * Function for editing the Profesor and Update it
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
 * Function for editing the StudCurs and Update it
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
        	 $("#delUnivLink"+univDeleteById).parent().parent().remove();
             
             
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
        	 $("#delStudentLink"+studDeleteById).parent().parent().remove();
             
             
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
        	 $("#delCursLink"+cursDeleteById).parent().parent().remove();
             
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
        	 $("#delStudCursLink"+studCursDeleteById).parent().parent().remove();
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
        	 $("#delProfLink"+profesorDeleteById).parent().parent().remove();
         });
         
         request.fail(function(jqXHR, textStatus) {
 			alert( "Request failed: " + textStatus );
 		});
	}
};