<%@ taglib prefix="s" uri="/struts-tags"%>



<p class="validateTips">All form fields are required.</p>

<s:form method="post" validate="true">
	<s:hidden name="studentModel.SId" />
	<s:textfield name="studentModel.nume" key="global.lname" id="stdntNume" />
	<s:textfield name="studentModel.prenume" key="global.name"
		id="stdnPrenume" />
	<s:textfield name="studentModel.grupa" key="global.group" id="stdntGrp" />
	<s:textfield name="studentModel.email" key="global.email"
		id="stdntEmail" />
	<s:textfield name="studentModel.telFix" key="global.phone"
		id="stdntTel" />
</s:form>