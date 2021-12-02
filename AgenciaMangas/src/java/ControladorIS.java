/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Control.Usuario;
import Control.Validacion;
import Control.conexionU;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bocal
 */
public class ControladorIS extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int nivel=0;
            String noms, cons;
            noms=request.getParameter("nomSU");
            cons=request.getParameter("contU");
            
            boolean exp1=Validacion.direcciones(cons);
            boolean exp2=Validacion.direcciones(noms);
            
            if(exp1==false || exp2==false){
                response.sendRedirect("error.jsp");
            }
            else{
            try{
                conexionU u = new conexionU();
                Usuario us = u.verificarUsuario(noms, cons);
                nivel = us.getIdu();
                int priv= us.getPrivilegio();
                String nivelS = String.valueOf(nivel);
                String privS = String.valueOf(priv);
                if(us != null){
                    if(priv==1){
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", us);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("usuario", noms);
                        sesionOK.setAttribute("id", nivelS);
                        sesionOK.setAttribute("privilegio", privS);
                        response.sendRedirect("Productos.jsp");
                    }else if(priv==0 && nivel!=0){
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", us);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("usuario", noms);
                        sesionOK.setAttribute("privilegio", privS);
                        response.sendRedirect("SesionAdmin.jsp");
                    }else{
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Sesion</title>"
                                + "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilos.css\">");
                        out.println("</head>");
                        out.println("<body>"
                                + "<h1>No se encuentra la sesion, intentelo de nuevo</h1>"
                                + "<a href='IniciarSesion.jsp'>Regresar</a>");
                        out.println("</body>");
                        out.println("</html>");    
                    }
                }else{
                    out.println("\n" +
"<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%>\n" +
"<!DOCTYPE html>\n" +
"<html>\n" +
"    <head>\n" +
"        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
"        <title>JSP Page</title>\n" +
"        <link href=\"css/pago.css\" rel=\"stylesheet\">\n" +
"        <link href=\"css/botones.css\" rel=\"stylesheet\">\n" +
"    </head>\n" +
"    <body>\n" +
"        <div class=\"overlay\">\n" +
"        <div class=\"color3\">\n" +
"            <div class=\"margin\">\n" +
"                <h1>Error</h1>\n" +
"                <p>No se encuentra la sesion</p>\n" +
"                <a href=\"index.html\"><input class=\"boton\" type=\"button\" value=\"Regresar al home\"></a>\n" +
"            </div>\n" +
"        </div>\n" +
"        </div>    \n" +
"    </body>\n" +
"</html>\n" +
"");
                }
            }catch(Exception e){
                System.out.println("Que pedo que pedo");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
