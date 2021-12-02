/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bocal
 */
import java.util.*;
import java.sql.*;

public class conexionM {
    public static Connection getConnection(){
        String url, userName, password;
        
        url="jdbc:mysql://localhost/agenciam";
        userName="root";
        password="n0m3l0";
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, userName, 
                    password);
            System.out.println("Se conecto a la BD");
        }catch(Exception e){
            System.out.println("No se conecto a la BD");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return con;
    }
    public static int Guardar(Mangas m) throws SQLException{
        int estatus = 0;
        Connection con = conexionM.getConnection();
        String q;
        PreparedStatement ps = null;
        try{

            q = "insert into mproduct (Nom_prod, Descr_prod, FKid_est, FKid_edit, FKid_gen, FKid_demo, costo, Stock, URL_img)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(q);
            ps.setString(1,m.getNombre());
            ps.setString(2, m.getDescripcion());
            ps.setInt(3, m.getIdEst());
            ps.setInt(4, m.getIdEd());
            ps.setInt(5, m.getIdGen());
            ps.setInt(6, m.getIdDem());
            ps.setFloat(7, m.getCosto());
            ps.setInt(8, m.getStock());
            ps.setString(9, m.getUrli());
            
            estatus = ps.executeUpdate();
        }catch(Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;
    }
    public static int Actualizar(Mangas m) throws SQLException{
        int estatus = 0;
        Connection con = conexionU.getConnection();
        String sql;
        PreparedStatement ps = null;
        try{
            System.out.println(m.getIdm());
            sql= "update mproduct set Nom_prod=?,"
                    + "Descr_prod=?,"
                    + "FKid_est=?,"
                    + "FKid_edit=?,"
                    + "FKid_gen=?,"
                    + "FKid_demo=?,"
                    + "costo=?,"
                    + "Stock=?,"
                    + "URL_img=?"
                    + "where id_product=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, m.getNombre());
            ps.setString(2, m.getDescripcion());
            ps.setInt(3, m.getIdEst());
            ps.setInt(4, m.getIdEd());
            ps.setInt(5, m.getIdGen());
            ps.setInt(6, m.getIdDem());
            ps.setFloat(7, m.getCosto());
            ps.setInt(8, m.getStock());
            ps.setString(9, m.getUrli());
            ps.setInt(10, m.getIdm());
            
            
            estatus = ps.executeUpdate();
            
        }catch(Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;
    }
    public static int Eliminar(int id) throws SQLException{
        int estatus = 0;
        Connection con = conexionU.getConnection();
        PreparedStatement ps = null;
        String q;
        try{
            q ="delete from mproduct where id_product=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus += ps.executeUpdate();
        
        }catch (Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;
    }
    public static Mangas getMangaById(int id){ 
        Mangas m = new Mangas();
        try{
            Connection con = conexionU.getConnection();
            String sql = "Select * from mproduct "
                    + "where id_product= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                    m.setIdm(rs.getInt(1));
                    m.setNombre(rs.getString(2));
                    m.setDescripcion(rs.getString(3));
                    m.setIdEst(rs.getInt(4));
                    m.setIdEd(rs.getInt(5));
                    m.setIdGen(rs.getInt(6));
                    m.setIdDem(rs.getInt(7));
                    m.setCosto(rs.getFloat(8)); //este va float
                    m.setStock(rs.getInt(9));
                    m.setUrli(rs.getString(10));
            }
            sql="select * from cdemograf where id_Demo="+m.getIdDem();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                    m.setDemografia(rs.getString(2));
            }
            sql="select * from cestado where id_est="+m.getIdEst();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                    m.setEstado(rs.getString(2));
            }
            sql="select * from ceditorial where id_Edit="+m.getIdEd();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                    m.setEditorial(rs.getString(2));
            }
            sql="select * from cgenero where id_Genero="+m.getIdGen();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                    m.setGenero(rs.getString(2));
            }
            con.close();
        }catch(Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return m;
    }
    public static List<Mangas> getAllMangas(){
        List<Mangas> lista = new ArrayList<Mangas>();
        try{
            
            Connection con = conexionU.getConnection();
            String sql = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            sql="select * from mproduct, cgenero, cestado, cdemograf, ceditorial where FKid_gen=id_Genero and FKid_est=id_est and "
                    + "FKid_demo=id_Demo and FKid_edit=id_Edit;";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Mangas m = new Mangas();
                    m.setIdm(rs.getInt(1));
                    m.setNombre(rs.getString(2));
                    m.setDescripcion(rs.getString(3));
                    m.setIdEst(rs.getInt(4));
                    m.setIdEd(rs.getInt(5));
                    m.setIdGen(rs.getInt(6));
                    m.setIdDem(rs.getInt(7));
                    m.setCosto(rs.getFloat(8)); //este va float
                    m.setStock(rs.getInt(9));
                    m.setUrli(rs.getString(10));
                    m.setGenero(rs.getString(12));
                    m.setEstado(rs.getString(14));
                    m.setDemografia(rs.getString(16));
                    m.setEditorial(rs.getString(18));
                lista.add(m);
            }            
            con.close();
        }catch(Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return lista;        
    }
    
    //actualizacion del stock
    public boolean actualizarStock(Vector<Mangas> vp){
        boolean actualizo = false;
        Connection cn=null;
        PreparedStatement ps=null;
        ResultSet rs= null;
        
        try{
            cn = conexionM.getConnection();
            for (Mangas m : vp){
                String q = "Update mproduct set stock = ? where id_product = ?";
                ps = cn.prepareStatement(q);
                ps.setInt(1, m.getStock());
                ps.setInt(2, m.getIdm());
                
                if(ps.executeUpdate()==1){
                    actualizo = true;
                }else{
                    actualizo = false;
                    break;
                }
            }
        }catch(Exception ex){
            ex.getStackTrace();
            System.out.println(ex.getMessage());
            System.out.println("Error en actualizacion de stock");
        }finally{
            try{
                ps.close();
                cn.close();
            }catch(SQLException ex){
                ex.getStackTrace();
                System.out.println(ex.getMessage());
            }
        }
        return actualizo;
    }
}
