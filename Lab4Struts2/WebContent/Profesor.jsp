<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">
	<h1>
		<s:property value="getText('global.edit')" />
		Profesor
	</h1>
	<s:form action="Profesor_update" method="post" validate="true">
		<s:hidden name="profesorModel.PId" />
		<s:textfield name="profesorModel.nume" key="global.lname" />
		<s:textfield name="profesorModel.prenume" key="global.name" />
		<s:textfield name="profesorModel.adresa" key="global.address" />
		<s:submit key="global.submit" />

	</s:form>
</s:if>
<s:else>
	<h1>
		<s:property value="getText('global.insertMessage')" />
		Profesor
	</h1>
	<s:form action="Profesor_add" method="post" validate="true">
		<s:hidden name="PId" />
		<s:textfield name="profesorModel.nume" key="global.lname" />
		<s:textfield name="profesorModel.prenume" key="global.name" />
		<s:textfield name="profesorModel.adresa" key="global.address" />
		<s:submit key="global.submit" />
	</s:form>
</s:else>

<s:if test="profesorModelList.size()>0">
	<h1>Profesor List</h1>

	<table id="data">
		<caption>Profesor</caption>
		<thead>
			<tr>
				<th><s:property value="getText('global.profesorId')" /></th>
				<th><s:property value="getText('global.lname')" /></th>
				<th><s:property value="getText('global.name')" /></th>
				<th><s:property value="getText('global.address')" /></th>
				<th><s:property value="getText('global.edit')" /></th>
				<th><s:property value="getText('global.delete')" /></th>
			</tr>
		</thead>
		<s:action name="Profesor_list" />
		<s:iterator value="profesorModelList">
			<tr>
				<td><s:property value="PId" /></td>
				<td><s:property value="nume" /></td>
				<td><s:property value="prenume" /></td>
				<td><s:property value="adresa" /></td>
				<td><s:url id="editURL" action="Profesor_edit">
						<s:param name="id" value="%{PId}"></s:param>
					</s:url> <s:a href="%{editURL}">
						<s:property value="getText('global.edit')" />
					</s:a></td>
				<td><s:url id="deleteURL" action="Profesor_delete">
						<s:param name="id" value="%{PId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">
						<s:property value="getText('global.delete')" />
					</s:a></td>
			</tr>
		</s:iterator>
	</table>
</s:if>
