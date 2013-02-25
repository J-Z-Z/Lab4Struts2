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
                        "Create a student":function () {
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
     $ldMe =    function loadData(page){
            loading_show();                    
         var request=   $.ajax
            ({
                type: "GET",
                url: "/Lab4Struts2/Student_list.html",
                data: "pgNr="+page,
    
            
            });
            
            request.done(function (htmlData) {
                $("#container").html(htmlData );
                loading_hide();
            });
        };
        
        
           
        function chop(page){
            
            
            if(page != 0 && page <= 6){
                loadData(page);
            }
        };
        
        
    });
  
  


	