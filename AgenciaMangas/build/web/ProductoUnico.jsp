<%-- 
    Document   : ProductoUnico
    Created on : 15/05/2020, 11:28:54 PM
    Author     : bocal
--%>
<%@page import="Control.Mangas" %>
<%@page import="Control.conexionM" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="esp">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>DetallesProducto | Mangacomp</title>
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
        <script type="text/javascript" src="js/validar2.js"></script>
    </head><!--/head-->

    <body>
        <%
            String idMS=request.getParameter("idMP");
            System.out.println(idMS);
            int idM=Integer.parseInt(idMS);
            int stock=1;
            Mangas m=conexionM.getMangaById(idM);
        %>
        <header id="header"><!--header-->
            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <%
                                    HttpSession sessionOk = request.getSession();
                                    System.out.println((String)sessionOk.getAttribute("usuario"));
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
        <section>
            <div class="container">
                <div class="container">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-5">
                            <div class="view-product">
                                <img src="<%=m.getUrli()%>" height="100%" width="100%" alt="Sin Imagen disponible"/>
                            </div>
                            <div id="similar-product" class="carousel slide" data-ride="carousel"></div>
                        </div>
                        <div class="col-sm-7">
                            <div class="product-information"><!--/product-information-->
                                <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                <h2><%=m.getNombre()%></h2>
                                <p>Web ID: <%=m.getIdm()%></p>
                                <span>
                                    <span>Mx $<%=m.getCosto()%> | <%=m.getStock()%> en Stock</span>
                                    <label><%=m.getDescripcion()%></label><br>
                                    <form action="AgregarCarro" method="POST" name="formularioC">
                                        <input type="hidden" value="<%=m.getNombre()%>" name="nomP"/>
                                        <input type="hidden" value="<%=m.getCosto()%>" name="cost"/>
                                        <input type="hidden" value="<%=idMS%>" name="idMS"/>
                                        <input type="hidden" value="<%=m.getStock()%>" name="stock"/>
                                        <%
                                        if(m.getStock()<=0){%>
                                        <br><label>Producto agotado</label>
                                        <%
                                        }else{%>
                                            <input type="text" value="1" name="cant"/>
                                            <button class="btn btn-default cart" onclick="return cantidad()">
                                                <i class="fa fa-shopping-cart"></i>
                                                Agregar al carrito
                                            </button>
                                        <%}%>
                                        
                                    </form>
                                </span> 
                                <ul>
                                    <li>Editorial: <label> <%=m.getEditorial()%></label></li>
                                    <li>Genero: <label> <%=m.getGenero()%></label></li>
                                    <li>Estado: <label> <%=m.getEstado()%></label></li>
                                    <li>Demografia: <label> <%=m.getDemografia()%></label></li>
                                </ul>
                                <br>
                                
                                <a href="Productos.jsp" class="btn btn-default cart">Regresar a Productos</a>
                            </div><!--/product-information-->
                        </div>
                    </div><!--/product-details-->
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
