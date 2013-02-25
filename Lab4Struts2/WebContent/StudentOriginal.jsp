<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page buffer = "16kb" %>
<s:if test="%{#parameters.id != null}">
	<h1>Edit StudentModel</h1>
	<s:form action="Student_update" method="post" validate="true">

		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname" />
		<s:textfield name="studentModel.prenume" key="global.name" />
		<s:textfield name="studentModel.grupa" key="global.group" />
		<s:textfield name="studentModel.email" key="global.email" />
		<s:textfield name="studentModel.telFix" key="global.phone" />
		<s:submit />

	</s:form>
</s:if>
<s:else>
	<h1>Insert Student</h1>
	<s:form action="Student_add" method="post" validate="true">
		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname" />
		<s:textfield name="studentModel.prenume" key="global.name" />
		<s:textfield name="studentModel.grupa" key="global.group" />
		<s:textfield name="studentModel.email" key="global.email" />
		<s:textfield name="studentModel.telFix" key="global.phone" />
		<s:submit />

	</s:form>
</s:else>


<s:if test="studentModelList.size()>0">
	<h1>Student List</h1>

	
</s:if>
