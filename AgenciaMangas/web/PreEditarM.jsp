<%-- 
    Document   : PreEditarM
    Created on : 15/05/2020, 11:04:56 PM
    Author     : bocal
--%>
<%@page import="Control.Mangas" %>
<%@page import="Control.conexionM" %>
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
<html lan="esp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Manga</title>
        <script type="text/javascript" src="js/validar3.js"></script>
    </head>
    <body>
        <%
        String idMS=request.getParameter("idM");
        System.out.println(idMS);
        int idM=Integer.parseInt(idMS);
        Mangas m=conexionM.getMangaById(idM);
        %>
       <div class="centro">
        <h3>Modificar datos de la cuenta</h3>
        <div class="cuadro">
            <div class="margen">
            <form action='EditarM' method='POST' name='formulario1'>
                <input type='hidden' name='idM' value='<%=idMS%>'/>
            <ul>
                <li>Nombre: <input type='text' name='nomM' value='<%=m.getNombre()%>'/></li>
                <li>Descripcion: <input type='text' name='desM' value='<%=m.getDescripcion()%>'/></li>
                <li>Editorial:
            <%switch (m.getIdEd()){
                case 1:%>
                <select class="input" name='ediM'>
                    <option>Panini</option>
                    <option>Kamite</option>
                </select></li>
                <%break;
                case 2:%>
                <select class="input" name='ediM'>
                    <option>Kamite</option>
                    <option>Panini</option>
                </select></li>
                <%break;
                default:
                    System.out.println("que pedo que pedo");
                    break;}%>
            <%switch (m.getIdGen()){
                case 1:%>
                <li>Genero:<select class="input" name='genM'/>
                    <option>Accion</option>
                    <option>Drama</option>
                    <option>Psico</option>
                    <option>Romance</option>
                    <option>Slice of life</option>
                    <option>Gore</option>
                </select></li>
                <%
                    break;
                case 2:%>
                <li>Genero:<select class="input" name='genM'/>
                    <option>Drama</option>    
                    <option>Accion</option>
                    <option>Psico</option>
                    <option>Romance</option>
                    <option>Slice of life</option>
                    <option>Gore</option>
                </select></li>
                <%break;
                case 3:%>
                <li>Genero:<select class="input" name='genM'/>
                    <option>Psico</option>
                    <option>Accion</option>
                    <option>Drama</option>    
                    <option>Romance</option>
                    <option>Slice of life</option>
                    <option>Gore</option>
                </select></li>
                <%break;
                case 4:%>
                <li>Genero:<select class="input" name='genM'/>
                    <option>Romance</option>
                    <option>Accion</option>
                    <option>Drama</option>
                    <option>Psico</option>
                    <option>Slice of life</option>
                    <option>Gore</option>
                </select></li>
                <%break;
                case 5:%>
                <li>Genero:<select class="input" name='genM'/>
                    <option>Slice of life</option>
                    <option>Accion</option>
                    <option>Drama</option>
                    <option>Psico</option>
                    <option>Romance</option>
                    
                    <option>Gore</option>
                </select></li>
                <%break;
                case 6:%>
                <li>Genero:<select class="input" name='genM'/>
                    <option>Gore</option>
                    <option>Accion</option>
                    <option>Drama</option>
                    <option>Psico</option>
                    <option>Romance</option>
                    <option>Slice of life</option>
                </select></li>
                <%break;
                default:
                    System.out.println("que pedo que pedo");
                    break;}%>
            <%switch (m.getIdEst()){
                case 1:%>
                <li>Estado: <select class="input" name='estM'>
                    <option>Finalizado</option>
                    <option>Publicandose</option>
                </select></li>
                <%break;
                case 2:%>
                <li>Estado: <select class="input" name='estM'>
                    <option>Finalizado</option>
                    <option>Publicandose</option>
                </select></li>
                <%break;
                default:
                    System.out.println("que pedo que pedo");
                    break;}%>
            <%switch (m.getIdDem()){
                case 1:%>
                <li>Demografia: <select class="input" name='demM'/>
                    <option>Shounen</option>
                    <option>Shoujo</option>
                    <option>Seinen</option>
                    <option>Josei</option>
                    <option>Kodomo</option>
                    </select></li>
                <%break;
                case 2:%>
                    <li>Demografia: <select class="input" name='demM'/>
                    <option>Shoujo</option>    
                    <option>Shounen</option>
                    <option>Seinen</option>
                    <option>Josei</option>
                    <option>Kodomo</option>
                    </select></li>
                <%break;
                case 3:%>
                    <li>Demografia: <select class="input" name='demM'/>
                    <option>Seinen</option>        
                    <option>Shounen</option>
                    <option>Shoujo</option>
                    <option>Josei</option>
                    <option>Kodomo</option>
                    </select></li>
                <%break;
                case 4:%>
                <li>Demografia: <select class="input" name='demM'/>
                    <option>Josei</option>
                    <option>Shounen</option>
                    <option>Shoujo</option>
                    <option>Seinen</option>
                    <option>Kodomo</option>
                    </select></li>
                <%break;
                case 5:%>
                <li>Demografia: <select class="input" name='demM'/>
                    <option>Kodomo</option>
                    <option>Shounen</option>
                    <option>Shoujo</option>
                    <option>Seinen</option>
                    <option>Josei</option>
                    </select></li>
                <%break;
                default:
                    System.out.println("que pedo que pedo");
                    break;}%>
                <li>Stock: <input type='text' name='stoM' value='<%=m.getStock()%>'/></li>
                <li>Costo: <input type='text' name='cosM' value='<%=m.getCosto()%>'/></li>
                <li>Url de imagen: <input type='text' name='urlM' value='<%=m.getUrli()%>'/></li>
            </ul>
            <input class="boton2" type='submit' value='Aceptar' onclick='return validacionRM()'/>
            </form>
            </div>
        </div>
            
            <a href="SesionAdmin.jsp"><input class="boton2" type="submit" value="Regresar"></a>
        <div>    
    </body>
    </div>
    </body>
    <style>

.cuadro{
    margin-top: 20px;
    width: 30rem;
    margin-left: auto;
    margin-right: auto;
    color:white;
    padding:20px;
    border: 3px solid black;
    background: black;
    font-size: 1.5rem;
}

.cuadro:hover{
    background: white;
}

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
    font-size: 1.1rem;
    padding-top: 0.5em;
}
.boton2:hover{
    color:white;
    background: black;
    border: 1px solid white;
}
li {
    list-style:none;
}
    </style>    </body>
</html>
