<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unknown Error</title>
</head>
<body>
	<h3>Daca vedeti aceasta pagina atunci a avut loc o eroare care nu
		este de tipul SQL</h3>

	<s:property value="exception.message" />
	<s:property value="exceptionStack" />
	<s:actionerror/>
	
</body>
</html>