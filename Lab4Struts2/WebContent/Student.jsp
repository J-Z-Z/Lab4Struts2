<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>


<s:if test="%{#parameters.id != null}">
<div id="StudentEditForm" title="Edit Student">
	<h2>Edit StudentModel</h2>
	<s:form action="Student_update" method="post" validate="true">
		<s:hidden name="studentModel.SId" />
		<s:textfield name="studentModel.nume" key="global.lname" />
		<s:textfield name="studentModel.prenume" key="global.name" />
		<s:textfield name="studentModel.grupa" key="global.group" />
		<s:textfield name="studentModel.email" key="global.email" />
		<s:textfield name="studentModel.telFix" key="global.phone" />
		<s:submit />
	</s:form>
</div>
</s:if>

<div id="StudentInsForm" title="Create new Student">
    <p class="validateTips">All form fields are required.</p>

    <s:form method="post" validate="true">
        <s:hidden name="studentModel.SId"/>
        <s:textfield name="studentModel.nume" key="global.lname"
                     id="stdntNume" />
        <s:textfield name="studentModel.prenume" key="global.name"
                     id="stdnPrenume"/>
        <s:textfield name="studentModel.grupa" key="global.group"
                     id="stdntGrp"/>
        <s:textfield name="studentModel.email" key="global.email"
                     id="stdntEmail"/>
        <s:textfield name="studentModel.telFix" key="global.phone"
                     id="stdntTel"/>
    </s:form>
</div>
<s:if test="studentModelList.size()>0">

	<h1>Student List</h1>

	<display:table id="data" name="studentModelList" pagesize="5"
		export="false" requestURI="/Student_list.html">
		<display:column property="SId" titleKey="global.studentId"
			sortable="true" />
		<display:column property="nume" titleKey="global.lname"
			sortable="true" />
		<display:column property="prenume" titleKey="global.name"
			sortable="true" />
		<display:column property="grupa" titleKey="global.group"
			sortable="true" />
		<display:column property="email" titleKey="global.email"
			sortable="true" />
		<display:column property="telFix" titleKey="global.phone"
			sortable="true" />

		<display:column titleKey="global.edit" href="Student_edit.html"
			paramId="id" paramProperty="SId" >
			<s:property value="getText('global.edit')" />
		</display:column>

		<display:column  titleKey="global.delete" href="Student_delete.html"
			paramId="id" paramProperty="SId">
			<s:property value="getText('global.delete')" />
		</display:column>
	
<display:setProperty name="paging.banner.placement" value="bottom" />
	</display:table>
	<br />
	<br />
</s:if>

<button id="create-Student">Create new Student</button>

