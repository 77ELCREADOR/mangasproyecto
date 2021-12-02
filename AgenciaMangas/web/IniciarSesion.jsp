<%-- 
    Document   : IniciarSesion
    Created on : 16/04/2020, 07:05:31 PM
    Author     : bocal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.util.*,java.text.*" %>
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
System.out.println("IniciarSesion");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IniciarSesion</title>
        <link rel="stylesheet" type="text/css" href="css/estilos2.css">
    </head>
    <body>
        <div class="is">
            <br><header><h1>Iniciar Sesión</h1></header>
            <form action="ControladorIS" name="formularioIS" method="POST" class="tab">
            <table class="tab">
            <tr>
                <td>Usuario: </td>
                <td><input type="text" name="nomSU" draggable="return false"/></td>
            </tr>
            <tr>
                <td>Contraseña</td>
                <td><input type="text" name="contU" draggable="return false"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="botonIS" value="Aceptar"/></td>
            </tr>            
        </table><br>
        </form>
            <br><br>
            <img src="images/home/manga.jpg" width="250px"/>
            <br><br>
            <a href="RegistrarSesion.jsp">No tienes cuenta?</a><br>
            <a href="index.html">Regresar al index</a>
        </div>
    
    </body>
</html>
