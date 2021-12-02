<%-- 
    Document   : Mensaje
    Created on : 26/05/2020, 02:33:35 PM
    Author     : bocal
--%>

<%@page import="Control.conexionM"%>
<%@page import="Control.Venta"%>
<%@page import="java.util.List"%>
<%@page import="Control.Historial"%>
<%@page import="Control.Detalleventa"%>
<%@page import="Control.Mangas"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%

System.out.println("a encontrar el error");
String usuario = "";
HttpSession sesionOk = request.getSession();

if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else {
usuario = (String)sesionOk.getAttribute("usuario");
System.out.println("Todavia hay sesiones activas");
}
Vector<Detalleventa> vectorDetalles=(Vector<Detalleventa>)sesionOk.getAttribute("detalleVenta");
Vector<Mangas> vectorStock=(Vector<Mangas>)sesionOk.getAttribute("stockProducto");
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
}else{
String idS=request.getParameter("idS");
String servicio;
if("1".equals(idS)){
    servicio="PayPal";
}else if("2".equals(idS)){
    servicio="Efectivo";
}else{
    servicio="Tarjeta";
}
String idUS = (String)session.getAttribute("id");
int idU = Integer.parseInt(idUS);
System.out.println("el id que llega a mensaje "+idU);
List<Venta> listav = Historial.getHistorialByUsuarioMax(idU);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exitosa 1 MANGACOMP</title>
        <link rel="stylesheet" type="text/css" href="css/tiket.css">
        <link rel="stylesheet" type="text/css" href="css/botones.css">
    </head>
    <body>
        <div class="overlay">
            
                <h1>Compra realizada con éxito</h1>
<div class="center">
    <div class="margen">  
        <h2>------------Ticket:------------</h2>
       
<%
int cont=0;
for(Venta v: listav){
Mangas m= conexionM.getMangaById(v.getIdMV());
    if(cont==0){
%>
        <p>Nombre de Servicio: <%=servicio%></p>
        <p>Fecha de Compra: <%=v.getFechaVenta()%></p>
        <p>Total a pagar: <%=v.getTotalVenta()%></p>
        <p>Numero de Venta: <%=v.getVentaID()%></p>
       --------------------------------------------------</br>
       --------------------------------------------------
        
        <p>Productos Comprados: <%=m.getNombre()%></p>
        
    <%
    }else{
    %>
        <p>Productos Comprados: <%=m.getNombre()%></p>
    <%
    }
    cont+=1;
}
    %>
    --------------------------------------------------</br>
    --------------------------------------------------
    <div class="mensaje">
    <h2>Gracias por su compra</h2>
    <h3>Vuelva Pronto</h3>
    </div>
</div>
</div>
    <a href="BorrarTodoCarro"><input type="button" class="boton" value="Regresar a comprar"/></a>
    </div>
</body>

</html>
<%
}
%>
