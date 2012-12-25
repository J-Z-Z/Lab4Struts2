<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert Student</title>
</head>
<body>
	<h1>Insert a Student</h1>
	<s:form action="add" method="post">

		<s:hidden name="SId" />
		<s:textfield name="student.nume" label="Numele Studentului" />
		<s:textfield name="student.prenume" label="Prenuumele Studentului" />
		<s:textfield name="student.grupa" label="Grupa Studentului" />
		<s:textfield name="student.email" label="Email-ul Studentului" />
		<s:textfield name="student.telFix" label="Telefonul Studentului" />
		<s:submit />

	</s:form>
</body>
</html>
