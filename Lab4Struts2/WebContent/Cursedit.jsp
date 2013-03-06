<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
    
	<s:if test="%{#parameters.id != null || cursModel.cursId}">
		<h1><s:property value="getText('global.edit')" />Curs</h1>
		<s:form method="post" validate="true">
			<s:hidden name="cursModel.cursId" id="crs_edt_id"/>
			<s:textfield name="cursModel.numeCurs" key="global.denCurs" id="crs_edt_numeCurs"/>
			<s:textfield name="cursModel.universitateId" key="global.univId" id="crs_edt_univId"/>
			<s:textfield name="cursModel.profesorId" key="global.cursId" id="crs_edt_profId"/>
		</s:form>
	</s:if>