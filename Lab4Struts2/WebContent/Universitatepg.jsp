<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="universitateModelList!=null && universitateModelList.size()>0">

		<h1>Universitates List</h1>
		<table class="ui-widget ui-widget-content">
			<caption>Universitate</caption>
			<thead>
				<tr class="ui-widget-header ">
					<th><s:property value="getText('global.univId')" /></th>
					<th><s:property value="getText('global.denum')" /></th>
					<th><s:property value="getText('global.address')" /></th>
					<th><s:property value="getText('global.phone')" /></th>
					<th><s:property value="getText('global.edit')" /></th>
					<th><s:property value="getText('global.delete')" /></th>
				</tr>
			</thead>
			<s:iterator value="universitateModelList">
				<tr>
					<td><s:property value="UId" /></td>
					<td><s:property value="numeUniver" /></td>
					<td><s:property value="adresa" /></td>
					<td><s:property value="telefon" /></td>
					<td>
						<a href="javascript:void(null)"
							onclick="editUniversitate(<s:property value="UId" />)">Edit
						</a>
					</td>
					<td>
						
						<a href="javascript:void(null)" onclick="deleteUniversitate(<s:property value="UId" />)" id="delUnivLink<s:property value="UId" />">
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
					onclick="$nxtPgUniversitate(<s:property value="#m+1" />)"><s:property
						value="#m+1" /></a>
			</s:iterator>
		</div>

</s:if>