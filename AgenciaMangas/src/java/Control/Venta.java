package Control;
import java.sql.*;
import java.util.*;
import java.sql.Date;
public class Venta {
    private int ventaID, cantidad, idU, idMV, idH;
    private float totalVenta;
    private java.sql.Date fechaVenta;
    private String fechaVentaS;
    private int idSer;
    private String servicio;
    
    public Venta(){
        
    }
    
    private int ultimoCodigoInsertado() throws SQLException{
        Connection cn = conexionU.getConnection();
        int codigo= 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            String q ="select MAX(num_vent) as num_vent from Ventas";
            ps = cn.prepareStatement(q);
            rs= ps.executeQuery();
            
            while(rs.next()){
                codigo = rs.getInt("num_vent");
                break;
            }
        }catch(SQLException ex){
            ex.getStackTrace();
            System.out.println(ex.getMessage());
            System.out.println("Hay un error en ultimo codigo insertado");
            codigo=0;
        }
        System.out.println("codigo"+codigo);
        return codigo;
    }
    public boolean RegistrarVenta(Venta v, Vector<Detalleventa> ldv){
        boolean registro = false;
        Connection cn=null;
        PreparedStatement ps=null;
        ResultSet rs= null;
        
        try{
            cn=conexionM.getConnection();
            String q="insert into Ventas(FKid_Ser, Fech_compr, CantVentas, total) values (?, ?, ?, ?)";
            ps=cn.prepareStatement(q);
            ps.setInt(1, v.getIdSer());
            ps.setDate(2, v.getFechaVenta());
            ps.setInt(3, v.getCantidad());
            ps.setFloat(4, v.getTotalVenta());
            
            if(ps.executeUpdate()==1){
                int codigo = this.ultimoCodigoInsertado();
                boolean hist = this.registroHistorial(codigo, ldv,v.getIdu(), cn);
                registro = hist;
            }else{
                registro=false;
            }
        }catch(SQLException ex){
            registro = false;
            System.out.println(ex.getMessage());
            System.out.println("Error en registrarventa");
        }finally{
            try{
                ps.close();
                cn.close();
            }catch(SQLException ex){
                ex.getStackTrace();
                System.out.println(ex.getMessage());
            }
        }
        return registro;
    }
    
    private boolean registroHistorial(int codigo, Vector<Detalleventa> ldv,int idU, Connection cn){
        boolean registro=false;
        PreparedStatement ps=null;
        
        try{
            for(Detalleventa dv : ldv){
                System.out.println("id del Usuario"+idU);
                String q="insert into Historial (FKid_cu,FKnum_vent,FKprod) values(?, ?, ?)";
                ps=cn.prepareStatement(q);
                ps.setInt(1, idU);
                ps.setInt(2, codigo);
                ps.setInt(3, dv.getIdM());
                
                if(ps.executeUpdate()==1){
                    registro=true;
                }else{
                    registro=false;
                    break;
                }
            }
        }catch(SQLException ex){
            registro = false;
            ex.getStackTrace();
            System.out.println(ex.getMessage());
        }
    return registro;
    }
    
    public int getVentaID() {
        return ventaID;
    }

    public void setVentaID(int ventaID) {
        this.ventaID = ventaID;
    }

    public java.sql.Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(java.sql.Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }
    
    public int getIdSer() {
        return idSer;
    }

    public void setIdSer(int idSer) {
        this.idSer = idSer;
    }
    
    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(float totalVenta) {
        this.totalVenta = totalVenta;
    }
    
    public int getIdu() {
        return idU;
    }

    public void setIdu(int idU) {
        this.idU = idU;
    }
    
    public String getServicio(){
        return servicio;
    }
    
    public void setServicio(String servicio){
        this.servicio=servicio;
    }
    
    public int getIdMV(){
        return idMV;
    }
    
    public void setIdMV(int idMV){
        this.idMV=idMV;
    }
    
    public int getIdH(){
        return idH;
    }
    
    public void setIdH(int idH){
        this.idH=idH;
    }
    
    public String getFechaVentaS(){
        return fechaVentaS;
    }
    
    public void setFechaVentaS(String fechaVentaS){
        this.fechaVentaS=fechaVentaS;
    }
}
