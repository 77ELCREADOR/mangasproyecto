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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author bocal
 */
public class GuardarU extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
    
    /**
     * Handles the HTTP <code>GET</code> method.
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
            String idUS,fNac,cp, telS, nombre, appat, apmat, curp, calle, colonia, nombres, contrasenas,
                    inS,exS;
            int idU = 0;
            
            nombre = request.getParameter("nomU");
            appat = request.getParameter("appatU");
            apmat = request.getParameter("apmatU");
            curp = request.getParameter("curpU");
            colonia=request.getParameter("colDU");
            fNac=request.getParameter("fNacU");
            calle= request.getParameter("calleDU");
            inS=request.getParameter("inU");
            exS=request.getParameter("exU");
            cp =request.getParameter("cpU");
            telS =request.getParameter("telU");
            nombres=request.getParameter("nomCU");
            contrasenas=request.getParameter("contU");
            
            boolean exp1=Validacion.letrasEspacios(nombre);
            boolean exp2=Validacion.letrasEspacios(appat);
            boolean exp3=Validacion.letrasEspacios(apmat);
            boolean exp4=Validacion.direcciones(curp);
            boolean exp5=Validacion.direcciones(calle);
            boolean exp6=Validacion.direcciones(colonia);
            boolean exp7=Validacion.numerosEnteros(inS);
            boolean exp8=Validacion.numerosEnteros(exS);
            boolean exp9=Validacion.numerosEnteros(cp);
            boolean exp10=Validacion.numerosEnteros(telS);
            boolean exp11=Validacion.NombreCuenta(nombres);
            boolean exp12=Validacion.Contrasenas(contrasenas);
            boolean exp13=Validacion.Fechas(fNac);
            System.out.println(exp1+""+exp2+""+exp3+""+exp4+""+exp5+""+exp6+""+exp7+""+exp8+""+exp9+""+exp10+""+exp11+""+exp12+""+exp13);
            if (nombre!=null || appat!=null || apmat!=null || curp!=null || colonia!=null || exS!=null || inS!=null || calle!=null || cp!=null || telS!=null || nombres!=null || contrasenas!=null || fNac!=null) {
		if (exp1==false || exp2==false || exp3==false || exp4==false || exp5==false || exp6==false || exp7==false || exp8==false || exp9==false || exp10==false || exp11==false || exp12==false || exp13==false){
                    System.out.println("medio");
                    response.sendRedirect("error.jsp");
		}else{
                    int lonombre=nombre.length();
                    int loappat=appat.length();
                    int loapmat=apmat.length();
                    int locurp=curp.length();
                    int locolonia=colonia.length();
                    int localle=calle.length();
                    int locp=cp.length();
                    int lotel=telS.length();
                    int lonomC=nombres.length();
                    int locont=contrasenas.length();
                    int loex=exS.length();
                    int loin=inS.length();
                    String ano="";
                    for (int i=0; i<fNac.length();i++){
                        if(i<4){
                            ano=ano+fNac.charAt(i);
                        }
                    }
                    int anoI=Integer.parseInt(ano);
                    if (lonombre>20 || loappat>20 || loapmat>20 || locurp!=18 || locolonia>50 || localle>50 || locp!=5 || lotel!=8 || lonomC>20 || locont>20 || loex>3 || loin>3 || anoI>2017 || anoI<1915){
                        System.out.println("abajo");
                        response.sendRedirect("error.jsp");
                    }else{
                        int in=Integer.parseInt(inS);
                        int ex=Integer.parseInt(exS);
                        int tel = Integer.parseInt(telS);
                        
                        Usuario u = new Usuario();
                        u.setIdu(idU);
                        u.setNombre(nombre);
                        u.setAppat(appat);
                        u.setApmat(apmat);
                        u.setCp(cp);
                        u.setEx(ex);
                        u.setIn(in);
                        u.setFNac(fNac);
                        u.setTelefono(tel);
                        u.setCurp(curp);
                        u.setCalle(calle);
                        u.setColonia(colonia);
                        u.setNombreS(nombres);
                        u.setPrivilegio(1);
                        u.setContrasenaS(contrasenas);
                        int estado = conexionU.Guardar(u);

                        if(estado >0){
                            response.sendRedirect("IniciarSesion.jsp");
                        }else{
                            out.println("<h1>Lo sentimos, escoja otro nombre de Usuario</h1>");
                            out.println("<a href='Registrar.jsp' style='color: #969A97;'>Regresar</a>");
                        }
                    }
		}
            }else{
                System.out.println("arriba");
                response.sendRedirect("error.jsp");
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
