<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container">

	<s:if test="studCursModelList!=null && studCursModelList.size()>0">
		<div id="ajxTableData">
			<h1>Student-Curs List</h1>
			<table id="myTable"
				class="table table-striped table-hover table-condensed">
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
	<s:if test="%{#parameters.id != null || studCursModel.scId}">


		<s:form action="StudCurs_update" method="post" validate="true"
			cssClass="form-horizontal">
			<legend>
				<s:property value="getText('global.edit')" />
				Student-Curs
			</legend>
			<s:hidden name="studCursModel.scId" id="stdc_edt_id" />

			<s:select list="studentList" listKey="SId"
				name="studCursModel.studentId" id="stdc_edt_sId" headerKey=""
				headerValue="Alege Student" key="global.studentId" />

			<s:select list="cursList" listKey="cursId"
				name="studCursModel.cursId" id="stdc_edt_cId" headerKey=""
				headerValue="Alege Curs" key="global.cursId" />
			<s:submit value="Save" cssClass="btn" />
		</s:form>
		<s:a action="StudCurs_list" cssClass="btn">Cancel</s:a>
	</s:if>

	<s:else>

		<s:form action="StudCurs_add" method="post" validate="true"
			cssClass="form-horizontal">
			<fieldset>
				<legend>
					<s:property value="getText('global.insertMessage')" />
					Student-Curs
				</legend>

				<s:select list="studentList" listKey="SId"
					name="studCursModel.studentId" id="stdc_edt_sId" headerKey=""
					headerValue="Alege Student" key="global.studentId" />

				<s:select list="cursList" listKey="cursId"
					name="studCursModel.cursId" id="stdc_edt_cId" headerKey=""
					headerValue="Alege Curs" key="global.cursId" />
			</fieldset>
			<s:submit value="%{getText('global.insertMessage')}" cssClass="btn" />
		</s:form>
	</s:else>
</div>