<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
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

	<display:table id="data" name="universitateModelList" pagesize="5"
		export="false" requestURI="/Universitate_list.html">
		<display:column property="UId" titleKey="global.univId"
			sortable="true" />
		<display:column property="numeUniver" titleKey="global.denum"
			sortable="true" />
		<display:column property="adresa" titleKey="global.address"
			sortable="true" />
		<display:column property="telefon" titleKey="global.phone"
			sortable="true" />

		<display:column titleKey="global.edit" href="Universitate_edit.html"
			paramId="id" paramProperty="UId">
			<s:property value="getText('global.edit')" />
		</display:column>

		<display:column titleKey="global.delete"
			href="Universitate_delete.html" paramId="id" paramProperty="UId">
			<s:property value="getText('global.delete')" />
		</display:column>
		<display:setProperty name="paging.banner.placement" value="bottom" />
	</display:table>

</s:if>
