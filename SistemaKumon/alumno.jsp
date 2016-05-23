<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Registro Alumnos</title>
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
				<a href = "index2.jsp" class = "menu" > Inicio </a>
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
					
					<h1>Control de alumnos</h1>
					<br />
					<form method = "post" action = "./query">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked/> Alta de un alumno <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio"  /> Modificar un alumno <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un alumno <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
						<form method = "post" action = "./registroAl">
						<table align = "center">
						<tr>
							<th>
								Nombre Tutor
							</th>
							<td>
								<input type="text" name="ID_Tutor" value = "${requestScope.idTutor}"/>
							</td>
						</tr>
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="Nombre" value = "${requestScope.nombre}"/>
							</td>
						</tr>
						<tr>
							<th>
								Direcci&oacute;n
							</th>
							<td>
								<input type="text" name="Direccion" value = "${requestScope.direccion}"/>
							</td>
						</tr>
						<tr>
							<th>
								Tel&eacute;fono
							</th>
							<td>
								<input type="number" name="Telefono" value="${requestScope.telefono}"/>
							</td>
						</tr>
						<tr>
							<th>
								Grado escolar
							</th>
							<td>
							<select name = "Grado escolar">
									<option value = "01">Kinder 1</option>
									<option value = "02">Kinder 2</option>
									<option value = "03">Preprimaria</option>
									<option value = "04">1° Primaria</option>
									<option value = "05">2° Primaria</option>
									<option value = "06">3° Primaria</option>
									<option value = "07">4° Primaria</option>
									<option value = "08">5° Primaria</option>
									<option value = "09">6° Primaria</option>
									<option value = "10">1° Secundaria</option>
									<option value = "11">2° Secundaria</option>
									<option value = "12">3° Secundaria</option>
									<option value = "13">4° Preparatoria</option>
									<option value = "14">5° Preparatoria</option>
									<option value = "15">6° Preparatoria</option>
									<option value = "16">Universidad</option>
									<option value = "17">Otro</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								Nivel
							</th>
							<td>
							<select name = "Nivel">
									<option value = "1">7A</option>
									<option value = "2">6A</option>
									<option value = "3">5A</option>
									<option value = "4">4A</option>
									<option value = "5">3A</option>
									<option value = "6">2A</option>
									<option value = "7">A</option>
									<option value = "8">B</option>
									<option value = "9">C</option>
									<option value = "10">D</option>
									<option value = "11">E</option>
									<option value = "12">F</option>
									<option value = "13">G</option>
									<option value = "14">H</option>
									<option value = "15">I</option>
									<option value = "16">J</option>
									<option value = "17">K</option>
									<option value = "18">L</option>
									<option value = "19">M</option>
									<option value = "20">N</option>
									<option value = "21">O</option>
								</select>
								</td>
						</tr>
						<tr>
							<th>
								Fecha de nacimiento
							</th>
							<td>
								<select name = "DiaNac">
									<option value = "01">01</option>
									<option value = "02">02</option>
									<option value = "03">03</option>
									<option value = "04">04</option>
									<option value = "05">05</option>
									<option value = "06">06</option>
									<option value = "07">07</option>
									<option value = "08">08</option>
									<option value = "09">09</option>
									<option value = "10">10</option>
									<option value = "11">11</option>
									<option value = "12">12</option>
									<option value = "13">13</option>
									<option value = "14">14</option>
									<option value = "15">15</option>
									<option value = "16">16</option>
									<option value = "17">17</option>
									<option value = "18">18</option>
									<option value = "19">19</option>
									<option value = "20">20</option>
									<option value = "21">21</option>
									<option value = "22">22</option>
									<option value = "23">23</option>
									<option value = "24">24</option>
									<option value = "25">25</option>
									<option value = "26">26</option>
									<option value = "27">27</option>
									<option value = "28">28</option>
									<option value = "29">29</option>
									<option value = "30">30</option>
									<option value = "31">31</option>
								</select>
								<select name = "MesNac">
									<option value = "01">Enero</option>
									<option value = "02">Febrero</option>
									<option value = "03">Marzo</option>
									<option value = "04">Abril</option>
									<option value = "05">Mayo</option>
									<option value = "06">Junio</option>
									<option value = "07">Julio</option>
									<option value = "08">Agosto</option>
									<option value = "09">Septiembre</option>
									<option value = "10">Octubre</option>
									<option value = "11">Noviembre</option>
									<option value = "12">Diciembre</option>
								</select>
								<input type="number" min="1800" max ="3000" name="AnoNac" maxlength="4" size="4"  value = "1900"/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de inscripci&oacute;n
							</th>
							<td>
								<select name = "DiaIns">
									<option value = "01">01</option>
									<option value = "02">02</option>
									<option value = "03">03</option>
									<option value = "04">04</option>
									<option value = "05">05</option>
									<option value = "06">06</option>
									<option value = "07">07</option>
									<option value = "08">08</option>
									<option value = "09">09</option>
									<option value = "10">10</option>
									<option value = "11">11</option>
									<option value = "12">12</option>
									<option value = "13">13</option>
									<option value = "14">14</option>
									<option value = "15">15</option>
									<option value = "16">16</option>
									<option value = "17">17</option>
									<option value = "18">18</option>
									<option value = "19">19</option>
									<option value = "20">20</option>
									<option value = "21">21</option>
									<option value = "22">22</option>
									<option value = "23">23</option>
									<option value = "24">24</option>
									<option value = "25">25</option>
									<option value = "26">26</option>
									<option value = "27">27</option>
									<option value = "28">28</option>
									<option value = "29">29</option>
									<option value = "30">30</option>
									<option value = "31">31</option>
								</select>
								<select name = "MesIns">
									<option value = "01">Enero</option>
									<option value = "02">Febrero</option>
									<option value = "03">Marzo</option>
									<option value = "04">Abril</option>
									<option value = "05">Mayo</option>
									<option value = "06">Junio</option>
									<option value = "07">Julio</option>
									<option value = "08">Agosto</option>
									<option value = "09">Septiembre</option>
									<option value = "10">Octubre</option>
									<option value = "11">Noviembre</option>
									<option value = "12">Diciembre</option>
								</select>
								<input type="number" min="2013" max ="3000" name="AnoIns" maxlength="4" size="4"  value = "2013"/>
							</td>
						</tr>
						<tr>
							<th>
								Estatus de pago
							</th>
							<td class>
								<select name = "Estatus">
									<option value = "TRUE">Al corriente</option>
									<option value = "FALSE">Retrasado</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								Beca
							</th>
							<td class>
								<select name = "Beca">
									<option value = "TRUE">S&iacute;</option>
									<option value = "FALSE">No</option>
								</select>
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
					<h1>Control de alumnos</h1>
					<br />
					<form method = "post" action = "./query">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un alumno <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" checked /> Modificar un alumno <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un alumno <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" onClick="javascript:select_radio()"/>
							</td>
						</tr>
					</table>
					</form>
					<form method = "post" action = "./buscaAl">
					<table align = "center">
						<tr>
							<td>
								Inserte el nombre completo del alumno que desee modificar:
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
					<form method = "post" action = "./eligeAl">
						<table align = "center">
							<tr>
								<td>
									<select name = "Elegido">
									<%Iterator itr;%>
										<%List alumnos = (List)request.getAttribute("alumnos");
										for(itr = alumnos.iterator(); itr.hasNext();){%>
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
					<form method = "post" action = "./cambiarAl">
					<table align = "center">
						<tr>
							<th>
								Nombre Tutor
							</th>
							<td>
								<input type="text" name="ID_TutorC" value = "${requestScope.idTutor}"/>
							</td>
						</tr>
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="NombreC" value = "${requestScope.nombre}"/>
							</td>
						</tr>
						<tr>
							<th>
								Direcci&oacute;n
							</th>
							<td>
								<input type="text" name="DireccionC" value = "${requestScope.direccion}"/>
							</td>
						</tr>
						<tr>
							<th>
								Tel&eacute;fono
							</th>
							<td>
								<input type="number" name="TelefonoC" value="${requestScope.telefono}"/>
							</td>
						</tr>
						<tr>
							<th>
								Grado escolar
							</th>
							<td>
							<select name = "GradoC">
									<option value = "01">Kinder 1</option>
									<option value = "02">Kinder 2</option>
									<option value = "03">Preprimaria</option>
									<option value = "04">1° Primaria</option>
									<option value = "05">2° Primaria</option>
									<option value = "06">3° Primaria</option>
									<option value = "07">4° Primaria</option>
									<option value = "08">5° Primaria</option>
									<option value = "09">6° Primaria</option>
									<option value = "10">1° Secundaria</option>
									<option value = "11">2° Secundaria</option>
									<option value = "12">3° Secundaria</option>
									<option value = "13">4° Preparatoria</option>
									<option value = "14">5° Preparatoria</option>
									<option value = "15">6° Preparatoria</option>
									<option value = "16">Universidad</option>
									<option value = "17">Otro</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								Nivel
							</th>
							<td>
							<select name = "NivelC">
									<option value = "01">7A</option>
									<option value = "02">6A</option>
									<option value = "03">5A</option>
									<option value = "04">4A</option>
									<option value = "05">3A</option>
									<option value = "06">2A</option>
									<option value = "07">A</option>
									<option value = "08">B</option>
									<option value = "09">C</option>
									<option value = "10">D</option>
									<option value = "11">E</option>
									<option value = "12">F</option>
									<option value = "13">G</option>
									<option value = "14">H</option>
									<option value = "15">I</option>
									<option value = "16">J</option>
									<option value = "17">K</option>
									<option value = "18">L</option>
									<option value = "19">M</option>
									<option value = "20">N</option>
									<option value = "21">O</option>
								</select>
								</td>
						</tr>
						<tr>
							<th>
								Fecha de nacimiento
							</th>
							<td>
								<input type="text" name="FechaNacC" value = "${requestScope.fechaNac}"/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de inscripci&oacute;n
							</th>
							<td>
								<input type="text" name="FechaInsC" value = "${requestScope.fechaIns}"/>
							</td>
						</tr>
						<tr>
							<th>
								Estatus de pago
							</th>
							<td>
								<input type="text" name="EstatusAux" value = "${requestScope.estatus}" disabled/>
							</td>
							<td>
								<select name = "EstatusC">
									<option value = "TRUE">Al corriente</option>
									<option value = "FALSE">Retrasado</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								Beca
							</th>
							<td>
								<input type="text" name="BecaAux" value = "${requestScope.becado}" disabled/>
							</td>
							<td>
								<select name = "BecaC">
									<option value = "TRUE">S&iacute;</option>
									<option value = "FALSE">No</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Guardar" />
							</td>
						</tr>
					</table>
					</form>
					<c:set var="buscado2" scope="session" value="" />
					</c:if>
					<div align="center">
						<c:out value = "${requestScope.resultado}" />
					</div>
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "baja"}'><h1>Control de alumnos</h1>
					<br />
					<form method = "post" action = "./query">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un alumno <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio"  /> Modificar un alumno <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" checked/> Baja de un alumno <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" onClick="javascript:select_radio()"/>
							</td>
						</tr>
					</table>
					</form>
					
					<form method = "post" action = "./buscaAl">
					<table align = "center">
						<tr>
							<td>
								Inserte el nombre del alumno que desee dar de baja:
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
					<form method = "post" action = "./eligeAl">
						<table align = "center">
							<tr>
								<td>
									<select name = "Elegido">
									<%Iterator itr;%>
										<%List alumnos = (List)request.getAttribute("alumnos");
										for(itr = alumnos.iterator(); itr.hasNext();){%>
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
					
					<form method = "post" action = "./borrarAl">
					<table align = "center">
						<tr>
							<th>
								Nombre del Tutor
							</th>
							<td>
								<input type="text" name="ID_TutorC" value = "${requestScope.idTutor}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="NombreC" value = "${requestScope.nombre}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Direcci&oacute;n
							</th>
							<td>
								<input type="text" name="DireccionC" value = "${requestScope.direccion}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Tel&eacute;fono
							</th>
							<td>
								<input type="number" name="TelefonoC" value="${requestScope.telefono}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Grado escolar
							</th>
							<td>
								<input type="text" name="GradoC" value = "${requestScope.grado}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Nivel
							</th>
							<td>
								<input type="text" name="NivelC" value = "${requestScope.nivel}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de nacimiento
							</th>
							<td>
								<input type="text" name="FechaNacC" value = "${requestScope.fechaNac}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de inscripci&oacute;n
							</th>
							<td>
								<input type="text" name="FechaInsC" value = "${requestScope.fechaIns}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Estatus de pago
							</th>
							<td>
								<input type="text" name="EstatusAux" value = "${requestScope.estatus}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Beca
							</th>
							<td>
								<input type="text" name="BecaAux" value = "${requestScope.becado}" disabled/>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Eliminar" />
							</td>
						</tr>
					</table>
					</form>
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