<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<s:if test="%{#parameters.id != null}">
<div id="StudentEditForm" title="Edit Student">
	<h1>Edit StudentModel</h1>
	<s:form action="Student_update" method="post" validate="true">
		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname" />
		<s:textfield name="studentModel.prenume" key="global.name" />
		<s:textfield name="studentModel.grupa" key="global.group" />
		<s:textfield name="studentModel.email" key="global.email" />
		<s:textfield name="studentModel.telFix" key="global.phone" />
	</s:form>
</div>
</s:if>