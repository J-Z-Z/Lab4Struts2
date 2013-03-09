<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="container">


<div id="StudentEditForm" title="Edit Student">
	<s:if test="%{#parameters.id != null || studentModel.SId!=null}">
		<h1>Edit StudentModel</h1>
		<s:form method="post" validate="true">
					<s:hidden name="studentModel.SId" id="st_edt_id"/>
			<s:textfield name="studentModel.nume" key="global.lname" id="st_edt_nume" />
			<s:textfield name="studentModel.prenume" key="global.name" id="st_edt_prenume"/>
			<s:textfield name="studentModel.grupa" key="global.group" id="st_edt_grupa"/>
			<s:textfield name="studentModel.email" key="global.email" id="st_edt_email"/>
			<s:textfield name="studentModel.telFix" key="global.phone" id="st_edt_telFix"/>
		</s:form>
		
	</s:if>
</div>


	<div id="loading"></div>
	<s:if test="studentModelList!=null && studentModelList.size()>0">
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
					<tr id="delStudentLink<s:property value="SId" />">
						<td><s:property value="SId" /></td>
						<td><s:property value="nume" /></td>
						<td><s:property value="prenume" /></td>
						<td><s:property value="grupa" /></td>
						<td><s:property value="email" /></td>
						<td><s:property value="telFix" /></td>
						<td>
							<a href="javascript:void(null)"
								onclick="editStudent(<s:property value="SId" />)" class="btn btn-mini">Edit
							</a>
						</td>
						<td>
							<a href="javascript:void(null)" onclick="deleteStudent(<s:property value="SId" />)"  class="btn btn-mini">
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

		<!-- Auto-hidden Insert Modal Window -->

		<div id="StudentAddForm" title="Create new Student"></div>
		<button name="Insert_StudentButton" onclick="addStudent();" class="btn btn-primary" type="button">Insert New Student</button>

	</s:if>

</div>


