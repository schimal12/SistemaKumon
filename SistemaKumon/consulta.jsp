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
			<td colspan = "7" class = "encabezado">
				<img src="kumonlogo.png" />
				</td>
				
				<td align=right>
					<form  method="post" action="./LogO">
						<input  type = "submit" class="botonDatos" value = "Cerrar Sesi&oacute;n"/>
					</form>
				</td>
				</tr>

		<tr class = "menu">
			<td align=center colspan = "8">
			CONSULTAS
			</td>
		</tr>
		<tr>
			<td align=center colspan = "8" class = "principal">
		<c:if test='${applicationScope.logged eq "true"}'>
			
			
					<table>
				  <tr>
				    <th>
				    <br /><br/>
				    <form method="post" action="./Consulta1">
				    <input type = "submit" class="botonConsulta" value = "Alumnos que no han pagado y siguen asistiendo"/>
				    </form>
				    </th>
				    <th>
				    <br /><br/>
				    <form method="post" action="./Consulta2">
				    <input type = "submit" class="botonConsulta" value = "Alumnos que han pagado y no han asistido"/>
				    </form>
				    </th>
				  </tr>
				  <tr>
				    <td>
				    <form method="post" action="./Consulta3">
				    <input type = "submit" class="botonConsulta" value = "Inasistencias en una semana"/>
				    </form>
				    </td>
				    <td>
				    <form method="post" action="./Consulta4">
				    <input type = "submit" class="botonConsulta" value = "Inasistencias en un mes"/>
				    </form>
				    </td>
				  </tr>
				  <tr>
				    <td>
				    <form method="post" action="./Consulta5">
				    <input type = "submit" class="botonConsulta" value = "Alumnos con sesiones de cierta hora"/>
				    </form>
				    </td>
				    <td>
				    <form method="post" action="./Consulta6">
				    <input type = "submit" class="botonConsulta" value = "Horas a la quincena por cada ayudante"/>
				    </form>
				  <tr>
				    <td>
				    <form method="post" action="./Consulta7">
				    <input type = "submit" class="botonConsulta" value = "Monto por tipo de pago"/>
				    </form>
				    <td>
				    <form method="post" action="./Consulta8">
				    <input type = "submit" class="botonConsulta" value = "Consulta Materiales"/>
				    </form>
				    <tr >
					<td align=center colspan = "2" >
				    <button onclick="location.href = 'index2.jsp';" id="myButton" class="botonDatos" >Inicio</button>
				    </td>
				   </tr>
		   
				   
				    </td>
				    			  
				  </tr>
				</table>
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
