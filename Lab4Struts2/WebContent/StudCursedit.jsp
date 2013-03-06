<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


	<s:if test="%{#parameters.id != null || studCursModel.scId}">
		<h1><s:property value="getText('global.edit')" />Student-Curs</h1>
		<s:form method="post" validate="true">
			<s:hidden name="studCursModel.scId" id="stdc_edt_id"/>
			<s:textfield name="studCursModel.studentId" key="global.studentId" id="stdc_edt_sId"/>
			<s:textfield name="studCursModel.cursId" key="global.cursId" id="stdc_edt_cId"/>
		</s:form>
	</s:if>
