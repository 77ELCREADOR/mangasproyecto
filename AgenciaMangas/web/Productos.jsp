<%-- 
    Document   : Productos
    Created on : 15/05/2020, 10:54:30 PM
    Author     : bocal
--%>
<%@page import="Control.Mangas" %>
<%@page import="Control.conexionM" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esp">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Productos | Mangacomp</title>
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
</head><!--/head-->
<body>
    <header id="header">
        <div class="header-middle"><!--header-middle-->
            <div class="container">
		<div class="row">
                    <div class="col-sm-4">
			<div class="logo pull-left">
                            <%
                                    HttpSession sessionOk = request.getSession();
                                    if(sessionOk.getAttribute("usuario")==null){ %>
                                <a href="index.html"><img src="images/home/logo.JPG" alt=""/></a>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="index.html"><i class="fa fa-star"></i> Home</a></li>
                                    <li><a href="Productos.jsp"><i class="fa fa-crosshairs"></i> Productos</a></li>
                                    <li><a href="CarritoCompras.jsp"><i class="fa fa-shopping-cart"></i> Carrito</a></li>
                                    <li><a href="IniciarSesion.jsp"><i class="fa fa-user"></i> IniciarSesión</a></li>
                                    <%}else{%>
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
                                    
                                <%}%>
                            </ul>
			</div>
                    </div>
		</div>
            </div>
	</div><!--/header-middle-->
    </header>
    <section id="advertisement">
        <div class="container">
            <img src="images/shop/logo.JPG" alt="" />
        </div>
    </section>
    <section>
	<div class="container">
            <div class="row">
        <%
        List<Mangas> listaM = conexionM.getAllMangas();
        %>
		<div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Mangas en Venta</h2>
        <%
            for(Mangas m : listaM){
        %>
        
        <div class="col-sm-4">
            <div class="product-image-wrapper">
                <div class="single-products">
                    <div class="productinfo text-center">
                        <img src="<%=m.getUrli()%>" alt="" width="477" height="550" />
                        <h2><%=m.getNombre()%></h2>
                        <p><%=String.format("%06d",m.getIdm())%></p>
                        <a href="ProductoUnico.jsp?idMP=<%=m.getIdm()%>" class="btn btn-default add-to-cart">Detalles del Producto</a>
                    </div>
                    <div class="product-overlay">
        		<div class="overlay-content">
			<h2><%=m.getNombre()%></h2>
                        <p><%=String.format("%06d",m.getIdm())%></p>
        		<a href="ProductoUnico.jsp?idMP=<%=m.getIdm()%>" class="btn btn-default add-to-cart">Detalles del Producto</a>
			</div>
                    </div>
		</div>
            </div>
        </div>
        <%}%>
                </div><!--features_items-->
            </div>
        </div>
    </section>	
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
