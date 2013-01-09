<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="%{#parameters.id != null}">
	<h1>Edit Students and Curses</h1>
	<s:form action="StudCurs_update" method="post">
		<s:hidden name="studCursModel.scId" />
		<s:textfield name="studCursModel.studentId" label="Student ID" />
		<s:textfield name="studCursModel.cursId" label="Curs ID" />
		<s:submit />

	</s:form>
</s:if>
<s:else>
	<h1>Insert StudCursModel</h1>
	<s:form action="StudCurs_add" method="post">
		<s:hidden name="studCursModel.scId" />
		<s:textfield name="studCursModel.studentId" label="Student ID" />
		<s:textfield name="studCursModel.cursId" label="Curs ID" />
		<s:submit />

	</s:form>
</s:else>

<s:if test="studCursModelList.size()>0">
	<h1>StudCursModel List</h1>

	<table id="data">
		<caption>StudCursModel</caption>
		<thead>
			<tr>
				<th>ID</th>
				<th>Student ID</th>
				<th>Curs ID</th>
				<th>Delete</th>
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
					</s:url> <s:a href="%{editURL}">Edit</s:a></td>
				<td><s:url id="deleteURL" action="StudCurs_delete">
						<s:param name="id" value="%{scId}"></s:param>
					</s:url> <s:a href="%{deleteURL}">Delete</s:a></td>
			</tr>
		</s:iterator>
	</table>

</s:if>
<s:else>
	<p>Nu sunt date</p>
</s:else>