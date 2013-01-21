<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">

	<h1>
		<s:property value="getText('global.edit')" />
		Curs
	</h1>
	<s:form action="Curs_update" method="post" validate="true">

		<s:hidden name="cursModel.cId" />
		<s:textfield name="cursModel.numeCurs" key="global.denCurs" />
		<s:textfield name="cursModel.uId" key="global.univId" />
		<s:textfield name="cursModel.pId" key="global.cursId" />
		<s:submit key="global.submit" />
	</s:form>
</s:if>
<s:else>
	<h1>
		<s:property value="getText('global.insertMessage')" />
		Curs
	</h1>
	<s:form action="Curs_add" method="post" validate="true">
		<s:hidden name="cursModel.cId" />
		<s:textfield name="cursModel.numeCurs" key="global.denCurs" />
		<s:textfield name="cursModel.uId" key="global.univId" />
		<s:textfield name="cursModel.pId" key="global.cursId" />
		<s:submit />

	</s:form>
</s:else>

<s:if test="cursModelList.size()>0">
	<h1>Curs List</h1>

	<table id="data">
		<caption>Curs</caption>
		<thead>
			<tr>
				<th><s:property value="getText('global.cursId')" /></th>
				<th><s:property value="getText('global.denCurs')" /></th>
				<th><s:property value="getText('global.univId')" /></th>
				<th><s:property value="getText('global.profesorId')" /></th>
				<th><s:property value="getText('global.edit')" /></th>
				<th><s:property value="getText('global.delete')" /></th>
			</tr>
		</thead>
		<s:action name="listAllCursModel" />
		<s:iterator value="cursModelList">
			<tr>
				<td><s:property value="cId" /></td>
				<td><s:property value="numeCurs" /></td>
				<td><s:property value="uId" /></td>
				<td><s:property value="pId" /></td>
				<td><s:url id="editURL" action="Curs_edit">
						<s:param name="id" value="%{cId}"></s:param>
					</s:url> <s:a href="%{editURL}">
						<s:property value="getText('global.edit')" />
					</s:a></td>
				<td><s:url id="deleteURL" action="Curs_delete">
						<s:param name="id" value="%{cId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">
						<s:property value="getText('global.delete')" />
					</s:a></td>
			</tr>
		</s:iterator>
	</table>

</s:if>
