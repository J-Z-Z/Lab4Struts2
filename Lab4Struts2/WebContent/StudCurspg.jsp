<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="studCursModelList!=null && studCursModelList.size()>0">
	<div id="ajxTableData">
		<h1>Student-Curs List</h1>
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr class="ui-widget-header">
					<th><s:property value="getText('global.denCurs')" /></th>
					<th><s:property value="getText('global.name')" /></th>
					<th><s:property value="getText('global.edit')" /></th>
					<th><s:property value="getText('global.delete')" /></th>
				</tr>
			</thead>
			<s:iterator value="studCursModelList">
				<tr id="delStudCursLink<s:property value="scId" />">
					<td><s:property value="cursNume" /></td>
					<td><s:property value="studentNume" /></td>

					<td><s:url id="editURL" action="StudCurs_edit">
							<s:param name="id" value="%{scId}"></s:param>
						</s:url> <s:a href="%{editURL}" cssClass="btn btn-mini">
							<s:property value="getText('global.edit')" />
						</s:a></td>

					<td><s:url id="deleteURL" action="StudCurs_delete">
							<s:param name="id" value="%{scId}" />
						</s:url> <s:a href="%{deleteURL}" cssClass="btn btn-mini">
							<s:property value="getText('global.delete')" />
						</s:a></td>

				</tr>
			</s:iterator>
		</table>

		<!-- Pagination logic -->
		<div id="pager">
			<div class="pagination pagination-centered">
				<label for="pageSelector">Page: </label> <select
					onChange="$nxtPg('StudCurs', this.value)" name="pageSelector"
					id="pageSelector">

					<s:iterator value="pgArray" var="m">
						<s:if test="pgNr==#m">
							<option value="<s:property value="#m"/>" selected="selected">
								<s:property value="#m+1" />
							</option>
						</s:if>
						<s:else>
							<option value="<s:property value="#m"/>">
								<s:property value="#m+1" />
							</option>
						</s:else>
					</s:iterator>

				</select>
			<s:form action="StudCurs_list">
				<s:select list="perPageArray" name="perPage" cssClass="span1" label="Records Per Page" onchange="this.form.submit()"/>
			</s:form>
			</div>
		</div>
	</div>
</s:if>