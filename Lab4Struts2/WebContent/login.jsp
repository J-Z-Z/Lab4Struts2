<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<h2>Login Page</h2>
<s:actionerror/>
<s:form action="authentication">
<s:textfield name="userName" label="Username"/>
<s:password name="pwd" label="Password"/>
<s:submit/>
</s:form>
</html>