<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if
	test="universitateModelList!=null && universitateModelList.size()>0">

	<h1>Universitates List</h1>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr class="ui-widget-header ">
				<th><s:property value="getText('global.denum')" /></th>
				<th><s:property value="getText('global.address')" /></th>
				<th><s:property value="getText('global.phone')" /></th>
				<th><s:property value="getText('global.edit')" /></th>
				<th><s:property value="getText('global.delete')" /></th>
			</tr>
		</thead>
		<s:iterator value="universitateModelList">
			<tr id="delUnivLink<s:property value="UId" />">
				<td><s:property value="numeUniver" /></td>
				<td><s:property value="adresa" /></td>
				<td><s:property value="telefon" /></td>
				<td><s:url id="editURL" action="Universitate_edit">
						<s:param name="id" value="%{UId}"></s:param>
					</s:url> <s:a href="%{editURL}" cssClass="btn btn-mini">
						<s:property value="getText('global.edit')" />
					</s:a></td>

				<td><s:url id="deleteURL" action="Universitate_delete">
						<s:param name="id" value="%{UId}" />
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
				onChange="$nxtPgUniversitate(this.value)" name="pageSelector"
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
			<s:form action="Universitate_list">
				<s:select onchange="this.form.submit()" list="perPageArray"
					name="perPage" cssClass="span1" label="Records Per Page" />
			</s:form>
		</div>
	</div>

</s:if>