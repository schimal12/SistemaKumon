<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<link rel="stylesheet" src="//normalize-css.googlecode.com/svn/trunk/normalize.css" />
	<title>Sistema Kumon</title>
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
			<td colspan = "8">
			</td>
		</tr>
		<tr>
			<td colspan = "8" class = "principal">
				<br />
				<br />
				<br />
				<h1>Ingreso al sistema</h1>
				<br />
				<br />
				<table align = "center">
					<form method = "post" action = "./ingreso">
					
					<tr>
						<th>
							Nombre de usuario
						</th>
						<td>
							<input type="text" name="Usuario"/>
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
						<td>
						</td>
						<td>
							<input type = "submit" class="botonDatos" value = "Entrar" />
						</td>
					</tr>
					</form>
				</table>
				<br />
				<br />
				<p class = "cuerpoUno"><c:out value = "${requestScope.ingreso}" /></p>
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
				Copyright © 2013 Kumon North America, Inc. Todos los derechos reservados.
			</td>
		</tr>
	</table>
</body>

</html>