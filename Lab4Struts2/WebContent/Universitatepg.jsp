<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="universitateModelList!=null && universitateModelList.size()>0">

		<h1>Universitates List</h1>
		<table class="table table-striped table-hover table-condensed">
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
				<tr id="delUnivLink<s:property value="UId" />">
					<td><s:property value="UId" /></td>
					<td><s:property value="numeUniver" /></td>
					<td><s:property value="adresa" /></td>
					<td><s:property value="telefon" /></td>
					<td>
						<a href="javascript:void(null)"
							onclick="editUniversitate(<s:property value="UId" />)" class="btn btn-mini">Edit
						</a>
					</td>
					<td>
						
						<a href="javascript:void(null)" onclick="deleteUniversitate(<s:property value="UId" />)"  class="btn btn-mini">
							<s:property value="getText('global.delete')" />
						</a>
					</td>
				</tr>
			</s:iterator>
		</table>

		<!-- Pagination logic -->

<!-- Pagination logic -->
<div id="pager">
    <div class="pagination pagination-centered">
        <ul>
            <s:iterator value="pgArray" var="m">
                <li>
                    <s:if test="pgNr == #m+1">
                        <a href="javascript:void(null)" onclick="$nxtPgUniversitate(<s:property value="#m+1" />)" class="btn btn-link">
                            <strong><s:property value="#m+1" /></strong>
	                    </a>
                    </s:if>

                    <s:else>
	                    <a href="javascript:void(null)" onclick="$nxtPgUniversitate(<s:property value="#m+1" />)" class="btn btn-link">
                            <s:property value="#m+1" />
	                    </a>
                    </s:else>
                </li>
            </s:iterator>
        </ul>
	</div>
</div>

</s:if>