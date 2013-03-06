<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="container">

<div id="StudCursEditForm" title="Edit Student Curs">
	<s:if test="%{#parameters.id != null || studCursModel.scId}">
		<h1><s:property value="getText('global.edit')" />Student-Curs</h1>
		<s:form method="post" validate="true">
			<s:hidden name="studCursModel.scId" id="stdc_edt_id"/>
			<s:textfield name="studCursModel.studentId" key="global.studentId" id="stdc_edt_sId"/>
			<s:textfield name="studCursModel.cursId" key="global.cursId" id="stdc_edt_cId"/>
		</s:form>
	</s:if>
</div>

	<s:if test="studCursModelList!=null && studCursModelList.size()>0">
	<div id="loading"></div>
		<div id="ajxTableData">
			<h1>Student-Curs List</h1>
			<table class="ui-widget ui-widget-content">
				<caption>Curs</caption>
				<thead>
					<tr class="ui-widget-header ">
						<th><s:property value="getText('global.studcursId')" /></th>
						<th><s:property value="getText('global.cursId')" /></th>
						<th><s:property value="getText('global.denCurs')" /></th>
						<th><s:property value="getText('global.studentId')" /></th>
						<th><s:property value="getText('global.name')" /></th>
						<th><s:property value="getText('global.edit')" /></th>
						<th><s:property value="getText('global.delete')" /></th>
					</tr>
				</thead>
				<s:iterator value="studCursModelList">
					<tr>
						<td><s:property value="scId" /></td>
						<td><s:property value="cursId" /></td>
						<td><s:property value="cursNume" /></td>
						<td><s:property value="studentId" /></td>
						<td><s:property value="studentNume" /></td>
						<td>
							<a href="javascript:void(null)"
								onclick="editStudCurs(<s:property value="scId" />)">Edit
							</a>
						</td>
						<td>
							<a href="javascript:void(null)" onclick="deleteStudCurs(<s:property value="scId" />)" id="delStudCursLink<s:property value="scId" />">
								<s:property value="getText('global.delete')" />
							</a>
						</td>
					</tr>
				</s:iterator>
			</table>


			<!-- Pagination logic -->
			<div id="pager">
				<s:iterator value="pgArray" var="m">
					<a href="javascript:void(null)"
						onclick="$nxtPgStudCurs(<s:property value="#m+1" />)"><s:property
							value="#m+1" /></a>
				</s:iterator>
			</div>
		</div>


		<!-- Auto-hidden insert dialog window -->
		<div id="StudCursInsForm" title="Create new Student Curs">
			<h2><s:property value="getText('global.insertMessage')" />Student-Curs</h2>
			<s:form method="post" validate="true">
				<s:hidden name="studCursModel.scId" />
				<s:textfield name="studCursModel.studentId" key="global.studentId"
					required="true" id="studCursModelStudentId" />
				<s:textfield name="studCursModel.cursId" key="global.cursId"
					required="true" id="studCursModelCursId" />
			</s:form>
		</div>
		<button id="create-StudCurs">Create new Student Curs</button>
	</s:if>

</div>