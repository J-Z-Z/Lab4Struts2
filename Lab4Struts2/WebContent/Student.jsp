<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

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
	<s:fielderror />
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

	<table id="data">
		<caption>Student</caption>
		<thead>
			<tr>
				<th><s:property value="getText('global.studentId')" /></th>
				<th><s:property value="getText('global.lname')" /></th>
				<th><s:property value="getText('global.name')" /></th>
				<th><s:property value="getText('global.group')" /></th>
				<th><s:property value="getText('global.email')" /></th>
				<th><s:property value="getText('global.phone')" /></th>
				<th><s:property value="getText('global.edit')" /></th>
				<th><s:property value="getText('global.delete')" /></th>
				<th align="center">Insert</th>
			</tr>
		</thead>
		<s:action name="listAllStudentModel" />
		<s:iterator value="studentModelList">
			<tr>
				<td><s:property value="SId" /></td>
				<td><s:property value="nume" /></td>
				<td><s:property value="prenume" /></td>
				<td><s:property value="grupa" /></td>
				<td><s:property value="email" /></td>
				<td><s:property value="telFix" /></td>
				<td><s:url id="editURL" action="Student_edit">
						<s:param name="id" value="%{SId}"></s:param>
					</s:url> <s:a href="%{editURL}">
						<s:property value="getText('global.edit')" />
					</s:a></td>
				<td><s:url id="deleteURL" action="Student_delete">
						<s:param name="id" value="%{SId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">
						<s:property value="getText('global.delete')" />
					</s:a></td>
			</tr>
		</s:iterator>
	</table>
</s:if>
