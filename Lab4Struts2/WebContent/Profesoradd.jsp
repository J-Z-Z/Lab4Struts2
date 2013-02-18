<%@ taglib prefix="s" uri="/struts-tags"%>

<s:form method="post" validate="true">
	<s:hidden name="PId" />
	<s:textfield name="profesorModel.nume" key="global.lname"
		id="profesorModelNume" />
	<s:textfield name="profesorModel.prenume" key="global.name"
		id="profesorModelPrenume" />
	<s:textfield name="profesorModel.adresa" key="global.address"
		id="profesorModelAdresa" />
</s:form>