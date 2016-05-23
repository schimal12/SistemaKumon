<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<title>Sistema Kumon</title>
	<link rel="stylesheet" type="text/css" href="versionUno.css" />
	
</head>

<body>
	<table>
		<tr>
			<td align="center" colspan = "8" class = "encabezado">
				<img src="kumonlogo.jpg" width="400"/>
			</td>
		</tr>

		<tr class = "menu">
			<td align=center colspan = "8">
			
			</td>
		</tr>
		<tr>
			<td align= "center" colspan = "8" class = "principal">
			<c:if test='${applicationScope.logged eq "true"}'>
				<br />
				<br />
				<br />
				<button onclick="location.href = 'alumno.jsp';" id="myButton" class="boton" >Ingreso de datos a la base</button>
				<br />
				<br />
				<button onclick="location.href = 'consulta.jsp';" id="myButton" class="boton" >Consultar información</button>
				<br />
				<br />
				<form method="post" action="./LogO">
				<input type = "submit" class="boton" value = "Cerrar Sesi&oacute;n"/>
				</form>
				<br/>
			</c:if>
			<c:if test='${applicationScope.logged eq "false"}'>
				<p class = "cuerpoUno">No se ha identificado para poder acceder a esta p&aacute;gina.</p>
			</c:if>		
			</td>
		</tr>
		<tr>
			<td colspan = "5" class = "pie">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Correo: gransur@ikumon.com.mx
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tel&eacute;fono: 5606-6669
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P&aacute;gina Oficial: <a href = "http://www.kumon.com.mx/" class = "menu"> www.kumon.com.mx </a>
			</td>
			<td colspan = "3" class = "pie">
				Copyright © 2014 Kumon North America, Inc. Todos los derechos reservados.
			</td>
		</tr>
	</table>
</body>
</html>