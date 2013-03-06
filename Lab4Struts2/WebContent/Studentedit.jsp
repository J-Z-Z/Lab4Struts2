<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<s:if test="%{#parameters.id != null || studentModel.SId!=null}">

	<h1>Edit StudentModel</h1>
	<s:form  method="post" validate="true">
		<s:hidden name="studentModel.SId" id="st_edt_id"/>
		<s:textfield name="studentModel.nume" key="global.lname" id="st_edt_nume" />
		<s:textfield name="studentModel.prenume" key="global.name" id="st_edt_prenume"/>
		<s:textfield name="studentModel.grupa" key="global.group" id="st_edt_grupa"/>
		<s:textfield name="studentModel.email" key="global.email" id="st_edt_email"/>
		<s:textfield name="studentModel.telFix" key="global.phone" id="st_edt_telFix"/>
	</s:form>
</s:if>