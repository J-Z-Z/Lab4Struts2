<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">
	<h1>Edit Universitate</h1>
	<s:form action="Universitate_update" method="post">
		<s:hidden name="universitate.UId" />
		<s:textfield name="universitate.numeUniver"
			label="Denumirea Universitatii" />
		<s:textfield name="universitate.adresa" label="Adresa Universitatii" />
		<s:textfield name="universitate.telefon"
			label="Telefonul Universitatii" />
		<s:submit />

	</s:form>
</s:if>
<s:else>
	<h1>Insert Universitate</h1>
	<s:form action="Universitate_add" method="post">
		<s:hidden name="universitateModel.UId" />
		<s:textfield name="universitateModel.numeUniver"
			label="Denumirea Universitatii" />
		<s:textfield name="universitateModel.adresa" label="Adresa Universitatii" />
		<s:textfield name="universitateModel.telefon"
			label="Telefonul Universitatii" />
		<s:submit />

	</s:form>
</s:else>


<s:if test="universitateModelList.size()>0">
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
		<s:action name="Universitate_list" />
		<s:iterator value="universitateModelList">
			<tr>
				<td><s:property value="UId" /></td>
				<td><s:property value="numeUniver" /></td>
				<td><s:property value="adresa" /></td>
				<td><s:property value="telefon" /></td>

				<td><s:url id="editURL" action="Universitate_edit">
						<s:param name="id" value="%{UId}"></s:param>
					</s:url> <s:a href="%{editURL}">Edit</s:a></td>
				<td><s:url id="deleteURL" action="Universitate_delete">
						<s:param name="id" value="%{UId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
			</tr>
		</s:iterator>
	</table>

</s:if>
<s:else>
	<p>Nu sunt date</p>
</s:else>
