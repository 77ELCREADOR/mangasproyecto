/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Control.conexionU;
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
public class BorrarU extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String eseidU, idDS, cond, idCS;
            eseidU = request.getParameter("idU");
            idDS=request.getParameter("idD");
            idCS=request.getParameter("idC");
            cond=request.getParameter("ad");
            int idU = Integer.parseInt(eseidU);
            int idD = Integer.parseInt(idDS);
            int idC = Integer.parseInt(idCS);
            
            int estatus=conexionU.Eliminar(idU,idD,idC);
            if(estatus>=3){
                response.sendRedirect("index.html");
            }else{
                response.sendRedirect("error.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BorrarU.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
