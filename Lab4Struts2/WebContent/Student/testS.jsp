<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Hello World</title>
</head>
<body>
	<h1>Hello World From Struts2</h1>
	<table>
		<form action="hello" method="post">
			<tr>
				<td><label for="nume">Nume Studentului</label></td>
				<td><input  type="text" name="nume"  placeholder="Nume"/></td>
			</tr>
			<tr>
				<td><label for="prenume">Prenume Studentului</label></td>
				<td><input type="text" name="prenume" placeholder="Prenume"/></td>
			</tr>

			<tr>
				<td><label for="grupa">Grupa Studentului</label></td>
				<td><input type="text" name="grupa" placeholder="Grupa"/></td>
			</tr>

			<tr>
				<td><label for="email">Email-ul Studentului</label></td>
				<td><input type="text" name="email" placeholder="Email"/></td>
			</tr>

			<tr>
				<td><label for="telFix">Telfonul Studentului</label></td>
				<td><input type="text" name="telFix" placeholder="Telefon Fix"/></td>
			</tr>

			<tr>
				<td><input type="submit" value="Say Hello" /></td>
			</tr>
		</form>
	</table>
</body>
</html>