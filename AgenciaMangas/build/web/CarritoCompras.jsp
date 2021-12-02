<%-- 
    Document   : CarritoCompras
    Created on : 16/05/2020, 05:16:01 PM
    Author     : bocal
--%>

<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Control.*" %>
<%@page session="true" %>
<%
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
%>
<!DOCTYPE html>
<html lang="esp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>CarritoCompras | Mangacomp</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
            <link href="css/main.css" rel="stylesheet">
            <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body>
        <header id="header"><!--header-->
            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="images/home/logo.JPG" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="index.jsp"><i class="fa fa-star"></i> Home</a></li>
                                    <li><a href="Productos.jsp"><i class="fa fa-crosshairs"></i> Productos</a></li>
                                    <li><a href="CarritoCompras.jsp"><i class="fa fa-shopping-cart"></i> Carrito</a></li>
                                    <li><a href="Sesion.jsp"><i class="fa fa-user"></i> Sesión</a></li>
                                    <li><a href="CerrarSesion"><i class="fa fa-lock"></i>Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->
            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
			</div>
                    </div>
                </div>
            </div><!--/header-bottom-->
	</header><!--/header-->
        <%
        boolean confirmacion=false;
        %>
        <section id="cart_items">
            <div class="container">
                <h1 style="font-family: Comic Sans MS">Carrito de Compras</h1>
		<div class="table-responsive cart_info">
                    <%
                    if(vectorDetalles!=null || vectorStock!=null){
                    %>
                    <table class="table table-condensed">
                        <thead class="cart_info">
                            <tr class="cart_menu" style="background-color: black; font-family: Impact;">
				<td class="description">Nombre</td>
				<td class="quantity">Cantidad</td>
				<td class="total">SubTotal</td>
				<td></td>
                            </tr>
			</thead>
                        <tbody>
                        <%
                            int i=0;
                            for(Detalleventa det:vectorDetalles){
                                Mangas m=new conexionM().getMangaById(det.getIdM());
                                if(m.getNombre()==null){
                                    confirmacion = false;
                                }else{
                                    confirmacion = true;
                                }
                            %>
                            <tr>
				<td class="cart_description">
                                    <h4><%=m.getNombre() %></h4>
                                    <p>Codigo: <%=det.getIdM()%></p>
				</td>
				<td class="cart_price">
                                    <p class="cart_total_price"><%=det.getDetVenta_cantidad()%></p>
				</td>
				<td class="cart_price">
                                    <p class="cart_total_price"><%=det.getDetVenta_subtotal() %></p>
				</td>
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete" href="BorrarC?i=<%=i%>"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>
                            <%i+=1;
                            }%>
                        </tbody>
                    </table>
                    <%if(confirmacion==true){%>
                    <a href="pago.jsp" class="btn btn-default cart" style="font-family: Comic Sans MS">Concretar compra</a><br>
                    <%
                    }else{%>
                    <p>No has ingresado nada al carro</p>
                    <%
                    }}else{%>
                    <p>No has ingresado nada al carro</p>
                    <%}%>
                <a href="Productos.jsp" class="btn btn-default cart" style="font-family: Comic Sans MS">Volver a comprar</a>    
		</div>
            </div>
            
	</section> <!--/#cart_items-->
        <footer id="footer"><!--Footer-->
        <div class="footer-widget">
		<div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>MANGACOMP</h2>
                                <p style="color: #B2B2B2">Derechos resevados de Mangacomp, no nos hacemos responsables de la edición de los mismos</p>
                            </div>
                        </div>
			<div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Servicios</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="" style="color: black;">Ayuda Online</a></li>
                                    <li><a href="" style="color: black;">Contactanos</a></li>
                                    <li><a href="" style="color: black;">Estatus de Orden</a></li>
                                    <li><a href="" style="color: black;">Paqueteria</a></li>
                                    <li><a href="" style="color: black;">Banco</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
				<h2>Redes</h2>
				<ul class="nav nav-pills nav-stacked">
                                    <li><a href="" style="color: black;">Twitter</a></li>
                                    <li><a href="" style="color: black;">Facebook</a></li>
                                    <li><a href="" style="color: black;">Instagram</a></li>
                                    <li><a href="" style="color: black;">Hotmail</a></li>
                                    <li><a href="" style="color: black;">Google</a></li>
				</ul>
                            </div>
			</div>
			<div class="col-sm-2">
                            <div class="single-widget">
				<h2>Politicas</h2>
				<ul class="nav nav-pills nav-stacked">
                                    <li><a href="" style="color: black;">Terminos de Uso</a></li>
                                    <li><a href="" style="color: black;">Politica de Privacidad</a></li>
                                    <li><a href="" style="color: black;">Poliza</a></li>
                                    <li><a href="" style="color: black;">Sistema de Cobranza</a></li>
                                    <li><a href="" style="color: black;">Sistema de Entrada</a></li>
				</ul>
                            </div>
			</div>
                    </div>
                </div>
            </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">Mangacomp © 2020. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>
    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    </body>
</html>
