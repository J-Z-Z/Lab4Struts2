<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="loading"></div>
<s:if test="studentModelList.size()>0 && studentModelList!=null">
	<div id="ajxTableData">
		<h1>Student List</h1>

		<table class="table table-striped table-hover table-condensed">
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
				<tr id="delStudentLink<s:property value="SId" />" >
					<td><s:property value="SId" /></td>
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="grupa" /></td>
					<td><s:property value="email" /></td>
					<td><s:property value="telFix" /></td>
					<td><a href="javascript:void(null)"
							onclick="editStudent(<s:property value="SId" />)" class="btn btn-mini">Edit</a>
					</td>
					<td>
						
						<a href="javascript:void(null)" onclick="deleteStudent(<s:property value="SId" />)" class="btn btn-mini">
							<s:property value="getText('global.delete')" />
						</a>
					</td>
						

				</tr>
			</s:iterator>
		</table>


<!-- Pagination logic -->
<div id="pager">
    <div class="pagination">
        <ul>
            <s:iterator value="pgArray" var="m">
                <li>
                    <s:if test="pgNr == #m+1">
                        <a href="javascript:void(null)" onclick="$nxtPgStudent(<s:property value="#m+1" />)" class="btn btn-link">
                            <strong><s:property value="#m+1" /></strong>
	                    </a>
                    </s:if>

                    <s:else>
	                    <a href="javascript:void(null)" onclick="$nxtPgStudent(<s:property value="#m+1" />)" class="btn btn-link">
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

