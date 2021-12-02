/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Control.conexionM;
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
public class BorrarM extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String eseidM;
            eseidM = request.getParameter("idM");
            int idM = Integer.parseInt(eseidM);
            int estatus=conexionM.Eliminar(idM);
            if (estatus>0){
                System.out.println("Se borro");
            }else{
                System.out.println("No se borro");
            }
            response.sendRedirect("SesionAdmin.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(BorrarM.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
