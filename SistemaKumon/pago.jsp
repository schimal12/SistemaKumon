<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Registro Pagos</title>
	<link rel="stylesheet" type="text/css" href="versionUno.css" />
</head>

<body>
	<table>
		<tr>
			<td colspan = "8" class = "encabezado">
				<img src="kumonlogo.png" />
			</td>
		</tr>

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
					
					<h1>Control de pagos</h1>
					<br />
					<form method = "post" action = "./queryPag">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked/> Alta de un pago. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un pago. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un pago. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<table align = "center">
						<form method = "post" action = "./registroPag">
						<tr>
							<th>
								Nombre Alumno
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
								Nombre de Usuario
							</th>
							<td>
								<input type="text" name="Usuario"/>
							</td>
						</tr>
						<tr>
							<th>
								Monto
							</th>
							<td>
								<input type="number" min="0" max ="9999" name="Monto" maxlength="7" size="7" / >
							</td>
						</tr>
						<tr>
							<th>
								Fecha de pago
							</th>
							<td>
								<select name = "DiaP">
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
								<select name = "MesP">
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
								<input type="number" min="2013" max ="3000" name="AnoP" maxlength="4" size="4" value="2013"/>
							</td>
						</tr>
						<tr>
							<th>
								Per&iacute;odo a pagar
							</th>
							<td>
								<select name = "Periodo">
									<option value = "Enero">Enero</option>
									<option value = "Febrero">Febrero</option>
									<option value = "Marzo">Marzo</option>
									<option value = "Abril">Abril</option>
									<option value = "Mayo">Mayo</option>
									<option value = "Junio">Junio</option>
									<option value = "Julio">Julio</option>
									<option value = "Agosto">Agosto</option>
									<option value = "Septiembre">Septiembre</option>
									<option value = "Octubre">Octubre</option>
									<option value = "Noviembre">Noviembre</option>
									<option value = "Diciembre">Diciembre</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								Tipo de pago
							</th>
							<td>
								<select name="Tipo"/>
									<option value = "Efectivo">Efectivo</option>
									<option value = "Deposito">Depósito</option>
									<option value = "Cheque">Cheque</option>
									<option value = "Transferencia">Transferencia</option>
									<option value = "Varios">Varios</option>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de registro
							</th>
							<td>
								<select name = "DiaR">
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
								<select name = "MesR">
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
								<input type="number" min="2013" max ="3000" name="AnoR" maxlength="4" size="4" value="2013"/>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<input type = "submit" class= "botonDatos" value = "Registrar" />
							</td>
						</tr>
						</form>
					</table>
					<c:out value = "${requestScope.resultado}" />
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "baja"}'>
					<h1>Control de pagos</h1>
					<br />
					<form method = "post" action = "./queryPag">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked/> Alta de un pago. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un pago. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" checked/> Baja de un pago. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<form method = "post" action = "./buscaPag">
					<table align = "center">
						<tr>
							<td>
								Inserte el nombre de alumno:
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
								Usuario:
							</td>
							<td>
								<input type = "text" name = "BuscaUsuario" />
							</td>
						</tr>
						<tr>							
							<td>
								Fecha del pago:
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
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
												
							</tr>
							
						</tr>
						<tr>
							<td colspan = "8">
								<c:out value = "${requestScope.malo}" />
							</td>
						</tr>
					</table>
					</form>
					<table align = "center">
						<form method = "post" action = "./borrarPag">
						<tr>
							<th>
								Nombre Alumno 
							</th>
							<td>
								<input type="text" name="ID_Al" value = "${requestScope.nombre}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Nombre de Usuario
							</th>
							<td>
								<input type="text" name="Usuario" value = "${requestScope.usuario}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Monto
							</th>
							<td>
								<input type="number" min="0" max ="9999" name="MontoC" maxlength="7" size="7" value = "${requestScope.monto}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Fecha de pago
							</th>
							<td>
								<input type="number" name="AnoP" maxlength="4" size="4" value = "${requestScope.fechaP}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Periodo a pagar
							</th>
							<td>
								<input type="text" name="PeriodoC" maxlength="10" size="10" value = "${requestScope.periodoP}" disabled />
							</td>
						</tr>						
						<tr>
							<th>
								Tipo de pago
							</th>
							<td>
								<input type="text" name="TipoC" maxlength="14" size="14" value = "${requestScope.tipoP}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Fecha de registro
							</th>
							<td>
								<input type="text" name="FechaR" maxlength="10" size="10" value = "${requestScope.fechaR}" disabled />
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
					
					<c:if test='${sessionScope.elegido eq "cambio"}'>
					<h1>Control de pagos</h1>
					<br />
					<form method = "post" action = "./queryPag">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un pago. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" checked/> Modificar un pago. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un pago. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
										
					<form method = "post" action = "./buscaPag">
					<table align="center">
						<tr>
							<td>
								Inserte el nombre de alumno:
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
								Usuario:
							</td>
							<td>
								<input type = "text" name = "BuscaUsuario" />
							</td>
						</tr>
						<tr>
							<td>
								Fecha del pago:
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
								
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
						</tr>
						</tr>
						<tr>
							<td colspan = "8">
								<c:out value = "${requestScope.malo}" />
							</td>
						</tr>
					</table>
					</form>
					<c:if test='${sessionScope.buscado2 eq "true"}'>
					<table align = "center">
						<form method = "post" action = "./cambiarPag">
						<tr>
							<th>
								Nombre Alumno: 
							</th>
							<td>
								<input type="text" name="ID_Al" value = "${requestScope.nombre}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Nombre de Usuario
							</th>
							<td>
								<input type="text" name="Usuario" value = "${requestScope.usuario}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Monto
							</th>
							<td>
								<input type="number" min="0" max="9999" name="MontoC" maxlength="7" size="7" value = "${requestScope.monto}" />
							</td>
						</tr>
						<tr>
							<th>
								Fecha de pago
							</th>
							<td>
								<input type="text" name="AnoP" value = "${requestScope.fechaP}" disabled />
							</td>
						</tr>
						<tr>
							<th>
								Per&iacute;odo a pagar
							</th>
							<td>
								<input type="text" name="PeriodoC" value = "${requestScope.periodoP}" />
							</td>
						</tr>
						<tr>
							<th>
								Tipo de pago
							</th>
							<td>
								<input type="text" name="TipoC" value = "${requestScope.tipoP}" />
							</td>
						</tr>
						<tr>
							<th>
								Fecha de registro
							</th>
							<td>
								<input type="text" name="FechaR" value = "${requestScope.fechaR}" disabled />
							</td>
							<td>
								<select name = "DiaRC">
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
								<select name = "MesRC">
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
								<input type="number" min="2013" max ="3000" name="AnoRC" maxlength="4" size="4" value="2013"/>
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