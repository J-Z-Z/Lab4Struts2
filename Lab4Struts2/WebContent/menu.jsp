<%@taglib uri="/struts-tags" prefix="s"%>
<div id="header">
	<ul id="nav" >
		<li><a href="<s:url action="Curs_list.html"/>">Curs</a></li>
		<li><a href="<s:url action="Student_list.html"/>">Student</a></li>
		<li><a href="<s:url action="Profesor_list.html"/>">Profesor</a></li>
		<li><a href="<s:url action="StudCurs_list.html"/>">StudCurs</a></li>
		<li><a href="<s:url action="Universitate_list.html"/>">Universitate</a></li>
	</ul>
	<ul id="nav" >
		<s:url id="localeEN" namespace="/" action="locale">
			<s:param name="request_locale">en</s:param>
		</s:url>
		<s:url id="localeRO" namespace="/" action="locale">
			<s:param name="request_locale">ro</s:param>
		</s:url>


		<li><a href="javascript:void(null)" onclick="langEn()">English</a></li>
		<li><a href="javascript:void(null)" onclick="langRo()">Romana</a></li>

	</ul>



</div>
