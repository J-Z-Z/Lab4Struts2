<%@ taglib prefix="s" uri="/struts-tags"%>

	<s:form method="post" validate="true">
		<s:hidden name="universitateModel.UId" />
		<s:textfield name="universitateModel.numeUniver" key="global.denum" id="univNume"/>
		<s:textfield name="universitateModel.adresa" key="global.address" id="univAdresa"/>
		<s:textfield name="universitateModel.telefon" key="global.phone" id="univTel"/>
	</s:form>