<%@ taglib prefix="s" uri="/struts-tags"%>

<s:form method="post" validate="true">
	<s:hidden name="studCursModel.scId" />
	<s:textfield name="studCursModel.studentId" key="global.studentId"
		required="true" id="studCursModelStudentId" />
	<s:textfield name="studCursModel.cursId" key="global.cursId"
		required="true" id="studCursModelCursId" />
</s:form>