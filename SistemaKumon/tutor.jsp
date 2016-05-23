<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Registro Tutores</title>
	<link rel="stylesheet" type="text/css" href="versionUno.css" />
</head>

<body>
	<table>
			<tr >
				<td colspan = "8" class = "encabezado">
					<img src="kumonlogo.png" />
				</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				
				<td>
				<form  method="post" action="./LogO">
					<input  type = "submit" class="botonDatos" value = "Cerrar Sesi&oacute;n"/>
				</form>
				</td>
			</tr>
		</table>
		
			
		<table>

		<tr class = "menu">
			<td class = "botonMenu">
				<a href = "index2.jsp" class = "menu"> Inicio </a>
			</td>
			<td class = "botonMenu">
				<a href = "alumno.jsp" class = "menu"> Alumnos </a>
			</td>
			<td class = "botonMenu">
				<a href = "sesion.jsp" class = "menu"> Sesiones </a>
			</td>
			<td class = "botonMenu">
				<a href = "pago.jsp" class = "menu"> Pagos </a>
			</td>
			<td class = "botonMenu">
				<a href = "tutor.jsp" class = "menu"> Tutores </a>
			</td>
			<td class = "botonMenu">
				<a href = "ayudante.jsp" class = "menu"> Ayudantes </a>
			</td>
			<td class = "botonMenu">
				<a href = "material.jsp" class = "menu"> Materiales </a>
			</td>
			<td class = "botonMenu">
				<a href = "usuario.jsp" class = "menu"> Usuarios </a>
			</td>
		</tr>
		<tr>
			<td colspan = "8" class = "principal">
				<c:if test='${applicationScope.logged eq "true"}'>
										
					<c:if test='${sessionScope.elegido eq "alta"}'>
					<h1>Control de tutores</h1>
					<br />
					<form method = "post" action = "./queryTut">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked/> Alta de un tutor <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un tutor <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un tutor <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<table align = "center">
						<form method = "post" action = "./registroTut">
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="Nombre"/>
							</td>
						</tr>
						<tr>
							<th>
								Direcci&oacute;n
							</th>
							<td>
								<input type="text" name="Direccion"/>
							</td>
						</tr>

							<th>
								Tel&eacute;fono
							</th>
							<td>
								<input type="number" maxlength="16" size="16" name="Telefono"/>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Registrar" />
							</td>
						</tr>
						</form>
					</table>
					<c:out value = "${requestScope.resultado}" />
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "cambio"}'>
					<h1>Control de tutores</h1>
					<br />
					<form method = "post" action = "./queryTut">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta"/> Alta de un tutor. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" checked /> Modificar un tutor. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un tutor. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<form method = "post" action = "./buscaTut">
					<table align= "center">
						<tr>
							<td>
								Inserte el nombre de tutor que desee modificar:
							</td>
							<td>
								<input type = "text" name = "BuscaID" />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
							<td>
							<div align = "center">
								<c:out value = "${requestScope.malo}" />
							</div>
							</td>
						</tr>
					</table>
					</form>
					<c:if test='${sessionScope.buscado eq "true"}'>
					<form method = "post" action = "./eligeTut">
						<table align = "center">
							<tr>
								<td>
									<select name = "Elegido">
									<%Iterator itr;%>
										<%List tutores = (List)request.getAttribute("tutores");
										for(itr = tutores.iterator(); itr.hasNext();){%>
										<option value = "<%=itr.next()%>"> <%=itr.next()%> - <%=itr.next()%> </option>
									<%}%>
									</select>
								</td>
								<td>
									<input type = "submit" class="botonDatos" value = "Buscar" />
								</td>
							</tr>
						</table>
		  			</form>
					<c:set var="buscado" scope="session" value="" />
					</c:if>
					<c:if test='${sessionScope.buscado2 eq "true"}'>
					<table align = "center">
						<form method = "post" action = "./cambiarTut">
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="NombreC" value = "${requestScope.nombre}" />
							</td>
						</tr>
						<tr>
							<th>
								Direcci&oacute;n
							</th>
							<td>
								<input type="text" name="DireccionC" value = "${requestScope.direccion}" />
							</td>
						</tr>

							<th>
								Tel&eacute;fono
							</th>
							<td>
								<input type="number" maxlength="16" size="16" name="TelefonoC" value = "${requestScope.telefono}" />
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Guardar" />
							</td>
						</tr>
						</form>
					</table>
					<c:set var="buscado2" scope="session" value="" />
					</c:if>
					<div align = "center">
					<c:out value = "${requestScope.resultado}" />
					</div>
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "baja"}'>
					<h1>Control de tutores</h1>
					<br />
					<form method = "post" action = "./queryTut">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta"/> Alta de un tutor. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un tutor. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" checked /> Baja de un tutor. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<form  method = "post" action = "./buscaTut">
					<table align= "center" >
						<tr >
							<td  >
								Inserte el nombre de tutor que desee modificar:
							</td>
							<td>
								<input type = "text" name = "BuscaID" />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
							
							<td>
							<div align= center>
								<c:out value = "${requestScope.malo}" />
							</div>
							</td>
						</tr>
					</table>
					</form><c:if test='${sessionScope.buscado eq "true"}'>
					<form method = "post" action = "./eligeTut">
						<table align = "center">
							<tr>
								<td>
									<select name = "Elegido">
									<%Iterator itr;%>
										<%List tutores = (List)request.getAttribute("tutores");
										for(itr = tutores.iterator(); itr.hasNext();){%>
										<option value = "<%=itr.next()%>"> <%=itr.next()%> - <%=itr.next()%> </option>
									<%}%>
									</select>
								</td>
								<td>
									<input type = "submit" class="botonDatos" value = "Buscar" />
								</td>
							</tr>
						</table>
		  			</form>
					<c:set var="buscado" scope="session" value="" />
					</c:if>
					<table align = "center">
						<form method = "post" action = "./borrarTut">
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="NombreC" value = "${requestScope.nombre}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Direcci&oacute;n
							</th>
							<td>
								<input type="text" name="DireccionC" value = "${requestScope.direccion}" disabled />
							</td>
						</tr>

							<th>
								Tel&eacute;fono
							</th>
							<td>
								<input type="number" maxlength="16" size="16" name="TelefonoC" value = "${requestScope.telefono}" disabled />
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Eliminar" />
							</td>
						</tr>
						</form>
					</table>
					<div align="center">
					<c:out value = "${requestScope.resultado}" />
					</div>
					</c:if>
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