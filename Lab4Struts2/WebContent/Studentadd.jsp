<%@ taglib prefix="s" uri="/struts-tags"%>



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