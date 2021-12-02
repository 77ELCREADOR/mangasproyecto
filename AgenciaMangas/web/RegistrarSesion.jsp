
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") != null) {
%>
<jsp:forward page="CerrarSesion">
<jsp:param name="error" value="Sesión Cerrada"/>
</jsp:forward>
<%
} else {
System.out.println("RegistrarSesion");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <title>Registrar Sesión</title>
        <link rel="stylesheet" type="text/css" href="css/estilos3.css">
        <script type="text/javascript" src="js/validar1.js"></script>
    </head>
    <body>
        <div class="is">
            <br>
        <h1>Crea tu Sesión!!!!!</h1>
        <form name="formulario1" action="GuardarU" method="POST" class="tab">
            <table>
                <tr>
                    <td>Nombre(s): </td>
                    <td><input type="text" name="nomU"/></td>
                </tr>
                <tr>
                    <td>Apellido Paterno: </td>
                    <td><input type="text" name="appatU"/></td>
                </tr>
                <tr>
                    <td>Apellido Materno: </td>
                    <td><input type="text" name="apmatU"/></td>
                </tr>
                <tr>
                    <td>CURP: </td>
                    <td><input type="text" name="curpU"/></td>
                </tr>
                <tr>
                    <td>Calle: </td>
                    <td><input type="text" name="calleDU" size="10" placeholder="Calle"/></td>
                </tr>
                <tr>
                    <td>Num Exterior: </td>
                    <td><input type="text" name="exU" size="10"/></td>
                </tr>
                <tr>
                    <td>Num Interior: </td>
                    <td><input type="text" name="inU" size="10" placeholder="0"/></td>
                </tr>
                <tr>
                    <td>Colonia: </td>
                    <td><input type="text" name="colDU" size="15" placeholder="Colonia"/></td>
                </tr>
                <tr>
                    <td>Fecha de nacimiento: </td>
                    <td><input type="text" name='fNacU' size="10" placeholder="yyyy-mm-dd" /></td>
                </tr>
                <tr>
                    <td>CP: </td>
                    <td><input type="text" name="cpU" size="6"/></td>
                </tr>
                <tr>
                    <td>Telefono: </td>
                    <td id="nT">55<input type="text" name="telU" size="8"/></td>
                </tr>

                <tr>
                    <td>Ingresa tu nombre de usuario: </td>
                    <td><input type="text" name="nomCU"/></td>
                </tr>
                <tr>
                    <td>Ingresa tu contraseña: </td>
                    <td><input type="text" name="contU"/></td>
                </tr>
            </table>
            <br>
            <input type="submit" name="botonRU" value="Aceptar" onclick="return validacionRS()" />
        </form><br>
        <a href="IniciarSesion.jsp">Ya tienes cuenta?</a><br>
        <a href="index.html">Regresar al index</a>
        </div>
    </body>
</html>
