<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Universitate</title>
</head>
<body>
	<s:if test="%{#parameters.id != null}">
		<h1>Edit Universitate</h1>
		<s:form action="updateUniversitate" method="post">
			<s:hidden name="universitate.UId" />
			<s:textfield name="universitate.numeUniver" label="Denumirea Universitatii" />
			<s:textfield name="universitate.adresa" label="Adresa Universitatii" />
			<s:textfield name="universitate.telefon" label="Telefonul Universitatii" />
			<s:submit />

		</s:form>
	</s:if>
	<s:else>
		<h1>Insert Universitate</h1>
		<s:form action="addUniversitate" method="post">
			<s:hidden name="UId" />
			<s:textfield name="universitate.numeUniver" label="Denumirea Universitatii" />
			<s:textfield name="universitate.adresa" label="Adresa Universitatii" />
			<s:textfield name="universitate.telefon" label="Telefonul Universitatii" />
			<s:submit />

		</s:form>
	</s:else>


	<s:if test="universitateList.size()>0">
		<h1>Universitates List</h1>

		<table id="data">
			<caption>Universitate</caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>Denumire</th>
					<th>Adresa</th>
					<th>Telefon</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<s:action name="listAllUniversitate" />
			<s:iterator value="universitateList">
				<tr>
					<td><s:property value="UId" /></td>
					<td><s:property value="numeUniver" /></td>
					<td><s:property value="adresa" /></td>
					<td><s:property value="telefon" /></td>
					
					<td><s:url id="editURL" action="editUniversitate">
							<s:param name="id" value="%{UId}"></s:param>
						</s:url> <s:a href="%{editURL}">Edit</s:a></td>
					<td><s:url id="deleteURL" action="deleteUniversitate">
							<s:param name="id" value="%{UId}"></s:param>
						</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
				</tr>
			</s:iterator>
		</table>

	</s:if>
</body>
</html>
