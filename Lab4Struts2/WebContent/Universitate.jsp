<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="container">
	<s:if test="%{#parameters.id != null || universitateModel.UId}">
		<h1>
			<s:property value="getText('global.edit')" />
			Universitate
		</h1>
		<s:form action="Universitate_update" method="post" validate="true">
			<s:hidden name="universitateModel.UId" />
			<s:textfield name="universitateModel.numeUniver" key="global.denum" />
			<s:textfield name="universitateModel.adresa" key="global.address" />
			<s:textfield name="universitateModel.telefon" key="global.phone" />
			<s:submit key="global.submit" />
		</s:form>
	</s:if>



	<s:if test="universitateModelList.size()>0">
		<div id="loading"></div>
		<div id="ajxTableData">
			<h1>Universitates List</h1>
			<table class="ui-widget ui-widget-content">
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
					<tr>
						<td><s:property value="UId" /></td>
						<td><s:property value="numeUniver" /></td>
						<td><s:property value="adresa" /></td>
						<td><s:property value="telefon" /></td>
						<td><s:url id="editURL" action="Universitate_edit">
								<s:param name="id" value="%{UId}"></s:param>
							</s:url> <s:a href="%{editURL}">
								<s:property value="getText('global.edit')" />
							</s:a></td>
						<td><s:url id="deleteURL" action="Universitate_delete">
								<s:param name="id" value="%{UId}"></s:param>
							</s:url> <s:a href="%{deleteURL}">
								<s:property value="getText('global.delete')" />
							</s:a></td>
					</tr>
				</s:iterator>
			</table>

			<!-- Pagination logic -->

			<div id="pager">
				<s:iterator value="pgArray" var="m">
					<a href="javascript:void(null)"
						onclick="$nxtPgUniversitate(<s:property value="#m+1" />)"><s:property
							value="#m+1" /></a>
				</s:iterator>
			</div>

		</div>

		<!-- Auto-hidden Insert University dialog window -->
		<div id="UniversitateInsForm" title="Create new Universitate">
			<h2>
				<s:property value="getText('global.insertMessage')" />
				Universitate
			</h2>
			<s:form method="post" validate="true">
				<s:hidden name="universitateModel.UId" />
				<s:textfield name="universitateModel.numeUniver" key="global.denum"
					id="univNume" />
				<s:textfield name="universitateModel.adresa" key="global.address"
					id="univAdresa" />
				<s:textfield name="universitateModel.telefon" key="global.phone"
					id="univTel" />
			</s:form>
		</div>
		<button id="create-Universitate">Create new Universitate</button>
	</s:if>
</div>

