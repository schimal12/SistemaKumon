<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Registro Usuarios</title>
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
					<h1>Control de Usuarios</h1>
					<br />
					<form method = "post" action = "./queryUsu">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked/> Alta de un usuario. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un usuario. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un usuario. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<table align = "center">
						<form method = "post" action = "./registroUsu">
						<tr>
							<th>
								Nombre de Usuario
							</th>
							<td>
								<input type="text" name="Nombre"/>
							</td>
						</tr>
						<tr>
							<th>
								Contrase&ntilde;a
							</th>
							<td>
								<input type="password" name="Contrasena"/>
							</td>
						</tr>
						<tr>
							<th>
								Confirma tu contrase&ntilde;a
							</th>
							<td>
								<input type="password" name="ContrasenaCon"/>
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
					<h1>Control de Usuarios</h1>
					<br />
					<form method = "post" action = "./queryUsu">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un usuario. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" checked/> Modificar un usuario. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un usuario. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<form method = "post" action = "./buscaUsu">
					<table align="center">
						<tr>
							<td>
								Inserte el nombre de usuario que desee modificar:
							</td>
							<td>
								<input type = "text" name = "BuscaID" />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
							<td>
								<c:out value = "${requestScope.malo}" />
							</td>
						</tr>
					</table>
					</form>
					
					<c:if test='${sessionScope.buscado eq "true"}'>
					<table align = "center">
						<form method = "post" action = "./cambiarUsu">
						<tr>
							<th>
								Nombre de Usuario
							</th>
							<td>
								<input type="text" name="Nombre" value = "${requestScope.usuario}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Contrase&ntilde;a anterior
							</th>
							<td>
								<input type="password" name="ContrasenaAnt"/>
							</td>
						</tr>
						<tr>
							<th>
								Contrase&ntilde;a nueva
							</th>
							<td>
								<input type="password" name="ContrasenaC"/>
							</td>
						</tr>
						<tr>
							<th>
								Confirma tu contrase&ntilde;a
							</th>
							<td>
								<input type="password" name="ContrasenaConC"/>
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
					<c:set var="buscado" scope="session" value="" />
					</c:if>
					<c:out value = "${requestScope.resultado}" />
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "baja"}'>
					<h1>Control de Usuarios</h1>
					<br />
					<form method = "post" action = "./queryUsu">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un usuario. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un usuario. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" checked/> Baja de un usuario. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<form method = "post" action = "./buscaUsu">
					<table align="center">
						<tr>
							<td>
								Inserte el nombre de usuario que desee eliminar:
							</td>
							<td>
								<input type = "text" name = "BuscaID" />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
							<td>
								<c:out value = "${requestScope.malo}" />
							</td>
						</tr>
					</table>
					</form>
					<table align = "center">
						<form method = "post" action = "./borrarUsu">
						<tr>
							<th>
								Nombre de Usuario
							</th>
							<td>
								<input type="text" name="Nombre" value = "${requestScope.usuario}" disabled />
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
					<c:out value = "${requestScope.resultado}" />
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