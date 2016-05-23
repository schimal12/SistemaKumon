<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>
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
		<td colspan = "7" class = "encabezado">
				<img src="kumonlogo.png" />
				</td>
				
				<td align=right>
					<form  method="post" action="./LogO">
						<input  type = "submit" class="botonDatos" value = "Cerrar Sesi&oacute;n"/>
					</form>
				</td>
		<tr class = "menu">
			<td align="center" colspan = "8">
			REPORTE MATERIALES
			</td>
		</tr>
		<tr>
		<td>
		<br/><br/>
		<c:if test='${applicationScope.logged eq "true"}'>
			<table class="tablaConsulta">
		  <tr>
		    <td><b>Nombre</b></td>
                    <td><b>Existencia Actual</b></td>
                    <td><b>Existencia Minima</b></td>
                    <td><b>Fecha de Pr&oacute;ximo Abastecimiento</b></td>
		  </tr>
		  <%Iterator itr;%>
		  <%List datos = (List)request.getAttribute("datos");
		  for(itr = datos.iterator(); itr.hasNext();){%>
		  <tr>
		    <td><%=itr.next()%></td>
		    <td><%=itr.next()%></td>
		    <td><%=itr.next()%></td>
		    <td><%=itr.next()%></td>
		  </tr>
		  <%}%>
		</table>
		<br/>
		<td></td><td></td><td>
		    <tr >
			<td align=center colspan = "2" >
		    <button onclick="location.href = 'consulta.jsp';" id="myButton" class="botonDatos" >Atrás</button>
		    <br/><br/>
		    </td>
		
		</td>
		</tr>
		</c:if>
		<c:if test='${applicationScope.logged eq "false"}'>
			<p class = "cuerpoUno">No se ha identificado para poder acceder a esta p&aacute;gina.</p>
		</c:if>
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