<%-- 
    Document   : SesionAdmin
    Created on : 15/05/2020, 09:55:29 PM
    Author     : bocal
--%>
<%@page import="Control.Venta"%>
<%@page import="Control.Historial"%>
<%@page import="java.util.List"%>
<%@page import="Control.conexionM" %>
<%@page import="Control.conexionU" %>
<%@page import="Control.Usuario" %>
<%@page import="Control.Mangas" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
String priv=(String)sesionOk.getAttribute("privilegio");
System.out.println("aqui va un nuevo sout   "+priv);
if (sesionOk.getAttribute("usuario") == null ) {
%>
<jsp:forward page="IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else if("1".equals(priv)){
    response.sendRedirect("Sesion.jsp");
} else {
    usuario = (String)sesionOk.getAttribute("usuario");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesion Admin</title>
        <script type="text/javascript" src="js/validar3.js"></script>
        <link href="css/pago.css" rel="stylesheet">
        <link href="css/Table.css" rel="stylesheet">
    </head>
    <body>
        <div class="centro">
        <div class="cuadro">
            <div class="margen">
            <h3>Ingresar nuevo manga</h3>
            <form action='GuardarM' method='POST' name='formulario1'>
                <label>Nombre del manga: </label><input type='text' name='nomM'/><br>
                <label>Descripción: </label><input type='textarea' name='desM'/><br>
                <label>Editorial: </label><select class="input" name='ediM'>
                    <option>Panini</option>
                    <option>Kamite</option>
                    </select><br>
                <label>Genero: </label><select class="input" name='genM'/>
                    <option>Accion</option>
                    <option>Drama</option>
                    <option>Psico</option>
                    <option>Romance</option>
                    <option>Slice of life</option>
                    <option>Gore</option>
                    </select><br>
                <label>Estado: </label><select class="input" name='estM'>
                    <option>Finalizado</option>
                    <option>Publicandose</option>
                    </select><br>
                <label>Demografía: </label><select class="input" name='demM'>
                    <option>Shounen</option>
                    <option>Shoujo</option>
                    <option>Seinen</option>
                    <option>Josei</option>
                    <option>Kodomo</option>
                    </select><br>
                <label>Stock: </label><input type='text' name='stoM'/><br>
                <label>Costo: </label><input type='text' name='cosM'/><br>
                <label>URL de Imagen: </label><input type='text' name='urlM'/><br>
                <input type='submit' class="boton2" value='Aceptar' onclick='return validacionRM()'/>
            </form>
            <a href="GraficasJ.html"><input class="boton2" type="submit" value="Visualizar Grafica"></a><br>
            <a href='CerrarSesion'><input class="boton2" type="submit" value="Regresar"></a>
            </div>
        </div>
            <article id="cart_items">
                
   <div class="container">
   <div class="table-responsive cart_info">
                 
        <h1>Usuarios</h1>
         <div class="table-responsive cart_info">
            <table align="center" class="table table-condensed" border = 1>
                
            <thead class="cart_info">
            <tr class="cart_menu" style="background-color: black; font-family: Impact;">
                
                <th>ID</th>
                <th>Nombre completo</th>
                <th>Dirección</th>
                <th>Codigo postal</th>
                <th>Curp</th>
                <th>Fecha de nacimiento</th>
                <th>Telefono</th>
                <th>Nombre de cuenta</th>
                <th>Contraseña</th>
                <th>Borrar</th>
            </tr>
            </thead>
            <%
            List<Usuario> listaU = conexionU.getAllUsuarios();
            List<Mangas> listaM = conexionM.getAllMangas();
            for(Usuario u:listaU){
            %>
            <tr>
                <td><%=u.getIdu()%></td>
                <td><%=u.getNombre()%> <%=u.getAppat()%> <%=u.getApmat()%></td>
                <td>Calle: <%=u.getCalle()%> No. <%=u.getEx()%> Int. <%=u.getIn()%> <%=u.getColonia()%> </td>
                <td><%=u.getCp()%></td>
                <td><%=u.getCurp()%></td>
                <td><%=u.getFNacD()%></td>
                <td><%=u.getTelefono()%></td>
                <td><%=u.getNombreS()%></td>
                <td><%=u.getContrasenaS()%></td>
                <td>
                    <form action='BorrarA' method='GET'>
                    <input type='hidden' name='idU' value='<%=u.getIdu()%>'/>
                    <input type='hidden' name='idD' value='<%=u.getIdD()%>'/>
                    <input type='hidden' name='idC' value='<%=u.getIdC()%>'/>
                    <input type="submit" value="Borrar"/>
                    </form>
                </td>
            </tr>
            <%}%>
            
            </table>
         </div>
            
        <br><br>
        
        <h1>Productos</h1>
        <div class="table-responsive cart_info"> 
        <table align="center" align="center" class="table table-condensed">
         <thead class="cart_info">
             <tr class="cart_menu" style="background-color: black; font-family: Impact;">
                <td>ID</td>
                <td>Nombre</td>
                <td>Descripcion</td>
                <td>Editorial</td>
                <td>Genero</td>
                <td>Estado</td>
                <td>Demografia</td>
                <td>Stock</td>
                <td>Costo</td>
                <td>Editar</td>
                <td>Borrar</td>
            </tr>    
        </thead>
            <%
            for (Mangas m:listaM){
            %>
            <tr>
            <td><%=m.getIdm()%></td>
            <td><%=m.getNombre()%></td>
            <td><%=m.getDescripcion()%></td>
            <td><%=m.getEditorial()%></td>
            <td><%=m.getGenero()%></td>
            <td><%=m.getEstado()%></td>
            <td><%=m.getDemografia()%></td>
            <td><%=m.getStock()%></td>
            <td><%=m.getCosto()%></td>
            <td>
                <form action='PreEditarM.jsp' method='get'>
                <input type='hidden' name='idM' value='<%=m.getIdm()%>'/>
                <input type='submit' value='Editar'/>
                </form>
            </td>
            <td><form action='BorrarM' method='get'>
                <input type='hidden' name='idM' value='<%=m.getIdm()%>'/>
                <input type='submit' value='Borrar'/>
                </form>
            </td>
            </tr>
            <%}%>
        </table>
        </div>
        
        <br><br>
        
        <h1>Ventas</h1>
        <div class="table-responsive cart_info">    
            <table align="center" class="table table-condensed">
                <thead class="cart_info">
                <tr class="cart_menu" style="background-color: black; font-family: Impact;">
                    <th>Num. Venta</th>
                    <th>Id del Usuario</th>
                    <th>Nombre de Usuario</th>
                    <th>Id del producto</th>
                    <th>Nombre del Producto</th>
                    <th>Id de la Venta</th>
                    <th>Fecha de la Venta</th>
                    <th>Cantidad comprada</th>
                    <th>Saldo Total</th>
                    <th>Servicio ocupado</th>
                </tr>
                </thead>
            <%
            List<Venta> listaV=Historial.getAllHistorial();
            
            for(Venta v: listaV){
            Usuario u=conexionU.getUsuarioById(v.getIdu());
            Mangas m = conexionM.getMangaById(v.getIdMV());
            %>
                <tr>
                    <td><%=v.getIdH()%></td>
                    <td><%=v.getIdu()%></td>
                    <td><%=u.getNombreS()%></td>
                    <td><%=v.getIdMV()%></td>
                    <td><%=m.getNombre()%></td>
                    <td><%=v.getVentaID()%></td>
                    <td><%=v.getFechaVenta()%></td>
                    <td><%=v.getCantidad()%></td>
                    <td><%=v.getTotalVenta()%></td>
                    <td><%=v.getServicio()%></td>
                </tr>
            <%}%>
            </table>
        </div>
</div>
</div>
            </article>
        </div>     </body>
</html>
