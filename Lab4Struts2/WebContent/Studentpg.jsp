<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="loading"></div>
<s:if test="studentModelList.size()>0 && studentModelList!=null">
	<div id="ajxTableData">
		<h1>Student List</h1>

		<table class="ui-widget ui-widget-content">
			<caption>Student</caption>
			<thead>
				<tr class="ui-widget-header ">
					<th><s:property value="getText('global.studentId')" /></th>
					<th><s:property value="getText('global.name')" /></th>
					<th><s:property value="getText('global.lname')" /></th>
					<th><s:property value="getText('global.group')" /></th>
					<th><s:property value="getText('global.email')" /></th>
					<th><s:property value="getText('global.phone')" /></th>
					<th><s:property value="getText('global.edit')" /></th>
					<th><s:property value="getText('global.delete')" /></th>
				</tr>
			</thead>
			<s:iterator value="studentModelList">
				<tr>
					<td><s:property value="SId" /></td>
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="grupa" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="telFix" /></td>
					<td><s:url id="editURL" action="Student_edit">
							<s:param name="id" value="%{SId}"></s:param>
						</s:url> <s:a href="%{editURL}">
							<s:property value="getText('global.edit')" />
						</s:a></td>
					<td><s:url id="deleteURL" action="Student_delete">
							<s:param name="id" value="%{SId}"></s:param>
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
					onclick="$nxtPgStudent(<s:property value="#m+1" />)"><s:property
						value="#m+1" /></a>
			</s:iterator>
		</div>
	</div>

</s:if>

