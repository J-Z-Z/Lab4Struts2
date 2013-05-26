<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container">
	<div id="loading"></div>
	<s:if
		test="universitateModelList!=null && universitateModelList.size()>0">

		<div id="ajxTableData">
			<h1>Universitates List</h1>
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr class="ui-widget-header ">
						<th><s:property value="getText('global.denum')" /></th>
						<th><s:property value="getText('global.address')" /></th>
						<th><s:property value="getText('global.phone')" /></th>
						<th><s:property value="getText('global.edit')" /></th>
						<th><s:property value="getText('global.delete')" /></th>
					</tr>
				</thead>
				<s:iterator value="universitateModelList">
					<tr id="delUnivLink<s:property value="UId" />">
						<td><s:property value="numeUniver" /></td>
						<td><s:property value="adresa" /></td>
						<td><s:property value="telefon" /></td>
						<td><s:url id="editURL" action="Universitate_edit">
								<s:param name="id" value="%{UId}"></s:param>
							</s:url> <s:a href="%{editURL}" cssClass="btn btn-mini">
								<s:property value="getText('global.edit')" />
							</s:a></td>

						<td><s:url id="deleteURL" action="Universitate_delete">
								<s:param name="id" value="%{UId}" />
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
						onChange="$nxtPg('Universitate', this.value)" name="pageSelector"
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
					
					<s:form action="Universitate_list">
						<s:select onchange="this.form.submit()" list="perPageArray" name="perPage" cssClass="span1" label="Records Per Page"/>
					</s:form>

				</div>
			</div>

		</div>

	</s:if>

	<s:if test="%{#parameters.id != null || universitateModel.UId}">

		<s:form action="Universitate_update" method="post" validate="true">
			<fieldset>
				<legend>
					<s:property value="getText('global.edit')" />
					Universitate
				</legend>
				<s:hidden name="universitateModel.UId" id="unv_edt_id" />
				<s:textfield name="universitateModel.numeUniver" key="global.denum"
					id="unv_edt_denum" />
				<s:textfield name="universitateModel.adresa" key="global.address"
					id="unv_edt_adresa" />
				<s:textfield name="universitateModel.telefon" key="global.phone"
					id="unv_edt_phone" />
			</fieldset>
			<s:submit value="Save" cssClass="btn" />
		</s:form>
		<s:a action="Universitate_list" cssClass="btn">Cancel</s:a>
	</s:if>
	<s:else>
		<s:form action="Universitate_add" method="post" validate="true">
			<fieldset>
				<legend>
					<s:property value="getText('global.insertMessage')" />
					Universitate
				</legend>
				<s:textfield name="universitateModel.numeUniver" key="global.denum"
					id="unv_edt_denum" />
				<s:textfield name="universitateModel.adresa" key="global.address"
					id="unv_edt_adresa" />
				<s:textfield name="universitateModel.telefon" key="global.phone"
					id="unv_edt_phone" />
			</fieldset>
			<s:submit value="%{getText('global.insertMessage')}" cssClass="btn" />
		</s:form>
	</s:else>

</div>