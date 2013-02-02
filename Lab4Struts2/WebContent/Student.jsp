<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page buffer = "16kb" %>
<s:if test="%{#parameters.id != null}">
	<h1>Edit StudentModel</h1>
	<s:form action="Student_update" method="post" validate="true">

		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname" />
		<s:textfield name="studentModel.prenume" key="global.name" />
		<s:textfield name="studentModel.grupa" key="global.group" />
		<s:textfield name="studentModel.email" key="global.email" />
		<s:textfield name="studentModel.telFix" key="global.phone" />
		<s:submit />

	</s:form>
</s:if>
<s:else>
	<h1>Insert Student</h1>
	<s:form action="Student_add" method="post" validate="true">
		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname" />
		<s:textfield name="studentModel.prenume" key="global.name" />
		<s:textfield name="studentModel.grupa" key="global.group" />
		<s:textfield name="studentModel.email" key="global.email" />
		<s:textfield name="studentModel.telFix" key="global.phone" />
		<s:submit />

	</s:form>
</s:else>


<s:if test="studentModelList.size()>0">
	<h1>Student List</h1>

	<display:table id="data" name="studentModelList" pagesize="5"
		export="false" requestURI="/Student_list.html">
		<display:column property="SId" titleKey="global.studentId"
			sortable="true" />
		<display:column property="nume" titleKey="global.lname"
			sortable="true" />
		<display:column property="prenume" titleKey="global.name"
			sortable="true" />
		<display:column property="grupa" titleKey="global.group"
			sortable="true" />
		<display:column property="email" titleKey="global.email"
			sortable="true" />
		<display:column property="telFix" titleKey="global.phone"
			sortable="true" />

		<display:column titleKey="global.edit" href="Student_edit.html"
			paramId="id" paramProperty="SId">
			<s:property value="getText('global.edit')" />
		</display:column>

		<display:column titleKey="global.delete" href="Student_delete.html"
			paramId="id" paramProperty="SId">
			<s:property value="getText('global.delete')" />
		</display:column>

<display:setProperty name="paging.banner.placement" value="bottom" />
	</display:table>
</s:if>
