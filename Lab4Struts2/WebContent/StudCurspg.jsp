<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="studCursModelList.size()>0 && studCursModelList!=null">
	<div id="ajxTableData">
		<h1>Student-Curs List</h1>
		<table class="ui-widget ui-widget-content">
			<caption>Student Curs</caption>
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
					<td><s:url id="editURL" action="StudCurs_edit">
							<s:param name="id" value="%{scId}"></s:param>
						</s:url> <s:a href="%{editURL}">
							<s:property value="getText('global.edit')" />
						</s:a></td>
					<td><s:url id="deleteURL" action="StudCurs_delete">
							<s:param name="id" value="%{scId}"></s:param>
						</s:url> <s:a href="%{deleteURL}">
							<s:property value="getText('global.delete')" />
						</s:a></td>
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
</s:if>