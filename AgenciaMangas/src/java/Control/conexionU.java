package Control;

import java.util.*;
import java.sql.*;
public class conexionU {
    
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
    public static int Guardar(Usuario u){
        int estatus = -1;
        try{
            
            Connection con = conexionU.getConnection();
            String q = "insert into usuario (Usuario, pass, Privi) values (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, u.getNombreS());
            ps.setString(2, u.getContrasenaS());
            ps.setInt(3, u.getPrivilegio());
            ps.executeUpdate();
            System.out.println("se sigue haciendo");
            q = "select * from usuario where Usuario = '"+u.getNombreS()+"' and pass = '"+u.getContrasenaS()+"'";
            ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                u.setIdC(rs.getInt(1));
                System.out.println(u.getIdC());
                System.out.println("se hace aca dentro");
            }
            q = "insert into cdireccion (id_dir, Calle, Inter, Ext, Col, no_post)"
                    + " values (?, ?, ?, ?, ?, ?)";
            
            ps = con.prepareStatement(q);
            ps.setInt(1, u.getIdC());
            ps.setString(2, u.getCalle());
            ps.setInt(3, u.getIn());
            ps.setInt(4, u.getEx());
            ps.setString(5, u.getColonia());
            ps.setString(6, u.getCp());
            ps.executeUpdate();
            System.out.println("se hace aqui");
            int idC=u.getIdC();
            u.setIdD(idC);
            q = "insert into dcuenta (id_cu, FKid_Usu, Nom, appat, apmat,Fnac, curp, tel, FKid_dir)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?,?)";
            
            ps = con.prepareStatement(q);
            ps.setInt(1, u.getIdC());
            ps.setInt(2, u.getIdC());
            ps.setString(3, u.getNombre());
            ps.setString(4, u.getAppat());
            ps.setString(5, u.getApmat());
            ps.setString(6, u.getFNac());
            ps.setString(7, u.getCurp());
            ps.setInt(8, u.getTelefono());
            ps.setInt(9, u.getIdD());
            estatus=ps.executeUpdate();
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;
    }
    public static int Actualizar(Usuario u) throws SQLException{
        int estatus = 0;
        Connection con = conexionU.getConnection();
        String sql = "";
        PreparedStatement ps = null;
        try{
            sql= "update dcuenta set Nom = ?, appat=?, apmat=?, Fnac=?, Curp=?, tel=? where id_cu=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getAppat());
            ps.setString(3, u.getApmat());
            ps.setString(4, u.getFNac());
            ps.setString(5, u.getCurp());
            ps.setInt(6, u.getTelefono());
            ps.setInt(7, u.getIdu());
            estatus += ps.executeUpdate();
            
            sql= "update cdireccion set Calle=?,"
                    + "Inter=?,"
                    + "Ext=?,"
                    + "Col=?,"
                    + "no_post=?"
                    + "where id_dir=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getCalle());
            ps.setInt(2, u.getIn());
            ps.setInt(3, u.getEx());
            ps.setString(4, u.getColonia());
            ps.setString(5, u.getCp());
            ps.setInt(6, u.getIdD());
            estatus += ps.executeUpdate();
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
    public static int Eliminar(int id, int idD, int idC) throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        String q=null;
        int estatus = 0;
        try{
            con = conexionU.getConnection();
            q ="delete from dcuenta where id_cu=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus += ps.executeUpdate();
            
            con = conexionU.getConnection();
            q ="delete from cdireccion where id_dir=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, idD);
            estatus += ps.executeUpdate();
            
            con = conexionU.getConnection();
            q ="delete from usuario where id_Usu=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, idC);
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
    public static Usuario getUsuarioById(int id){
        Usuario u = new Usuario();
        try{
            Connection con = conexionU.getConnection();
            String sql = "Select * from dcuenta "
                    + "where FKid_Usu = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                u.setIdu(rs.getInt(1));
                u.setNombre(rs.getString(3));
                u.setAppat(rs.getString(4));
                u.setApmat(rs.getString(5));
                u.setFNacD(rs.getDate(6));
                u.setCurp(rs.getString(7));
                u.setTelefono(rs.getInt(8));
                u.setIdD(rs.getInt(9));
                break;
            }
            int idD = u.getIdD();
            
            sql = "Select * from cdireccion "
                    + "where id_dir = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idD);
            rs = ps.executeQuery();
            while(rs.next()){
                u.setCalle(rs.getString(2));
                u.setIn(rs.getInt(3));
                u.setEx(rs.getInt(4));
                u.setColonia(rs.getString(5));
                u.setCp(rs.getString(6));
                break;
            }
            
            sql = "Select * from usuario "
                    + "where id_Usu = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                u.setNombreS(rs.getString(2));
                break;
            }
            con.close();
            
        }catch(Exception ed){
            System.out.println("error en get usuario by id");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        
        }
        return u;
    }
    public static List<Usuario> getAllUsuarios() throws SQLException{
        List<Usuario> lista = new ArrayList<Usuario>();
        Connection con = conexionU.getConnection();
        String sql = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            sql="select * from dcuenta, usuario, cdireccion where FKid_Usu=id_Usu and FKid_dir=id_dir";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                    u.setIdu(rs.getInt(1));
                    u.setIdC(rs.getInt(2));
                    u.setNombre(rs.getString(3));
                    u.setAppat(rs.getString(4));
                    u.setApmat(rs.getString(5));
                    u.setFNacD(rs.getDate(6));
                    u.setCurp(rs.getString(7));
                    u.setTelefono(rs.getInt(8));
                    u.setIdD(rs.getInt(9));
                    u.setNombreS(rs.getString(11));
                    u.setContrasenaS(rs.getString(12));
                    u.setPrivilegio(rs.getInt(13));
                    u.setCalle(rs.getString(15));
                    u.setIn(rs.getInt(16));
                    u.setEx(rs.getInt(17));
                    u.setColonia(rs.getString(18));
                    u.setCp(rs.getString(19));
                    
                lista.add(u);
            }
        }catch(Exception ed){
            System.out.println("Sí tiene error");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            rs.close();
            ps.close();
            con.close();
        }
        return lista;        
    }
    public Usuario verificarUsuario(String user, String clave){
        Usuario u = new Usuario();
        try{
            
            Connection con = conexionU.getConnection();
            String sql="select * from usuario where Usuario = '"+user+"' and pass = '"+clave+"'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                u = new Usuario();
                u.setIdu(rs.getInt(1));
                u.setNombreS(rs.getString(2));
                u.setContrasenaS(rs.getString(3));
                u.setPrivilegio(rs.getInt(4));
                break;
            }
            
        }catch(Exception ex){
            ex.printStackTrace();
            u=null;
        } 
        return u;
    }
}
