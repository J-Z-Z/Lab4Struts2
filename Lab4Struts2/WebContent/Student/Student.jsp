<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>StudentModel</title>
</head>
<body>
	<s:if test="%{#parameters.id != null}">
		<h1>Edit StudentModel</h1>
		<s:form action="updateStudentModel" method="post">

			<s:hidden name="studentModel.SId" />
			<s:textfield name="studentModel.nume" label="Numele StudentModelului" />
			<s:textfield name="studentModel.prenume" label="Prenuumele StudentModelului" />
			<s:textfield name="studentModel.grupa" label="Grupa StudentModelului" />
			<s:textfield name="studentModel.email" label="Email-ul StudentModelului" />
			<s:textfield name="studentModel.telFix" label="Telefonul StudentModelului" />
			<s:submit />

		</s:form>
	</s:if>
	<s:else>
		<h1>Insert StudentModel</h1>
		<s:form action="addStudentModel" method="post">
			<s:hidden name="studentModel.SId" />
			<s:textfield name="studentModel.nume" label="Numele StudentModelului" />
			<s:textfield name="studentModel.prenume" label="Prenuumele StudentModelului" />
			<s:textfield name="studentModel.grupa" label="Grupa StudentModelului" />
			<s:textfield name="studentModel.email" label="Email-ul StudentModelului" />
			<s:textfield name="studentModel.telFix" label="Telefonul StudentModelului" />
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
					<td><s:url id="editURL" action="editStudentModel">
							<s:param name="id" value="%{SId}"></s:param>
						</s:url> <s:a href="%{editURL}">Edit</s:a></td>
					<td><s:url id="deleteURL" action="deleteStudentModel">
							<s:param name="id" value="%{SId}"></s:param>
						</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
				</tr>
			</s:iterator>
		</table>

	</s:if>
</body>
</html>
