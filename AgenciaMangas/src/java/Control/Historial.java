/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author bocal
 */
public class Historial {
    
    public static List<Venta> getHistorialByUsuario(int idU) throws SQLException{
        List<Venta> lista = new ArrayList<Venta>();
        
        Connection cn=conexionU.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql;
        try{
            
            sql = "Select * from Historial,ventas,cservicio where FKid_cu = ? and FKnum_vent=num_vent and FKid_Ser=id_Ser";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idU);
            rs = ps.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                    v.setVentaID(rs.getInt(3));
                    v.setIdMV(rs.getInt(4));
                    v.setIdSer(rs.getInt(6));
                    v.setFechaVenta(rs.getDate(7));
                    v.setCantidad(rs.getInt(8));
                    v.setTotalVenta(rs.getFloat(9));
                    v.setServicio(rs.getString(11));
                lista.add(v);
            }
            
        }catch(SQLException ex){
            ex.getStackTrace();
            System.out.println(ex.getMessage());
        }finally{
            rs.close();
            ps.close();
            cn.close();
        }
    return lista;
    }
    public static List<Venta> getAllHistorial() throws SQLException{
        List<Venta> lista = new ArrayList<Venta>();
        
        Connection cn=conexionU.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql;
        try{
            sql="Select * from Historial,ventas,cservicio,usuario where FKnum_vent=num_vent and FKid_Ser=id_Ser and FKid_cu=id_Usu";
            ps= cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                    v.setIdH(rs.getInt(1));
                    v.setIdu(rs.getInt(2));
                    v.setVentaID(rs.getInt(3));
                    v.setIdMV(rs.getInt(4));
                    v.setIdSer(rs.getInt(6));
                    v.setFechaVenta(rs.getDate(7));
                    v.setCantidad(rs.getInt(8));
                    v.setTotalVenta(rs.getFloat(9));
                    v.setServicio(rs.getString(11));
                lista.add(v);
            }
        }catch(Exception ex) {
            System.out.println("Error en all historial");
            System.out.println(ex.getMessage());
        }finally{
            rs.close();
            ps.close();
            cn.close();
        }
        return lista;
    }
    public static List<Venta> getHistorialByUsuarioMax(int idU) throws SQLException{
        List<Venta> lista = new ArrayList<Venta>();
        Connection cn=conexionU.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql;
        try{
            System.out.println("el que llega a histtorial"+idU);
            int idV = Historial.getVentaMax(idU);
            
            
            sql = "Select * from Historial,ventas,cservicio where FKid_cu=? and FKnum_vent=? and FKnum_vent=num_vent and FKid_Ser=id_Ser";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idU);
            ps.setInt(2,idV);
            rs = ps.executeQuery();
            while(rs.next()){
                Venta v = new Venta();
                    v.setVentaID(rs.getInt(3));
                    v.setIdMV(rs.getInt(4));
                    v.setIdSer(rs.getInt(6));
                    v.setFechaVenta(rs.getDate(7));
                    v.setCantidad(rs.getInt(8));
                    v.setTotalVenta(rs.getFloat(9));
                    v.setServicio(rs.getString(11));
                lista.add(v);
            }
            
        }catch(SQLException ex){
            System.out.println("error en obtencion historial venta");
            ex.getStackTrace();
            System.out.println(ex.getMessage());
        }finally{
            rs.close();
            ps.close();
            cn.close();
        }
    return lista;
    }
    private static int getVentaMax(int idU) throws SQLException{
        Connection con = conexionU.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql;
        int numV=0;
        try{
            System.out.println("rpincipio");
            sql = "SELECT MAX(num_vent) from Historial,Ventas where FKid_cu=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idU);
            rs = ps.executeQuery();
            System.out.println("mitad");
            while(rs.next()){
                numV=rs.getInt(1);
                break;
            }
            System.out.println("final");
        }catch(SQLException ex){
            System.out.println("error en obtencin de venta maxima");
            ex.getStackTrace();
            System.out.println(ex.getMessage());
        }
    return numV;
    }
}
