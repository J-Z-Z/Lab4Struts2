<%@ taglib prefix="s" uri="/struts-tags"%>


<s:form method="post" validate="true">
		<s:hidden name="cursModel.cId" />
		<s:textfield name="cursModel.numeCurs" key="global.denCurs" id="cursModelNumeCurs"/>
		<s:textfield name="cursModel.universitateId" key="global.univId" id="cursModelUniversitateId"/>
		<s:textfield name="cursModel.profesorId" key="global.cursId" id="cursModelProfesorId"/>
</s:form>