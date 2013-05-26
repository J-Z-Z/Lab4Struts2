<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container">

<!-- Begin Body of the Data -->
<s:if test="cursModelList!=null && cursModelList.size()>0">
	<div id="ajxTableData">
		<h3>Curs List</h3>
		<table id="myTable" class="table table-striped table-hover table-condensed">
			<thead>
				<tr class="ui-widget-header">
					<th>	<s:property value="getText('global.denCurs')" />		</th>
					<th>	<s:property value="getText('global.univId')" />			</th>
					<th>	<s:property value="getText('global.profesorId')" />	</th>
					<th>	<s:property value="getText('global.edit')" />				</th>
					<th>	<s:property value="getText('global.delete')" />			</th>
					</tr>
			</thead>
			<s:iterator value="cursModelList" var="cursObject">
				<tr id="delCursLink<s:property value="cursId" />">
					<td>	<s:property value="numeCurs" />			</td>
					<td>	<s:property value="univerNume" />		</td>
					<td>	<s:property value="profesorNume" />	</td>
					<td>
						<s:url id="editURL" action="Curs_edit">
							<s:param name="id" value="%{cursId}" />
						</s:url>
						<s:a href="%{editURL}" cssClass="btn btn-mini">
							<s:property value="getText('global.edit')" />
						</s:a>
					</td>
					<td>
						<s:url id="deleteURL" action="Curs_delete">
							<s:param name="id" value="%{cursId}" />
							<s:param name="pgNr" value="%{pgNr}" />
						</s:url>
						<s:a href="%{deleteURL}" cssClass="btn btn-mini">
							<s:property value="getText('global.delete')" />
						</s:a>
					</td>
				</tr>
			</s:iterator>
		</table>

	<!-- Pagination logic -->
	<div id="pager">
		<div class="pagination pagination-centered">
			<label for="pageSelector">Page: </label>
			<select	onChange="$nxtPg('Curs', this.value)" name="pageSelector" id="pageSelector">
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
			<!-- Change records per page -->
			<s:form action="Curs_list" >
				<s:select list="perPageArray" name="perPage" label="Records Per Page" cssClass="span1" onchange="this.form.submit()"/>
			</s:form>
		</div>
	</div>
	
	</div>
	<!-- End of Body of the Data -->
</s:if>
	


<s:if test="%{cursModel.cursId != null}">

	<s:form action="Curs_update" method="post" validate="true" cssClass="form-horizontal">
		<fieldset>
			<legend>Update</legend>
			<s:hidden name="cursModel.cursId" id="crs_edt_id" />
			<s:textfield name="cursModel.numeCurs" key="global.denCurs" id="crs_edt_numeCurs" />
			<s:select list="universitateList" listKey="UId" name="cursModel.universitateId" id="crs_edt_univId" headerValue="Alege Universitate" key="global.univId" />
			<s:select list="profesorList" listKey="PId" name="cursModel.profesorId" id="crs_edt_profId" headerValue="Alege Profesor" key="global.profesorId" />
			
			<s:submit value="Save" cssClass="btn" />
		</fieldset>
	</s:form>

<!-- Return back to initial page -->
<s:a action="Curs_list" cssClass="btn">Cancel</s:a>
</s:if>

<s:else>

	<s:form action="Curs_add" method="post" validate="true">
		<fieldset>
			<legend>
				<s:property value="getText('global.insertMessage')" /> Curs
			</legend>
			<s:textfield name="cursModel.numeCurs" key="global.denCurs" id="cursModelNumeCurs" />

			<s:select list="universitateList" listKey="UId" name="cursModel.universitateId" id="cursModelUniversitateId" headerValue="Alege Universitate" key="global.univId" />

			<s:select list="profesorList" listKey="PId" name="cursModel.profesorId" id="cursModelProfesorId" headerValue="Alege Profesor" key="global.profesorId" />
		</fieldset>
		<s:submit value="%{getText('global.insertMessage')}" cssClass="btn" />
	</s:form>
</s:else>
</div>
