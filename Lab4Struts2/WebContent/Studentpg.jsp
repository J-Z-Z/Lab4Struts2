<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- loading div -->
<s:if test="studentModelList.size()>0 && studentModelList!=null">
	<div id="ajxTableData">
		<h1>Student List</h1>

		<table class="table table-striped table-hover table-condensed">
			<caption>Student</caption>
			<thead>
				<tr class="ui-widget-header ">
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
				<tr id="delStudentLink<s:property value="SId" />">
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="grupa" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="telFix" /></td>
					<td><s:url id="editURL" action="Student_edit">
							<s:param name="id" value="%{SId}"></s:param>
						</s:url> <s:a href="%{editURL}" cssClass="btn btn-mini">
							<s:property value="getText('global.edit')" />
						</s:a></td>

					<td><s:url id="deleteURL" action="Student_delete">
							<s:param name="id" value="%{SId}" />
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
					onChange="$nxtPg('Student', this.value)" name="pageSelector"
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
				<s:form action="Student_list">
					<s:select list="perPageArray" name="perPage" cssClass="span1" label="Records Per Page" onchange="this.form.submit()"/>
				</s:form>

			</div>
		</div>
	</div>

</s:if>

