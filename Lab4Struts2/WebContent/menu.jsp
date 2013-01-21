<%@taglib uri="/struts-tags" prefix="s"%>
<div id="header">
	<ul id="nav">
		<li><a href="<s:url action="Curs_list"/>">Curs</a></li>
		<li><a href="<s:url action="Student_list"/>">Student</a></li>
		<li><a href="<s:url action="Profesor_list"/>">Profesor</a></li>
		<li><a href="<s:url action="StudCurs_list"/>">StudCurs</a></li>
		<li><a href="<s:url action="Universitate_list"/>">Universitate</a></li>
	</ul>
	<ul id="nav">
		<s:url id="localeEN" namespace="/" action="locale">
			<s:param name="request_locale">en</s:param>
		</s:url>
		<s:url id="localeRO" namespace="/" action="locale">
			<s:param name="request_locale">ro</s:param>
		</s:url>


		<li><s:a href="%{localeEN}">English</s:a></li>
		<li><s:a href="%{localeRO}">Romana</s:a></li>

	</ul>



</div>
