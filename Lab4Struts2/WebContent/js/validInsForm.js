  $(document).ready(function () {


        $("#StudentInsForm").dialog(
                {
                    autoOpen:false,
                    width:370,
                    position:[ 250, 50 ],
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
                        $("#stdntNume").val("").removeClass("ui-state-error");
                        $("#stdnPrenume").val("").removeClass("ui-state-error");
                        $("#stdntGrp").val("").removeClass("ui-state-error");
                        $("#stdntEmail").val("").removeClass("ui-state-error");
                        $("#stdntTel").val("").removeClass("ui-state-error");
                        var classErrRemove = $(".errorMessage");
                        if (classErrRemove.length > 0) {
                            for (var i = 0; i < classErrRemove.length; i++) {
                                classErrRemove[i].innerHTML = "";
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
                    position:[ 250, 50 ],
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
                        var classErrRemove = $(".errorMessage");
                        if (classErrRemove.length > 0) {
                            for (var i = 0; i < classErrRemove.length; i++) {
                                classErrRemove[i].innerHTML = "";
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
                    position:[ 250, 50 ],
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
                        var classErrRemove = $(".errorMessage");
                        if (classErrRemove.length > 0) {
                            for (var i = 0; i < classErrRemove.length; i++) {
                                classErrRemove[i].innerHTML = "";
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
                    position:[ 250, 50 ],
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
                        var classErrRemove = $(".errorMessage");
                        if (classErrRemove.length > 0) {
                            for (var i = 0; i < classErrRemove.length; i++) {
                                classErrRemove[i].innerHTML = "";
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
                    position:[ 250, 50 ],
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
                        var classErrRemove = $(".errorMessage");
                        if (classErrRemove.length > 0) {
                            for (var i = 0; i < classErrRemove.length; i++) {
                                classErrRemove[i].innerHTML = "";
                            }
                        }
                        $("#StudCursInsForm").dialog("close");
                    }
                });

        $("#create-StudCurs").button().click(function () {
            $("#StudCursInsForm").dialog("open");
        });
        
        
    });