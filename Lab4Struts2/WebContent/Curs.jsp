<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<s:if test="%{#parameters.id != null}">

	<h1>
		<s:property value="getText('global.edit')" />
		Curs
	</h1>
	<s:form action="Curs_update" method="post" validate="true">

		<s:hidden name="cursModel.cId" />
		<s:textfield name="cursModel.numeCurs" key="global.denCurs" />
		<s:textfield name="cursModel.universitateId" key="global.univId" />
		<s:textfield name="cursModel.profesorId" key="global.cursId" />
		<s:submit key="global.submit" />
	</s:form>
</s:if>
<div id="CursInsForm" title="Create new Curs">
	<h2>
		<s:property value="getText('global.insertMessage')" />
		Curs
	</h2>
	<s:form method="post" validate="true">
		<s:hidden name="cursModel.cId" />
		<s:textfield name="cursModel.numeCurs" key="global.denCurs" id="cursModelNumeCurs"/>
		<s:textfield name="cursModel.universitateId" key="global.univId" id="cursModelUniversitateId"/>
		<s:textfield name="cursModel.profesorId" key="global.cursId" id="cursModelProfesorId"/>
	</s:form>
</div>

<s:if test="cursModelList.size()>0">
	<h1>Curs List</h1>

	<display:table id="data" name="cursModelList" pagesize="5"
		export="false" requestURI="/Curs_list.html">
		<display:column property="cId" titleKey="global.cursId"
			sortable="true" />
		<display:column property="numeCurs" titleKey="global.denCurs"
			sortable="true" />
		<display:column property="universitateId" titleKey="global.univId"
			sortable="true" />
		<display:column property="profesorId" titleKey="global.profesorId"
			sortable="true" />

		<display:column titleKey="global.edit" href="Curs_edit.html"
			paramId="id" paramProperty="cId">
			<s:property value="getText('global.edit')" />
		</display:column>

		<display:column  titleKey="global.delete" href="Curs_delete.html"
			paramId="id" paramProperty="cId">
			<s:property value="getText('global.delete')" />
		</display:column>
		<display:setProperty name="paging.banner.placement" value="bottom" />
	</display:table>
	<br />
	<br />
</s:if>


<button id="create-Curs">Create new Curs</button>