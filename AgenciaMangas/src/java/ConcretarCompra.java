/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Control.*;
import java.util.Date;
import java.util.Vector;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bocal
 */
public class ConcretarCompra extends HttpServlet {

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
            
            HttpSession sesionOk=request.getSession(true);
            boolean validacion=(boolean)sesionOk.getAttribute("confirmado");            
            if(validacion==true){
                Date dia=new Date();
                java.sql.Date sqlDate = convert(dia);
                Vector<Detalleventa> vectorDetalles=(Vector<Detalleventa>)sesionOk.getAttribute("detalleVenta");
                Vector<Mangas> stockProducto=(Vector<Mangas>)sesionOk.getAttribute("stockProducto");
                for(Mangas ms: stockProducto){
                    ms.getStock();
                }
                Mangas m=new Mangas();
                conexionM cM = new conexionM();
                int totalPagar=0;
                int cantidad=0;
                for(Detalleventa dv : vectorDetalles){
                    totalPagar+=dv.getDetVenta_subtotal();
                    cantidad +=dv.getDetVenta_cantidad();
                }
                String idSS = request.getParameter("idS");
                String idUS = (String)sesionOk.getAttribute("id");
                int idU = Integer.parseInt(idUS);
                int idS = Integer.parseInt(idSS);
                Usuario usuario=conexionU.getUsuarioById(idU);
                Venta venta=new Venta();
                venta.setIdu(usuario.getIdu());
                venta.setIdSer(idS);
                venta.setCantidad(cantidad);
                venta.setFechaVenta(sqlDate);
                venta.setTotalVenta(totalPagar);
                boolean registrarVenta=venta.RegistrarVenta(venta, vectorDetalles);
                boolean actualizarVenta=cM.actualizarStock(stockProducto);
                if(registrarVenta == actualizarVenta){
                    response.sendRedirect("Mensaje.jsp?idS="+idS+"");
                }else{
                    response.sendRedirect("error.jsp");
                    System.out.println("Valio madre en la compra");
                }    
            }else{
                response.sendRedirect("error.jsp");
            }
            
        }
    }

    private static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
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
