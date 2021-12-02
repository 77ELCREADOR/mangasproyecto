/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Control.Detalleventa;
import Control.Mangas;
import Control.Validacion;
import java.util.Vector;
import Control.conexionM;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bocal
 */
public class AgregarCarro extends HttpServlet {

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
        doPost(request,response);
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
        try (PrintWriter out = response.getWriter()){
            String cantidadS = request.getParameter("cant");
            boolean exp1=Validacion.numerosEnteros(cantidadS);
            System.out.println(exp1);
            if(exp1==false){
                response.sendRedirect("error.jsp");
            }
            int cantidad=Integer.parseInt(cantidadS);
            int stock=Integer.parseInt(request.getParameter("stock").trim());
            System.out.println(stock);
            System.out.println(cantidad);
            if ((stock-cantidad)<0){
                response.sendRedirect("error.jsp");
            }else{
                System.out.println("se llega hasta aca");
                HttpSession sesionOk=request.getSession();
                Vector<Detalleventa> vectorDetalles=null;
                Vector<Mangas> stockProducto=null;
                //Si se creo la sesion con el atributo de detalle de venta
                if(sesionOk.getAttribute("detalleVenta")!=null){
                    //Si existe una sesion con ese atributo, se obtiene los datos de esa sesion
                    vectorDetalles=(Vector<Detalleventa>)sesionOk.getAttribute("detalleVenta");
                    stockProducto=(Vector<Mangas>)sesionOk.getAttribute("stockProducto");
                }else{
                    //Si no existe esa sesion se crea el vector de detalles de venta
                    vectorDetalles=new Vector<Detalleventa>();
                    stockProducto=new Vector<Mangas>();
                }
                //Obtenemos los valores de la cajas de texto
                int idM=Integer.parseInt(request.getParameter("idMS").trim());
                Mangas m=new Mangas();
                m=conexionM.getMangaById(idM);
                double subTotal=cantidad * m.getCosto();
                Detalleventa detalle=new Detalleventa();
                detalle.setDetVenta_Item(vectorDetalles.size()+1);
                detalle.setIdM(idM);
                detalle.setDetVenta_subtotal(subTotal);
                detalle.setDetVenta_cantidad(cantidad);
                vectorDetalles.add(detalle);
                sesionOk.setAttribute("detalleVenta",vectorDetalles);
                m.setStock(m.getStock()-cantidad);
                stockProducto.add(m);
                sesionOk.setAttribute("stockProducto",stockProducto);
                response.sendRedirect("CarritoCompras.jsp");
            }
        }catch(Exception e){
            System.out.println("Error en AgregarCarro");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
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
