<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
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
	<display:table id="data" name="profesorModelList" pagesize="5"
		export="false" requestURI="/Profesor_list.html">
		<display:column property="PId" titleKey="global.profesorId"
			sortable="true" />
		<display:column property="nume" titleKey="global.lname"
			sortable="true" />
		<display:column property="prenume" titleKey="global.name"
			sortable="true" />
		<display:column property="adresa" titleKey="global.address"
			sortable="true" />

		<display:column titleKey="global.edit" href="Profesor_edit.html"
			paramId="id" paramProperty="PId">
			<s:property value="getText('global.edit')" />
		</display:column>

		<display:column titleKey="global.delete" href="Profesor_delete.html"
			paramId="id" paramProperty="PId">
			<s:property value="getText('global.delete')" />
		</display:column>
		<display:setProperty name="paging.banner.placement" value="bottom" />
	</display:table>
</s:if>
