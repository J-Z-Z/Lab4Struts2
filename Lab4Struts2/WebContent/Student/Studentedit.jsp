<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<h1>Edit Student</h1>
	<s:form action="updateStudent" method="post">
		<s:push value="student" >
			<s:hidden name="SId" />
			<s:textfield name="student.nume" label="Numele Studentului" />
			<s:textfield name="student.prenume" label="Prenuumele Studentului" />
			<s:textfield name="student.grupa" label="Grupa Studentului" />
			<s:textfield name="student.email" label="Email-ul Studentului" />
			<s:textfield name="student.telFix" label="Telefonul Studentului" />
			<s:submit />
		</s:push>
	</s:form>

</body>
</html>