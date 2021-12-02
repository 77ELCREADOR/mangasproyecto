/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Control.conexionM;
import Control.Mangas;
import Control.Validacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bocal
 */
public class EditarM extends HttpServlet {
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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        String idMS, nombre, descripcion, editorial, genero, estado, demografia, stockS, costoS, urlI;
        int idEdi = 0, idGen=0, idEst=0, idDem=0;
            nombre =request.getParameter("nomM");
            descripcion =request.getParameter("desM");
            editorial = request.getParameter("ediM");
            genero =request.getParameter("genM");
            estado = request.getParameter("estM");
            demografia = request.getParameter("demM");
            stockS=request.getParameter("stoM");
            int stock = Integer.parseInt(stockS);
            costoS =request.getParameter("cosM");
            float costo = Float.parseFloat(costoS);
            urlI=request.getParameter("urlM");
            
            idMS=request.getParameter("idM");
            int idM = Integer.parseInt(idMS);
            
            boolean exp1=Validacion.direcciones(nombre);
            boolean exp2=Validacion.direcciones(descripcion);
            boolean exp3=Validacion.numerosEnteros(stockS);
            boolean exp4=Validacion.numerosDecimales(costoS);
            
            System.out.println(exp1+""+exp2+""+exp3+""+exp4+"");
            if (exp1==false || exp2==false || exp3==false || exp4==false){
                
                response.sendRedirect("error.jsp");
            }else{
                switch(editorial){
                    case "Panini":
                        idEdi=1;
                        break;
                    case "Kamite":
                        idEdi=2;
                        break;
                    default:
                        out.println("No cambies las opciones");
                        break;
                }
                switch(genero){
                    case "Accion":
                        idGen=1;
                        break;
                    case "Drama":
                        idGen=2;
                        break;
                    case "Psico":
                        idGen=3;
                        break;
                    case "Romance":
                        idGen=4;
                        break;
                    case "Slice of life":
                        idGen=5;
                        break;
                    case "Gore":
                        idGen=6;
                        break;
                    default:
                        out.println("No cambies las opciones");
                        break;
                }
                switch(estado){
                    case "Finalizado":
                        idEst=1;
                        break;
                    case "Publicandose":
                        idEst=2;
                        break;
                    default:
                        out.println("No cambies las opciones");
                        break;        
                }
                switch(demografia){
                    case "Shounen":
                        idDem=1;
                        break;
                    case "Shoujo":
                        idDem=2;
                        break;
                    case "Seinen":
                        idDem=3;
                        break;
                    case "Josei":
                        idDem=4;
                        break;
                    case "Kodomo":
                        idDem=5;
                        break;
                    default:
                        out.println("No cambies las opciones");
                        break;
                }
                Mangas m = new Mangas();
                m.setIdm(idM);
                m.setNombre(nombre);
                m.setDescripcion(descripcion);
                m.setIdEd(idEdi);
                m.setIdGen(idGen);
                m.setIdEst(idEst);
                m.setIdDem(idDem);
                m.setGenero(genero);
                m.setEstado(estado);
                m.setDemografia(demografia);
                m.setStock(stock);
                m.setCosto(costo);
                m.setUrli(urlI);

                int estadom = conexionM.Actualizar(m);

                if(estadom >0){
                    response.sendRedirect("SesionAdmin.jsp");
                    System.out.println("Respondio");
                }else{
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet EditarU</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>No se pudo realizar la operacion</h1>");
                    out.println("<a href='SesionAdmin.jsp'>Regresar</a>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditarM.class.getName()).log(Level.SEVERE, null, ex);
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
