<%-- 
    Document   : pago
    Created on : 29/05/2020, 10:24:17 PM
    Author     : bocal
--%>

<%@page import="Control.Detalleventa"%>
<%@page import="Control.Mangas"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pago</title>
        <link href="css/botones.css" rel="stylesheet">
        <script type="text/javascript" src="js/validar3.js"></script>
        <link href="css/pago.css" rel="stylesheet">
    </head>
    <body>
    <%
try{
String usuario = "";
HttpSession sesionOk = request.getSession();
Vector<Detalleventa> vectorDetalles=(Vector<Detalleventa>)sesionOk.getAttribute("detalleVenta");
Vector<Mangas> vectorStock=(Vector<Mangas>)sesionOk.getAttribute("stockProducto");

if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else {
usuario = (String)sesionOk.getAttribute("usuario");
}
boolean conf = false;
boolean conf2 = false;
if(vectorDetalles==null || vectorStock==null){
%>
<jsp:forward page="error.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
}else{
    for(Detalleventa det:vectorDetalles){
        if(det.getIdM()==0){
            conf=false;
        }else{
            conf=true;
        }
    }
    for(Mangas m:vectorStock){
        if(m.getStock()<0){
            conf2=false;
        }else{
            conf2=true;
        }
    }
}
if(conf==false || conf2==false){
    response.sendRedirect("error.jsp");
}else{%>

<div class="centro">
    <h1>Confirmación de tarjeta</h1>
    <div class="color2">
        <div class="margen">
        <form name="tarjeta" action="ConfirmarTarjeta">
            <label for="tipoT">Servicio</label>
            <select class="input" id="tipoT" name="tipTar">
                <option>Tarjeta</option>
                <option>PayPal</option>
                <option>Efectivo</option>
            </select><br><br>
            <p>Si paga en PayPal o en efectivo no es necesario llenar los campos siguientes</p>
            <label for="numeroT">Numero de Tarjeta</label><br>
            <input type="text" id="numeroT" name="numTar"/><br>
            
            <label>Fecha de vencimiento</label><br>
            <input type="text" name="mesTar" placeholder="Mes"/><br>
            <input type="text" name="anoTar" placeholder="Año"/><br>
            <input type="text" name="codTar" placeholder="CVV"/><br>
            
            <label>Datos de Tarjeta habiente</label><br>
            <input type="text" name="nomTar" placeholder="Nombre"/><br>
            <input type="text" name="appatTar" placeholder="Apellido Paterno"/><br>
            <input type="text" name="apmatTar" placeholder="Apellido Materno"/><br>
            <input class="boton2" type="submit" value="Aceptar" onclick="return validarT()"><br>
        </form>
        </div>
    </div>

    <%}
    }catch(Exception e){
        System.out.println("Error en pago");
        System.out.println(e.getMessage());
        System.out.println(e.getStackTrace());
    }
    %>
</div>
    </body>
    <style>
.color2{
    margin-top: 20px;
    width: 25rem;
    margin-left: auto;
    margin-right: auto;
    color:white;
    padding:20px;
    border: 3px solid black;
    background: black;
    font-size: 1.5rem;
}

.color2:hover{
    background: white;
}

.margen{
   border: 3px dashed white;
   padding: 10px;
   background-color: black;
}
.margen:hover{
   border: 3px dashed black;
   padding: 10px;
   background: white;
   color: black;
}

.centro{
    text-align: center;
}

input{
    border: 1px solid black;
    margin-top:1rem;
    
}
input:hover{
    color:white;
    background: black;
    border: 1px solid white;
}

.input{
    border: 1px solid black;
    margin-top:1rem;
    height: 2rem;
    width:9rem;
}
.input:hover{
    color:white;
    background: black;
    border: 1px solid white;
}

.boton2{
    border: 1px solid black;
    margin-top:1rem;
    font-weight: bold;
    padding: 1rem;
    height: 2em;
    padding-top: 0.5em;
}
.boton2:hover{
    color:white;
    background: black;
    border: 1px solid white;
}
    </style>
</html>
