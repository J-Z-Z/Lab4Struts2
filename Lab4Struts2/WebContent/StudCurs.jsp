<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">
	<h1>
		<s:property value="getText('global.edit')" />
		Student-Curs
	</h1>
	<s:form action="StudCurs_update" method="post" validate="true">
		<s:hidden name="studCursModel.scId" />
		<s:textfield name="studCursModel.studentId" key="global.studentId" />
		<s:textfield name="studCursModel.cursId" key="global.cursId" />
		<s:submit />

	</s:form>
</s:if>
<s:else>
	<h1>
		<s:property value="getText('global.insertMessage')" />
		Student-Curs
	</h1>
	<s:form action="StudCurs_add" method="post" validate="true">
		<s:hidden name="studCursModel.scId" />
		<s:textfield name="studCursModel.studentId" key="global.studentId"
			required="true" />
		<s:textfield name="studCursModel.cursId" key="global.cursId"
			required="true" />
		<s:submit />

	</s:form>
</s:else>

<s:if test="studCursModelList.size()>0">
	<h1>Student-Curs List</h1>

	<table id="data">
		<caption>Student-Curs</caption>
		<thead>
			<tr>
				<th><s:property value="getText('global.studcurs')" /></th>
				<th><s:property value="getText('global.studentId')" /></th>
				<th><s:property value="getText('global.cursId')" /></th>
				<th><s:property value="getText('global.edit')" /></th>
				<th><s:property value="getText('global.delete')" /></th>
			</tr>
		</thead>
		<s:action name="listAllStudCursModel" />
		<s:iterator value="studCursModelList">
			<tr>
				<td><s:property value="scId" /></td>
				<td><s:property value="studentId" /></td>
				<td><s:property value="cursId" /></td>
				<td><s:url id="editURL" action="StudCurs_edit">
						<s:param name="id" value="%{scId}"></s:param>
					</s:url> <s:a href="%{editURL}">
						<s:property value="getText('global.edit')" />
					</s:a></td>
				<td><s:url id="deleteURL" action="StudCurs_delete">
						<s:param name="id" value="%{scId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">
						<s:property value="getText('global.delete')" />
					</s:a></td>
			</tr>
		</s:iterator>
	</table>

</s:if>
