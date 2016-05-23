<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Registro Sesiones</title>
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
					<h1>Control de sesiones</h1>
					<br />
					<form method = "post" action = "./querySes">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked /> Alta de una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<table align = "center">
						<form method = "post" action = "./registroSes">
						<tr>
							<th>
								Nombre del alumno
							</th>
							<td>
								<c:if test='${sessionScope.buscado eq ""}'>
									<input type="text" name="ID_Al"/>
								</c:if>
								<c:if test='${sessionScope.buscado eq "true"}'>
									<select name = "ID_Al2">
									<%Iterator itr;%>
										<%List alumnos = (List)request.getAttribute("alumnos");
										for(itr = alumnos.iterator(); itr.hasNext();){%>
										<option value = "<%=itr.next()%>"> <%=itr.next()%> - <%=itr.next()%> </option>
									<%}%>
									</select>
								<c:set var="buscado" scope="session" value="" />
								</c:if>
							</td>
						</tr>
						<tr>
							<th>
								Duraci&oacute;n
							</th>
							<td>
								<input type="number" name="Duracion" min="1" max ="90" format='minutos' maxlength="4" size="3" value="30"/>
								minutos
							</td>
							
						</tr>
						<tr>
							<th>
								Fecha de sesi&oacute;n
							</th>
							<td>
								<select name = "DiaS">
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
								<select name = "MesS">
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
								<input  type="number" min="2013" max ="3000" name="AnoS" maxlength="4" size="4" value="2013"/>
							</td>
						</tr>
						<tr>
							<th>
								Avance
							</th>
							<td>
								<input type="text" maxlength="5" size="5" name="Avance"/>
							</td>
						</tr>
						<tr>
							<th>
								Calificaci&oacute;n
							</th>
							<td>
								<input type="number" min="69" max ="100" name="Calificacion" maxlength="3" size="3" value="100"/>
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
					<h1>Control de sesiones</h1>
					<br />
					<form method = "post" action = "./querySes">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" checked/> Modificar una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<form method = "post" action = "./buscaSes"><table align = "center">
						<tr>
							<td>
								Inserte el nombre del alumno:
							</td>
							<td>
								<c:if test='${sessionScope.buscado eq ""}'>
									<input type = "text" name = "BuscaNombre" />
								</c:if>
								<c:if test='${sessionScope.buscado eq "true"}'>
									<select name = "ID_Al2">
									<%Iterator itr;%>
										<%List alumnos = (List)request.getAttribute("alumnos");
										for(itr = alumnos.iterator(); itr.hasNext();){%>
										<option value = "<%=itr.next()%>"> <%=itr.next()%> - <%=itr.next()%> </option>
									<%}%>
									</select>
								<c:set var="buscado" scope="session" value="" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								Fecha de la sesi&oacute;n a eliminar: 
							</td>
							<td>
								<select name = "BuscaDia">
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
								<select name = "BuscaMes">
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
								<input type="number" min="2013" max ="3000" name="BuscaAno" maxlength="4" size="4" value="2013"/>
							</td>
							
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
						</tr>
						<tr>
							<td colspan = "6">
							<div align= "center">
								<c:out value = "${requestScope.malo}" />
							</div>
							</td>
						</tr>
					</table>
					</form>
					
					<c:if test='${sessionScope.buscado2 eq "true"}'>
					<table align = "center">
						<form method = "post" action = "./cambiarSes">
						<tr>
							<th>
								Nombre del alumno
							</th>
							<td>
								<input type="text" name="ID_Al" value = "${requestScope.nombre}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Duraci&oacute;n
							</th>
							<td>
								<input type="number" min="1" max ="90" maxlength="3" size="3" name="DuracionC" value = "${requestScope.duracion}" />
								minutos.
							</td>
						</tr>
						<tr>
							<th>
								Fecha de sesion
							</th>
							<td>
								<input type="text" name="AnoS" value = "${requestScope.fechaS}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Avance
							</th>
							<td>
								<input type="text" maxlength="5" size="5" name="AvanceC" value = "${requestScope.avance}" />
							</td>
						</tr>
						<tr>
							<th>
								Calificaci&oacute;n
							</th>
							<td>
								<input type="number" min="69" max ="100" name="CalificacionC" value = "${requestScope.cali}" maxlength="3" size="3" />
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
					<c:out value = "${requestScope.resultado}" />
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "baja"}'>
					<h1>Control de sesiones</h1>
					<br />
					<form method = "post" action = "./querySes">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked /> Alta de una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" checked /> Baja de una sesi&oacute;n <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<form method = "post" action = "./buscaSes">
					<table align = "center">
						<tr>
							<td>
								Inserte el nombre del alumno:
							</td>
							<td>
								<c:if test='${sessionScope.buscado eq ""}'>
									<input type = "text" name = "BuscaNombre" />
								</c:if>
								<c:if test='${sessionScope.buscado eq "true"}'>
									<select name = "ID_Al2">
									<%Iterator itr;%>
										<%List alumnos = (List)request.getAttribute("alumnos");
										for(itr = alumnos.iterator(); itr.hasNext();){%>
										<option value = "<%=itr.next()%>"> <%=itr.next()%> - <%=itr.next()%> </option>
									<%}%>
									</select>
								<c:set var="buscado" scope="session" value="" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								Fecha de la sesi&oacute;n a eliminar: 
							</td>
							<td>
								<select name = "BuscaDia">
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
								<select name = "BuscaMes">
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
								<input type="number" min="2013" max="3000" name="BuscaAno" maxlength="4" size="4" value="2013" />
							</td>
							
							<td>
								<input type = "submit" class="botonDatos"  value = "Buscar" />
							</td>
						</tr>
						<tr>
							<td colspan = "6">
								<c:out value = "${requestScope.malo}" />
							</td>
						</tr>
					</table>
					</form>
					<table align = "center">
						<form method = "post" action = "./borrarSes">
						<tr>
							<th>
								Nombre del alumno
							</th>
							<td>
								<input type="text" name="ID_Al" value = "${requestScope.nombre}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Duraci&oacute;n
							</th>
							<td>
								<input type="number" min="1" max ="999" maxlength="3" size="3" value = "${requestScope.duracion}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Fecha de sesion
							</th>
							<td>
								<input type="text" name="AnoS" value = "${requestScope.fechaS}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Avance
							</th>
							<td>
								<input type="text" maxlength="5" size="5" name="AvanceC" value = "${requestScope.avance}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Calificaci&oacute;n
							</th>
							<td>
								<input type="number" min="69" max ="100" maxlength="3" size="3" name="CalificacionC" value = "${requestScope.cali}" disabled />
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