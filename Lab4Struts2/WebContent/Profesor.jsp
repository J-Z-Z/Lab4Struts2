<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Start of data to display -->
<div class="container">

<s:if test="profesorModelList!=null && profesorModelList.size()>0">
	<div id="ajxTableData">
		<h1>Profesor List</h1>
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr class="ui-widget-header">
					<th><s:property value="getText('global.name')" /></th>
					<th><s:property value="getText('global.lname')" /></th>
					<th><s:property value="getText('global.address')" /></th>
					<th><s:property value="getText('global.edit')" /></th>
					<th><s:property value="getText('global.delete')" /></th>
				</tr>
			</thead>
			<s:iterator value="profesorModelList">
				<tr id="delProfLink<s:property value="PId" />">
					<td><s:property value="nume" /></td>
					<td><s:property value="prenume" /></td>
					<td><s:property value="adresa" /></td>
					<td>
						<s:url id="editURL" action="Profesor_edit">
							<s:param name="id" value="%{PId}"></s:param>
						</s:url>
						<s:a href="%{editURL}" cssClass="btn btn-mini">
							<s:property value="getText('global.edit')" />
						</s:a>
					</td>
						
					<td>
						<s:url id="deleteURL" action="Profesor_delete">
							<s:param name="id" value="%{PId}" />
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
		<select onChange="$nxtPg('Profesor', this.value)" name="pageSelector" id="pageSelector">
			<s:iterator value="pgArray" var="m" >
				<s:if test="pgNr==#m">
					<option value="<s:property value="#m"/>" selected="selected">
						<s:property value="#m+1"/>
					</option>
				</s:if>
				<s:else>
					<option value="<s:property value="#m"/>">
						<s:property value="#m+1"/>
					</option>
				</s:else>
			</s:iterator>
		</select>
		
		
		<!-- Form to change records per page -->		
		<s:form action="Profesor_list">
			<s:select list="perPageArray" name="perPage" cssClass="span1" label="Records Per Page" onchange="this.form.submit()"/>
		</s:form>
	 
	</div>
</div>
<!-- End of data to display -->
</div>

</s:if>

<!-- Form for editing the Profesor  -->
<s:if test="%{#parameters.id != null || profesorModel.PId}">
	<h1><s:property value="getText('global.edit')" />Profesor</h1>
	<s:form method="post" validate="true" action="Profesor_update">
		<s:hidden name="profesorModel.PId" id="prf_edt_id"/>
		<s:textfield name="profesorModel.nume" key="global.lname" id="prf_edt_nume"/>
		<s:textfield name="profesorModel.prenume" key="global.name" id="prf_edt_prenume"/>
		<s:textfield name="profesorModel.adresa" key="global.address" id="prf_edt_adresa"/>
		<s:submit value="Save" cssClass="btn"/>
	</s:form>
	<s:a action="Profesor_list" cssClass="btn">Cancel</s:a>
</s:if>
	
<s:else>
	<s:form method="post" validate="true" action="Profesor_add">
		<fieldset>
			<legend>
				<s:property value="getText('global.insertMessage')" /> Profesor
			</legend>
			<s:textfield name="profesorModel.nume" key="global.lname" id="prf_edt_nume"/>
			<s:textfield name="profesorModel.prenume" key="global.name" id="prf_edt_prenume"/>
			<s:textfield name="profesorModel.adresa" key="global.address" id="prf_edt_adresa"/>
		</fieldset>
		<!-- Submit Button -->
		<s:submit value="%{getText('global.insertMessage')}" cssClass="btn"/>
	</s:form>
</s:else>
</div>