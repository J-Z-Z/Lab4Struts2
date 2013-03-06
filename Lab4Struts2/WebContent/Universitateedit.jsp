<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<s:if test="%{#parameters.id != null || universitateModel.UId}">
	<h1><s:property value="getText('global.edit')" />Universitate</h1>
	
	<s:form method="post" validate="true">
		<s:hidden name="universitateModel.UId" id="unv_edt_id"/>
		<s:textfield name="universitateModel.numeUniver" key="global.denum" id="unv_edt_denum"/>
		<s:textfield name="universitateModel.adresa" key="global.address" id="unv_edt_adresa"/>
		<s:textfield name="universitateModel.telefon" key="global.phone" id="unv_edt_phone"/>
	</s:form>
</s:if>