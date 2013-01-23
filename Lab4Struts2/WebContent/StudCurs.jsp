<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
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

	<display:table id="data" name="studCursModelList" pagesize="5"
		export="false" requestURI="/StudCurs_list.html">
		<display:column property="scId" titleKey="global.studcursId"
			sortable="true" />
		<display:column property="studentId" titleKey="global.studentId"
			sortable="true" />
		<display:column property="cursId" titleKey="global.cursId"
			sortable="true" />


		<display:column titleKey="global.edit" href="StudCurs_edit.html"
			paramId="id" paramProperty="scId">
			<s:property value="getText('global.edit')" />
		</display:column>

		<display:column titleKey="global.delete" href="StudCurs_delete.html"
			paramId="id" paramProperty="scId">
			<s:property value="getText('global.delete')" />
		</display:column>
		<display:setProperty name="paging.banner.placement" value="bottom" />
	</display:table>

</s:if>
