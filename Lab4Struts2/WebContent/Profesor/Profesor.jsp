<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>ProfesorModel</title>
</head>
<body>
	<s:if test="%{#parameters.id != null}">
		<h1>Edit ProfesorModel</h1>
		<s:form action="updateProfesorModel" method="post">
			<s:hidden name="profesorModel.PId" />
			<s:textfield name="profesorModel.nume" label="Numele ProfesorModelului" />
			<s:textfield name="profesorModel.prenume" label="Prenuumele ProfesorModelului" />
			<s:textfield name="profesorModel.adresa" label="Adresa ProfesorModelului" />
			<s:submit />

		</s:form>
	</s:if>
	<s:else>
		<h1>Insert ProfesorModel</h1>
		<s:form action="addProfesorModel" method="post">
			<s:hidden name="PId" />
			<s:textfield name="profesorModel.nume" label="Numele ProfesorModelului" />
			<s:textfield name="profesorModel.prenume" label="Prenuumele ProfesorModelului" />
			<s:textfield name="profesorModel.adresa" label="Adresa ProfesorModelului" />
			<s:submit />
		</s:form>
	</s:else>

	<s:if test="profesorModelList.size()>0">
		<h1>ProfesorModels List</h1>

		<table id="data">
			<caption>ProfesorModel</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nume</th>
					<th>Prenume</th>
					<th>Adresa</th>
					<th align="center">Insert</th>
				</tr>
			</thead>
			<s:action name="listAllProfesorModel" />
			<s:iterator value="profesorModelList">
				<tr>
					<td><s:property value="PId" /></td>
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="adresa" /></td>
					<td><s:url id="editURL" action="editProfesorModel">
							<s:param name="id" value="%{PId}"></s:param>
						</s:url> <s:a href="%{editURL}">Edit</s:a></td>
					<td><s:url id="deleteURL" action="deleteProfesorModel">
							<s:param name="id" value="%{PId}"></s:param>
						</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
				</tr>
			</s:iterator>
		</table>
	</s:if>
</body>
</html>
