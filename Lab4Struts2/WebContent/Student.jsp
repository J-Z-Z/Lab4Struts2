<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container">
	<s:if test="studentModelList!=null && studentModelList.size()>0">
		<div id="ajxTableData">
			<h1>Student List</h1>
			<table class="table table-striped table-hover table-condensed">
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
						onChange="$nxtPgStudent(this.value)" name="pageSelector"
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

	<s:if test="%{#parameters.id != null || studentModel.SId!=null}">

		<s:form action="Student_update" method="post" validate="true">
			<fieldset>
				<legend>
					<s:property value="getText('global.edit')" />
					Student
				</legend>
				<s:hidden name="studentModel.SId" id="st_edt_id" />
				<s:textfield name="studentModel.nume" key="global.lname"
					id="st_edt_nume" />
				<s:textfield name="studentModel.prenume" key="global.name"
					id="st_edt_prenume" />
				<s:textfield name="studentModel.grupa" key="global.group"
					id="st_edt_grupa" />
				<s:textfield name="studentModel.email" key="global.email"
					id="st_edt_email" />
				<s:textfield name="studentModel.telFix" key="global.phone"
					id="st_edt_telFix" />
			</fieldset>
			<s:submit value="Save" cssClass="btn" />
		</s:form>
		<s:a action="Student_list" cssClass="btn">Cancel</s:a>
	</s:if>

	<s:else>

		<s:form action="Student_add" method="post" validate="true"
			cssClass="form-inline">
			<fieldset>
				<legend>
					<s:property value="getText('global.insertMessage')" />
					Student
				</legend>
				<s:textfield name="studentModel.nume" key="global.lname"
					id="st_edt_nume" />
				<s:textfield name="studentModel.prenume" key="global.name"
					id="st_edt_prenume" />
				<s:textfield name="studentModel.grupa" key="global.group"
					id="st_edt_grupa" />
				<s:textfield name="studentModel.email" key="global.email"
					id="st_edt_email" />
				<s:textfield name="studentModel.telFix" key="global.phone"
					id="st_edt_telFix" />
			</fieldset>
			<s:submit value="%{getText('global.insertMessage')}" cssClass="btn" />
		</s:form>
	</s:else>
</div>