<%@ taglib prefix="s" uri="/struts-tags"%>

	<s:if test="%{#parameters.id != null || profesorModel.PId}">
		<h1><s:property value="getText('global.edit')" />Profesor</h1>
		<s:form method="post" validate="true">
			<s:hidden name="profesorModel.PId" id="prf_edt_id"/>
			<s:textfield name="profesorModel.nume" key="global.lname" id="prf_edt_nume"/>
			<s:textfield name="profesorModel.prenume" key="global.name" id="prf_edt_prenume"/>
			<s:textfield name="profesorModel.adresa" key="global.address" id="prf_edt_adresa"/>
		</s:form>
	</s:if>