/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Control.Validacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bocal
 */
public class ConfirmarTarjeta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String tipTar=request.getParameter("tipTar");
            
            if(!"Tarjeta".equals(tipTar) && !"PayPal".equals(tipTar) && !"Efectivo".equals(tipTar)){
                response.sendRedirect("error.jsp");
            }else{
            if("PayPal".equals(tipTar)){
                HttpSession sesionOk=request.getSession(true);
                boolean validacion=true;
                sesionOk.setAttribute("confirmado",validacion);
                response.sendRedirect("ConcretarCompra?idS=1");
            }
            else if("Efectivo".equals(tipTar)){
                HttpSession sesionOk=request.getSession(true);
                boolean validacion=true;
                sesionOk.setAttribute("confirmado",validacion);
                response.sendRedirect("ConcretarCompra?idS=2");
            }else{
                String numTar=request.getParameter("numTar");
                String mesTar=request.getParameter("mesTar");
                String anoTar=request.getParameter("anoTar");
                String codTar=request.getParameter("codTar");
                String nomTar=request.getParameter("nomTar");
                String appatTar=request.getParameter("appatTar");
                String apmatTar=request.getParameter("apmatTar");

                boolean exp1=Validacion.nombreApellidosTar(nomTar);
                boolean exp2=Validacion.nombreApellidosTar(appatTar);
                boolean exp3=Validacion.nombreApellidosTar(apmatTar);
                boolean exp4=Validacion.codigoTar(codTar);
                boolean exp5=Validacion.anoTarjeta(anoTar);
                boolean exp6=Validacion.mesTarjeta(mesTar);
                boolean exp7=Validacion.numeroTar(numTar);

                if(tipTar==null || numTar==null || mesTar==null || anoTar==null || codTar==null || nomTar==null 
                        || appatTar==null || apmatTar==null){
                    response.sendRedirect("error.jsp");
                }else{
                    if (exp1==false || exp2==false || exp3==false || exp4==false || exp5==false || exp6==false || exp7==false){
                        response.sendRedirect("error.jsp");    
                    }else{
                        Calendar fecha = Calendar.getInstance();
                        int ano = fecha.get(Calendar.YEAR);
                        int mes = fecha.get(Calendar.MONTH) + 1;
                        int mesI = Integer.parseInt(mesTar);
                        int anoI = Integer.parseInt(anoTar);
                        
                        if(mesI==mes && anoI==ano){
                            response.sendRedirect("error.jsp");
                        }else if(mesI<mes && anoI==ano){
                            response.sendRedirect("error.jsp");
                        }else if(anoI<ano){
                            response.sendRedirect("error.jsp");
                        }else{
                            HttpSession sesionOk=request.getSession(true);
                            boolean validacion=true;
                            System.out.println("lo manda a concretar");
                            sesionOk.setAttribute("confirmado",validacion);
                            response.sendRedirect("ConcretarCompra?idS=3");
                        }
                    }
                }
            }
            }
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
