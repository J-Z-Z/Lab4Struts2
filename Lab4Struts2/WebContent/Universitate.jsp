<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="container">

<div id="UniversitateEditForm" title="Edit Universitate">
	<s:if test="%{#parameters.id != null || universitateModel.UId}">
		<h1><s:property value="getText('global.edit')" />Universitate</h1>
		<s:form method="post" validate="true">
			<s:hidden name="universitateModel.UId" id="unv_edt_id"/>
			<s:textfield name="universitateModel.numeUniver" key="global.denum" id="unv_edt_denum"/>
			<s:textfield name="universitateModel.adresa" key="global.address" id="unv_edt_adresa"/>
			<s:textfield name="universitateModel.telefon" key="global.phone" id="unv_edt_phone"/>
		</s:form>
	</s:if>
</div>

	<div id="loading"></div>
	<s:if test="universitateModelList!=null && universitateModelList.size()>0">
		
		<div id="ajxTableData">
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
<div id="pager">
    <div class="pagination">
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

		</div>

		<!-- Auto-hidden Insert University dialog window -->
		<div id="UnivAddForm" title="Create new Universitate"></div>
		<button name="Insert_Universitate" onclick="addUniversitate();" class="btn btn-primary" type="button">Insert New University</button>	
	</s:if>
</div>

