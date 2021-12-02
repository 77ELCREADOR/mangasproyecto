<%-- 
    Document   : Sesion
    Created on : 15/05/2020, 10:27:11 PM
    Author     : bocal
--%>
<%@page import="java.util.Vector"%>
<%@page import="Control.Mangas"%>
<%@page import="Control.conexionM"%>
<%@page import="java.util.List"%>
<%@page import="Control.Usuario" %>
<%@page import="Control.conexionU" %>
<%@page import="Control.Venta" %>
<%@page import="Control.Historial" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
            String idUS = "";
            String usuario="";
            HttpSession sessionOk = request.getSession();
            if(sessionOk.getAttribute("usuario")==null){
        %>
        <jsp:forward page="index.jsp">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>}
        <%   
            }else{
                usuario = (String)sessionOk.getAttribute("usuario");
                idUS = (String)session.getAttribute("id");
                int idU=Integer.parseInt(idUS);
                conexionU cn= new conexionU();
                Usuario u = new Usuario();
                u=cn.getUsuarioById(idU);
        %>
<!DOCTYPE html>
<html lang="esp">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Mi sesión | Mangacomp</title>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
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
        
        <script type="text/javascript" src="js/validar2.js"></script>
        
            <section>
               <div class="Misdatos"> 
               <div class="margen"> 
              
                <h3>Datos personales</h3>
                <div class="subdatos">

                    <ul>
                        <li>Nombre completo:<%=u.getNombre()+" "+u.getAppat()+" "+u.getApmat()%> <br></li>
                        <li>Curp: <%=u.getCurp()%></li>
                        <li>Direccion: Calle <%=u.getCalle()%> No. <%=u.getEx()%> Int <%=u.getIn()%> Colonia <%=u.getColonia()%><br></li>
                        <li>Fecha de nacimiento: <%=u.getFNacD()%><br></li>
                        <li>Codigo Postal: <%=u.getCp()%><br></li>
                        <li>Teléfono: <%=u.getTelefono()%><br></li>
                        </ul>
                </div>
    
                        <a href='CerrarSesion'><input type="button" class="boton" value="Cerrar Sesión"></a>
                
                </article>
               </div>
               </div> 
                
                        
                <article>
                    
                <div class="color1">
                    <div class="margen centro">
                     
                        <h3 class="centro">Modificar datos de la cuenta</h3>
                        
                    <form action='EditarU' method='POST' name='formulario1'>
                      
                    <input type='hidden' name='idU' value='<%=u.getIdu()%>'/>
                    <input type='hidden' name='idD' value='<%=u.getIdD()%>'/>
                    <div class="subdatos">  
                    <ul>
                        <li>Nombre: <input type='text' name='nomU' value='<%=u.getNombre()%>'/></li>
                        <li>Apellido paterno: <input type='text' name='appatU' value='<%=u.getAppat()%>'/></li>
                        <li>Apellido materno: <input type='text' name='apmatU' value='<%=u.getApmat()%>'/></li>
                        <li>Curp: <input type='text' name='curpU' value='<%=u.getCurp()%>'/></li>
                        <li>Dia de nacimiento: <input type='text' name='fNacU' value='<%=u.getFNacD()%>'/></li>
                        <li>Calle: <input type='text' name='calleDU' value='<%=u.getCalle()%>'/></li>
                        <li>Colonia: <input type='text' name='coloniaU' value='<%=u.getColonia()%>'/></li>
                        <li>No. Ext: <input type='text' name='exU' value='<%=u.getEx()%>'/></li>
                        <li>No. Int: <input type='text' name='inU' value='<%=u.getIn()%>'/></li>
                        <li>Codigo Postal: <input type='text' name='cpU' value='<%=u.getCp()%>'/></li>
                        <li>Telefono: <input type='text' name='telU' value='<%=u.getTelefono()%>'/></li>
                    </ul>
                    </div>
                    <input type='submit' class="boton centro" value='Aceptar' onclick='return validacionES()'/>
                    
                    </form>
                    </div>
                </div>
                    
                    <div class="color1">
                        <div class="margen centro">
                    <h3>Borrar Cuenta</h3>
                    <form action='BorrarU' method='POST' name='formB'>
                    <input type='hidden' name='idU' value='<%=u.getIdu()%>'/>
                    <input type='hidden' name='idD' value='<%=u.getIdD()%>'/>
                    <input type='hidden' name='idC' value='<%=idU%>'/>
                    <input type='submit' class="boton" value='Aceptar' onclick='return con()'/>
                    </form>
                        </div>
                    </div>
                    
                </article>
                
                    
                    
                    
                    
                  
                <article id="cart_items">
                    
                <div class="container">
                    <div class="table-responsive cart_info">
                    <h3 class="centro">HISTORIAL</h3>
                    
                    <table class="table table-condensed" border="1">
                        <thead class="cart_info">
                        <tr class="cart_menu" style="background-color: black; font-family: Impact;">
                            <th>Num de Venta</th>
                            <th>Nombre del Producto</th>
                            <th>Fecha de Venta</th>
                            <th>Cantidad</th>
                            <th>Costo Total</th>
                            <th>Servicio</th>
                        </tr>
                        </thead>
                    <%
                    List<Venta> listaV = Historial.getHistorialByUsuario(idU);
                    
                    for(Venta v:listaV){
                        Mangas m = conexionM.getMangaById(v.getIdMV());
                    %>
                        <tr>
                            <td><%=v.getVentaID()%></td>
                            <td><%=m.getNombre()%></td>
                            <td><%=v.getFechaVenta()%></td>
                            <td><%=v.getCantidad()%></td>
                            <td><%=v.getTotalVenta()%></td>
                            <td><%=v.getServicio()%></td>
                        </tr>
                  <%}%>
                    </table>
                </div>
                </div>
                </article>
            </section>
            <%}%>
    </body>
    
    <style>
        thead{
            color:white;
            text-align: center;
        }
        .contener{
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
        .centro{
            text-align: center;
        }
        
        table{
	background-color: white;
	border-collapse: collapse;
	width: 60%;
        text-align: center;
        }

th, td{
	padding: 10px;
        font-size: 1.2em;
}

tr:nth-child(even){
	background-color: #ddd;
}

tr:hover td{
	background-color: black;
	color: white;
}

a{
    text-decoration: none;
    color:inherit;
    font-size: 2rem;
}

li{
    font-size: 2rem;
    margin-top: 1rem;
}

.Misdatos{
    width: 1000px;
    background-color: black;
    color: white;
    text-align: center;
    padding: 20px;
    margin-right:auto;
    margin-left:auto;   
}
.Misdatos:hover{
      background: white;
      border: 3px solid black;
}

.subdatos{
    text-align: left;
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

.color1{
    margin-top: 20px;
    max-width: 870px;
    width: 55rem;
    margin-left: auto;
    margin-right: auto;
    color:white;
    padding:20px;
    border: 3px solid black;
}
.color1{
    background: black;
}

.color1:hover{
    background: white;
}

</style></html>
