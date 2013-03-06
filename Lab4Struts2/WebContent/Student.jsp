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
						<td>
							<a href="javascript:void(null)"
								onclick="editStudent(<s:property value="SId" />)">Edit
							</a>
						</td>
						<td>
							<a href="javascript:void(null)" onclick="deleteStudent(<s:property value="SId" />)" id="delStudentLink<s:property value="SId" />">
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
						onclick="$nxtPgStudent(<s:property value="#m+1" />)"><s:property
							value="#m+1" /></a>
				</s:iterator>
			</div>
		</div>

		<!-- Auto-hidden Insert Modal Window -->

		<div id="StudentInsForm" title="Create new Student">
			<p class="validateTips">All form fields are required.</p>

			<s:form method="post" validate="true">
				<s:hidden name="studentModel.SId" />
				<s:textfield name="studentModel.nume" key="global.lname"
					id="stdntNume" />
				<s:textfield name="studentModel.prenume" key="global.name"
					id="stdnPrenume" />
				<s:textfield name="studentModel.grupa" key="global.group"
					id="stdntGrp" />
				<s:textfield name="studentModel.email" key="global.email"
					id="stdntEmail" />
				<s:textfield name="studentModel.telFix" key="global.phone"
					id="stdntTel" />
			</s:form>
		</div>
		<button id="create-Student">Create new Student</button>

	</s:if>
	<script>
function editIt(var1, var2, var3){
	alert(var1+ ' ' +var2+ '  ' +var3);
};
</script>

</div>


