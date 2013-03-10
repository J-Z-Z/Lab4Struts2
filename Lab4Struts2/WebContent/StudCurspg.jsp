<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="studCursModelList!=null && studCursModelList.size()>0">
	<div id="ajxTableData">
		<h1>Student-Curs List</h1>
		<table class="table table-striped table-hover table-condensed">
			<caption>Student Curs</caption>
			<thead>
				<tr>
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
				<tr id="delStudCursLink<s:property value="scId" />">
					<td><s:property value="scId" /></td>
					<td><s:property value="cursId" /></td>
					<td><s:property value="cursNume" /></td>
					<td><s:property value="studentId" /></td>
					<td><s:property value="studentNume" /></td>
					<td>
						<a href="javascript:void(null)"
							onclick="editStudCurs(<s:property value="scId" />)" class="btn btn-mini">Edit
						</a>
					</td>
					<td>
						<a href="javascript:void(null)" onclick="deleteStudCurs(<s:property value="scId" />)"  class="btn btn-mini">
							<s:property value="getText('global.delete')" />
						</a>
					</td>
				</tr>
			</s:iterator>
		</table>


			<!-- Pagination logic -->
			<div id="pager">
			<div class="pagination pagination-centered">
			<ul>
				<s:iterator value="pgArray" var="m">
				<li>
				
				<s:if test="pgNr == #m+1">
					<a href="javascript:void(null)" onclick="$nxtPgStudCurs(<s:property value="#m+1" />)" class="btn btn-link"><strong><s:property value="#m+1" /></strong>
					</a>
				</s:if>
				
				<s:else>
					<a href="javascript:void(null)"
						onclick="$nxtPgStudCurs(<s:property value="#m+1" />)" class="btn btn-link"><s:property
							value="#m+1" /></a>
				</s:else>
				</li>
				</s:iterator>
				</ul>
				</div>
			</div>
	</div>
</s:if>