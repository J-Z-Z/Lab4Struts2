<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Form for editing the Profesor  -->
<div id="ProfesorEditForm" title="Edit Profesor">
	<s:if test="%{#parameters.id != null || profesorModel.PId}">
		<h1><s:property value="getText('global.edit')" />Profesor</h1>
		<s:form method="post" validate="true">
			<s:hidden name="profesorModel.PId" id="prf_edt_id"/>
			<s:textfield name="profesorModel.nume" key="global.lname" id="prf_edt_nume"/>
			<s:textfield name="profesorModel.prenume" key="global.name" id="prf_edt_prenume"/>
			<s:textfield name="profesorModel.adresa" key="global.address" id="prf_edt_adresa"/>
		</s:form>
	</s:if>
</div>

<div id="loading"></div>
	<s:if test="profesorModelList.size()>0  && profesorModelList!=null">
		<div id="ajxTableData">
			<h1>Profesor List</h1>
			<table class="table table-striped table-hover table-condensed">
				<caption>Profesor</caption>
				<thead>
					<tr class="ui-widget-header">
						<th><s:property value="getText('global.profesorId')" /></th>
						<th><s:property value="getText('global.name')" /></th>
						<th><s:property value="getText('global.lname')" /></th>
						<th><s:property value="getText('global.address')" /></th>
						<th><s:property value="getText('global.edit')" /></th>
						<th><s:property value="getText('global.delete')" /></th>
					</tr>
				</thead>
				<s:iterator value="profesorModelList">
					<tr id="delProfLink<s:property value="PId" />">
						<td><s:property value="PId" /></td>
						<td><s:property value="nume" /></td>
						<td><s:property value="prenume" /></td>
						<td><s:property value="adresa" /></td>
						<td>
							<a href="javascript:void(null)"
								onclick="editProf(<s:property value="PId" />)" class="btn btn-mini">Edit
							</a>
						</td>
						<td>
							<a href="javascript:void(null)" onclick="deleteProfesor(<s:property value="PId" />)" class="btn btn-mini">
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
                        <a href="javascript:void(null)" onclick="$nxtPgProfesor(<s:property value="#m+1" />)" class="btn btn-link">
                            <strong><s:property value="#m+1" /></strong>
	                    </a>
                    </s:if>

                    <s:else>
	                    <a href="javascript:void(null)" onclick="$nxtPgProfesor(<s:property value="#m+1" />)" class="btn btn-link">
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

		<div id="ProfAddForm" title="Create new Profesor"></div>
		<button name="Insert_Profesor" onclick="addProf();" class="btn btn-primary" type="button">Insert New Profesor</button>
	</s:if>
