<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/style.css" rel="stylesheet"
	type="text/css">
<title>Curs</title>
</head>
<body>

	<s:if test="%{#parameters.id != null}">
		<h1>Edit Curs</h1>
		<s:form action="updateCursModel" method="post">

			<s:hidden name="cursModel.cId" />
			<s:textfield name="cursModel.numeCurs" label="Denumirea Cursului" />
			<s:textfield name="cursModel.uId"
				label="Id Universitate" />
			<s:textfield name="cursModel.pId" label="Id Profesor" />
			<s:submit />

		</s:form>
	</s:if>
	<s:else>
		<h1>Insert Curs</h1>
		<s:form action="addCursModel" method="post">

			<s:hidden name="cursModel.cId" />
			<s:textfield name="cursModel.numeCurs" label="Denumirea Cursului" />
			<s:textfield name="cursModel.uId"
				label="Id Universitate" />
			<s:textfield name="cursModel.pId" label="Id Profesor" />
			<s:submit />

		</s:form>
	</s:else>

	<s:if test="cursModelList.size()>0">
		<h1>Curs List</h1>

		<table id="data">
			<caption>Curs</caption>
			<thead>
				<tr>
					<td>Id Curs</td>
					<td>Nume Curs</td>
					<td>Universitate ID</td>
					<td>Profesor ID</td>
				</tr>
			</thead>
			<s:action name="listAllCurs" />
			<s:iterator value="cursModelList">

				<tr>
					<td><s:property value="cId" /></td>
					<td><s:property value="numeCurs" /></td>
					<td><s:property value="uId" /></td>
					<td><s:property value="pId" /></td>
					<td><s:url id="editURL" action="editCursModel">
							<s:param name="id" value="%{cId}"></s:param>
						</s:url> <s:a href="%{editURL}">Edit</s:a></td>
					<td><s:url id="deleteURL" action="deleteCursModel">
							<s:param name="id" value="%{cId}"></s:param>
						</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
				</tr>
			</s:iterator>
		</table>

	</s:if>
</body>
</html>


