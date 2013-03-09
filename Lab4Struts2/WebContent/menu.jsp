<%@taglib uri="/struts-tags" prefix="s"%>
<div id="header">
	<ul id="nav" >
		<li><a href="javascript:void(null)" onclick="ajxNavLoad('Curs')">Curs</a></li>
		<li><a href="javascript:void(null)" onclick="ajxNavLoad('Student')">Student</a></li>
		<li><a href="javascript:void(null)" onclick="ajxNavLoad('Profesor')">Profesor</a></li>
		<li><a href="javascript:void(null)" onclick="ajxNavLoad('StudCurs')">StudCurs</a></li>
		<li><a href="javascript:void(null)" onclick="ajxNavLoad('Universitate')">Universitate</a></li>
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
