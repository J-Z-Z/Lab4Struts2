<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="container">
<div id="CursEditForm" title="Edit Curs">
	<s:if test="%{#parameters.id != null || cursModel.cursId}">
		<h1><s:property value="getText('global.edit')" />Curs</h1>
		<s:form method="post" validate="true">
			<s:hidden name="cursModel.cursId" id="crs_edt_id"/>
			<s:textfield name="cursModel.numeCurs" key="global.denCurs" id="crs_edt_numeCurs"/>
			<s:textfield name="cursModel.universitateId" key="global.univId" id="crs_edt_univId"/>
			<s:textfield name="cursModel.profesorId" key="global.cursId" id="crs_edt_profId"/>
		</s:form>
	</s:if>
</div>

	<div id="loading"></div>
	<s:if test="cursModelList!=null && cursModelList.size()>0">

		<div id="ajxTableData">
			<h1>Curs List</h1>
			<table class="ui-widget ui-widget-content">
				<caption>Curs</caption>
				<thead>
					<tr class="ui-widget-header">
						<th><s:property value="getText('global.cursId')" /></th>
						<th><s:property value="getText('global.denCurs')" /></th>
						<th><s:property value="getText('global.univId')" /></th>
						<th><s:property value="getText('global.profesorId')" /></th>
						<th><s:property value="getText('global.edit')" /></th>
						<th><s:property value="getText('global.delete')" /></th>
					</tr>
				</thead>
				<s:iterator value="cursModelList">
					<tr>
						<td><s:property value="cursId" /></td>
						<td><s:property value="numeCurs" /></td>
						<td><s:property value="universitateId" /></td>
						<td><s:property value="profesorId" /></td>
						<td>
							<a href="javascript:void(null)"
								onclick="editCurs(<s:property value="cursId" />)">Edit
							</a>
						</td>
						<td>
							<a href="javascript:void(null)" onclick="deleteCurs(<s:property value="cursId" />)" id="delCursLink<s:property value="cursId" />">
								<s:property value="getText('global.delete')" />
							</a>
						</td>
					</tr>
				</s:iterator>
			</table>

			<!-- Pagination Logic -->
			<div id="pager">
				<s:iterator value="pgArray" var="m">
				<s:if test="pgNr == #m+1">
				
				<a href="javascript:void(null)"
						onclick="$nxtPgCurs(<s:property value="#m+1" />)"><strong><s:property
							value="#m+1" /></strong></a>
				
				</s:if>
				<s:else>
					<a href="javascript:void(null)"
						onclick="$nxtPgCurs(<s:property value="#m+1" />)"><s:property
							value="#m+1" /></a>
				</s:else>
				</s:iterator>
			</div>
		</div>


		<div id="CursInsForm" title="Create new Curs">
			<h2>
				<s:property value="getText('global.insertMessage')" />
				Curs
			</h2>
			<s:form method="post" validate="true">
				<s:hidden name="cursModel.cursId" />
				<s:textfield name="cursModel.numeCurs" key="global.denCurs"
					id="cursModelNumeCurs" />
				<s:textfield name="cursModel.universitateId" key="global.univId"
					id="cursModelUniversitateId" />
				<s:textfield name="cursModel.profesorId" key="global.cursId"
					id="cursModelProfesorId" />
			</s:form>
		</div>
		<button id="create-Curs">Create new Curs</button>

	</s:if>

</div>