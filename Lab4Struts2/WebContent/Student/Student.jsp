<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<s:if test="%{#parameters.id != null}">
	<h1>Edit Student</h1>
		<s:form action="updateStudent" method="post">
			<s:hidden name="SId" />
			<s:textfield name="student.nume" label="Numele Studentului" />
			<s:textfield name="student.prenume" label="Prenuumele Studentului" />
			<s:textfield name="student.grupa" label="Grupa Studentului" />
			<s:textfield name="student.email" label="Email-ul Studentului" />
			<s:textfield name="student.telFix" label="Telefonul Studentului" />
			<s:submit />

		</s:form>
	</s:if>
	<s:else>
		<s:form action="addStudent" method="post">
			<s:hidden name="SId" />
			<s:textfield name="student.nume" label="Numele Studentului" />
			<s:textfield name="student.prenume" label="Prenuumele Studentului" />
			<s:textfield name="student.grupa" label="Grupa Studentului" />
			<s:textfield name="student.email" label="Email-ul Studentului" />
			<s:textfield name="student.telFix" label="Telefonul Studentului" />
			<s:submit />

		</s:form>
	</s:else>


	<s:if test="studentList.size()>0">
		<h1>Students List</h1>

		<table>
			<s:action name="listAll" />
			<s:iterator value="studentList">
				<tr>
					<td><s:property value="SId" /></td>
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="grupa" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="telFix" /></td>
					<td><s:url id="editURL" action="editStudent">
							<s:param name="id" value="%{SId}"></s:param>
						</s:url> <s:a href="%{editURL}">Edit</s:a></td>
					<td><s:url id="deleteURL" action="deleteStudent">
							<s:param name="id" value="%{SId}"></s:param>
						</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
				</tr>
			</s:iterator>
		</table>

	</s:if>
</body>
</html>
