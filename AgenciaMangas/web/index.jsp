<%-- 
    Document   : index
    Created on : 19/05/2020, 09:24:13 PM
    Author     : bocal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page session="true" %>
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
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | MANGACOMP</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/estilos1.css">
    </head>
    <body>
        <header id="header">
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
        </header>
        <section class="color" id="bloque1">
            <div class="margen">
                <h1 class="mensaje">M A N G A C O M P</h1>
            </div>
        </section>
        <section class="centrado">
            <div class="color">
                    <article class="margen">
                        <h3>No esperes mas para comprar tus mangas preferidos!!</h3>
                        <br>
                        <p>Gracias por crear una cuenta en mangacomp, echale un vistazo a nuestros productos</p>
                        <a href="Productos.jsp">
                            <input class="boton" type='button' value="Productos">
                        </a><br><br>
                        <p>También puedes checar los datos de cuenta</p>
                        <a href="Sesion.jsp">
                            <input class="boton" type='button' value="Sesión">
                        </a>
                    </article>
                    <article class="margen">
                        <h3>Tu sitio de compra de mangas en linea</h3><br>
                        <p>Crea tu cuenta y accede para comprar tus mangas preferidos directamente en linea.<br><br>
                            Tenemos envios de paqueteria, y podrás comprar tus mangas en español latinoamericano.<br><br>
                            Proximamente, tendremos servicios de importación: mangas traidos directamente desde Japón<br>
                        </p>
                    </article>
            </div>
        </section>
        <br><br><br>
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
