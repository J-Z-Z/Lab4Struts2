<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">
	<h1>
		<s:property value="getText('global.edit')" />
		Universitate
	</h1>
	<s:form action="Universitate_update" method="post" validate="true">
		<s:hidden name="universitateModel.UId" />
		<s:textfield name="universitateModel.numeUniver" key="global.denum" />
		<s:textfield name="universitateModel.adresa" key="global.address" />
		<s:textfield name="universitateModel.telefon" key="global.phone" />
		<s:submit key="global.submit" />
	</s:form>
</s:if>
<s:else>
	<h1>
		<s:property value="getText('global.insertMessage')" />
		Universitate
	</h1>
	<s:form action="Universitate_add" method="post" validate="true">
		<s:hidden name="universitateModel.UId" />
		<s:textfield name="universitateModel.numeUniver" key="global.denum" />
		<s:textfield name="universitateModel.adresa" key="global.address" />
		<s:textfield name="universitateModel.telefon" key="global.phone" />
		<s:submit key="global.submit" />

	</s:form>
</s:else>


<s:if test="universitateModelList.size()>0">
	<h1>Universitates List</h1>

	<table id="data">
		<caption>Universitate</caption>
		<thead>
			<tr>
				<th><s:property value="getText('global.univId')" /></th>
				<th><s:property value="getText('global.denum')" /></th>
				<th><s:property value="getText('global.address')" /></th>
				<th><s:property value="getText('global.phone')" /></th>
				<th><s:property value="getText('global.edit')" /></th>
				<th><s:property value="getText('global.delete')" /></th>
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
					</s:url> <s:a href="%{editURL}">
						<s:property value="getText('global.edit')" />
					</s:a></td>
				<td><s:url id="deleteURL" action="Universitate_delete">
						<s:param name="id" value="%{UId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">
						<s:property value="getText('global.delete')" />
					</s:a></td>
			</tr>
		</s:iterator>
	</table>

</s:if>
