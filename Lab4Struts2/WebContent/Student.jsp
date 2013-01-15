<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">
	<h1>Edit StudentModel</h1>
	<s:form action="Student_update" method="post" validate="true">

		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" label="Numele Studentului" />
		<s:textfield name="studentModel.prenume"
			label="Prenuumele Studentului" />
		<s:textfield name="studentModel.grupa" label="Grupa Studentului" />
		<s:textfield name="studentModel.email" label="Email-ul Studentului" />
		<s:textfield name="studentModel.telFix" label="Telefonul Studentului" />
		<s:submit />

	</s:form>
</s:if>
<s:else>
	<h1>Insert StudentModel</h1>
	<s:fielderror/>
	<s:form action="Student_add" method="post" validate="true">
		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" label="Numele Studentului" />
		<s:textfield name="studentModel.prenume"
			label="Prenuumele Studentului" />
		<s:textfield name="studentModel.grupa" label="Grupa Studentului" />
		<s:textfield name="studentModel.email" label="Email-ul Studentului" />
		<s:textfield name="studentModel.telFix" label="Telefonul Studentului" />
		<s:submit />

	</s:form>
</s:else>


<s:if test="studentModelList.size()>0">
	<h1>StudentModels List</h1>

	<table id="data">
		<caption>StudentModel</caption>
		<thead>
			<tr>
				<th>ID</th>
				<th>Nume</th>
				<th>Prenume</th>
				<th>Grupa</th>
				<th>Email</th>
				<th>Telefon</th>
				<th>Edit</th>
				<th>Delete</th>
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
					</s:url> <s:a href="%{editURL}">Edit</s:a></td>
				<td><s:url id="deleteURL" action="Student_delete">
						<s:param name="id" value="%{SId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
			</tr>
		</s:iterator>
	</table>
</s:if>
