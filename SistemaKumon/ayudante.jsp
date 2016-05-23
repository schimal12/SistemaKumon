<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Registro Ayudantes</title>
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
					<h1>Control de ayudantes</h1>
					<br />
					<form method = "post" action = "./queryAy">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" checked/> Alta de un ayudante <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un ayudante <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un ayudante <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					
					<table align = "center">
						<form method = "post" action = "./registroAyu">
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
								Usuario
							</th>
							<td>
								<input type="text" name="Usuario"/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de registro
							</th>
							
							<td>
								<select name = "DiaReg">
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
								<select name = "MesReg">
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
								<input type="number" name="AnoReg" maxlength="4" size="4" min="2013" max="3000" value="2013"/>
							</td>
						</tr>
						<tr>
							<th>
								Hora de Entrada
							</th>
							<td>
								<input type="timestamp" name="HoraEntrada"/>
							</td>
						</tr>
						<tr>
							<th>
								Hora de Salida
							</th>
							<td>
								<input type="time" name="HoraSalida"/>
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
					<div align = "center">
					<c:if test='${sessionScope.elegido eq "cambio"}'>
					
					</div>
					<h1>Control de ayudantes</h1>
					<br />
					<form method = "post" action = "./queryAy">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un ayudante. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" checked /> Modificar un ayudante. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" /> Baja de un ayudante. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<form method = "post" action = "./buscaAy">
					<table align="center">
						<tr>
							<td>
								Inserte el nombre:
							</td>
							<td>
								<input type = "text" name = "BuscaNombre" />
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
								Fecha de registro del ayudante a modificar:
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
								<input type="number" maxlength ="4" size="4" name="BuscaAno" min="2013" max="3000" value="2013" />
							</td>
							<td>
								
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
						</tr>
						<tr>
							<td colspan = "8">
							<div align="center">
								<c:out value = "${requestScope.malo}" />
							</div>
							</td>
						</tr>
					</table>
					</form>
					
					<c:if test='${sessionScope.buscado eq "true"}'>
					<table align = "center">
						<form method = "post" action = "./cambiarAyu">
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="Nombre" value = "${requestScope.nombre}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Usuario
							</th>
							<td>
								<input type="text" name="Usuario"  value = "${requestScope.usuario}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de registro
							</th>
							<td>
								<input type="date" name="AnoReg"  value = "${requestScope.fechaR}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Hora de Entrada
							</th>
							<td>
								<input type="time" name="HoraEntradaC" value = "${requestScope.horaEnt}"/>
							</td>
						</tr>
						<tr>
							<th>
								Hora de Salida
							</th>
							<td>
								<input type="time" name="HoraSalidaC" value = "${requestScope.horaSal}"/>
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
					<div align="center">
					<c:out value = "${requestScope.resultado}" />
					</div>
					</c:if>
					
					<c:if test='${sessionScope.elegido eq "baja"}'>
					<h1>Control de ayudantes</h1>
					<br />
					<form method = "post" action = "./queryAy">
					<table align = "center">
						<tr>
							<td>
								<input type = "radio" name = "query" value = "Alta" /> Alta de un ayudante. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Cambio" /> Modificar un ayudante. <br />
							</td>
							<td>
								<input type = "radio" name = "query" value = "Baja" checked /> Baja de un ayudante. <br />
							</td>
							<td>
								<input type = "submit" class="botonDatos" value = "Seleccionar" />
							</td>
						</tr>
					</table>
					</form>
					<form method = "post" action = "./buscaAy">
					<table>
						<tr>
							<td>
								Inserte el nombre:
							</td>
						
							<td>
								<input type = "text" name = "BuscaNombre" />
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
								Fecha de registro del ayudante a modificar:
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
								<input type="number" name="BuscaAno" maxlength="4" size="4" min="2013" max="3000" value="2013" />
							</td>
							
								
							
							<td>
								<input type = "submit" class="botonDatos" value = "Buscar" />
							</td>
						</tr>
						<tr>
							<td colspan = "8">
							<div align="center">
								<c:out value = "${requestScope.malo}" />
							</div>
							</td>
						</tr>
					</table>
					</form>
					<table align = "center">
						<form method = "post" action = "./borrarAyu">
						<tr>
							<th>
								Nombre
							</th>
							<td>
								<input type="text" name="Nombre" value = "${requestScope.nombre}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Usuario
							</th>
							<td>
								<input type="text" name="Usuario"  value = "${requestScope.usuario}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Fecha de registro
							</th>
							<td>
								<input type="date" name="AnoReg"  value = "${requestScope.fechaR}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Hora de Entrada
							</th>
							<td>
								<input type="time" name="HoraEntradaC" value = "${requestScope.horaEnt}" disabled/>
							</td>
						</tr>
						<tr>
							<th>
								Hora de Salida
							</th>
							<td>
								<input type="time" name="HoraSalidaC" value = "${requestScope.horaSal}" disabled/>
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
				<div align="center">
				<c:if test='${applicationScope.logged eq "false"}'>
					<p class = "cuerpoUno">No se ha identificado para poder acceder a esta p&aacute;gina.</p>
				</c:if>
				</div>
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