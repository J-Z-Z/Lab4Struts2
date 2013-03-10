<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="cursModelList!=null && cursModelList.size()>0">

	<div id="ajxTableData">
		<h1>Curs List</h1>
		<table class="table table-striped table-hover table-condensed">
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
				<tr id="delCursLink<s:property value="cursId" />">
					<td><s:property value="cursId" /></td>
					<td><s:property value="numeCurs" /></td>
					<td><s:property value="universitateId" /></td>
					<td><s:property value="profesorId" /></td>
					<td>
							<a href="javascript:void(null)"
								onclick="editCurs(<s:property value="cursId" />)" class="btn btn-mini">Edit
							</a>
						</td>
					<td>
						<a href="javascript:void(null)" onclick="deleteCurs(<s:property value="cursId" />)"  class="btn btn-mini">
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
                        <a href="javascript:void(null)" onclick="$nxtPgCurs(<s:property value="#m+1" />)" class="btn btn-link">
                            <strong><s:property value="#m+1" /></strong>
	                    </a>
                    </s:if>

                    <s:else>
	                    <a href="javascript:void(null)" onclick="$nxtPgCurs(<s:property value="#m+1" />)" class="btn btn-link">
                            <s:property value="#m+1" />
	                    </a>
                    </s:else>
                </li>
            </s:iterator>
        </ul>
	</div>
</div>
	</div>
</s:if>