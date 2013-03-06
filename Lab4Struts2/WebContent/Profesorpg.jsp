<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="loading"></div>
<s:if test="profesorModelList.size()>0  && profesorModelList!=null">
	<div id="ajxTableData">
		<h1>Profesor List</h1>
		<table class="ui-widget ui-widget-content">
			<caption>Profesor</caption>
			<thead>
				<tr class="ui-widget-header">
					<th><s:property value="getText('global.profesorId')" /></th>
					<th><s:property value="getText('global.name')" /></th>
					<th><s:property value="getText('global.lname')" /></th>
					<th><s:property value="getText('global.address')" /></th>
					<th><s:property value="getText('global.edit')" /></th>
					<th><s:property value="getText('global.delete')" /></th>
				</tr>
			</thead>
			<s:iterator value="profesorModelList">
				<tr>
					<td><s:property value="PId" /></td>
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="adresa" /></td>
					<td>
							<a href="javascript:void(null)"
								onclick="editProf(<s:property value="PId" />)">Edit
							</a>
						</td>
					<td>
						<a href="javascript:void(null)" onclick="deleteProfesor(<s:property value="PId" />)" id="delProfLink<s:property value="PId" />">
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
					onclick="$nxtPgProfesor(<s:property value="#m+1" />)"><s:property
						value="#m+1" /></a>
			</s:iterator>
		</div>
	</div>

</s:if>