<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
	$(document)
			.ready(
					function() {

						$("#dialog-form")
								.dialog(
										{
											autoOpen : false,
											height : 550,
											width : 350,
											position : [ 200, 300 ],
											modal : true,
											buttons : {
												"Create an student" : function() {
													var request = $
															.ajax({
																url : "Student_add.html",
																type : "POST",
																data : {
																	"studentModel.nume" : $(
																			"#studentModelnume")
																			.val(),
																	"studentModel.prenume" : $(
																			"#studentModelprenume")
																			.val(),
																	"studentModel.grupa" : $(
																			"#studentModelgrupa")
																			.val(),
																	"studentModel.email" : $(
																			"#studentModelemail")
																			.val(),
																	"studentModel.telFix" : $(
																			"#studentModeltelFix")
																			.val(),
																	"struts.validateOnly" : true
																},
																traditional : true
															});

													request.done(function(
															htmlData) {
														console.log(htmlData);
														$("#dialog-form").html(
																htmlData);

													});

												},
												Cancel : function() {
													$(this).dialog("close");

												}
											},
											close : function() {
												allFields.val("").removeClass(
														"ui-state-error");
												$("#dialog-form").dialog(
														"destroy");
											}
										});

						$("#create-user").button().click(function() {
							$("#dialog-form").dialog("open");
						});
					});
</script>



<div id="dialog-form" title="Create new user">
	<p class="validateTips">All form fields are required.</p>

	<s:form method="post" validate="true">
		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname"
			id="studentModelnume" />
		<s:textfield name="studentModel.prenume" key="global.name"
			id="studentModelprenume" />
		<s:textfield name="studentModel.grupa" key="global.group"
			id="studentModelgrupa" />
		<s:textfield name="studentModel.email" key="global.email"
			id="studentModelemail" />
		<s:textfield name="studentModel.telFix" key="global.phone"
			id="studentModeltelFix" />

	</s:form>
</div>



<button id="create-user">Create new user</button>

