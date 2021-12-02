/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

/**
 *
 * @author bocal
 */
public class Detalleventa {
    private int ventaID;
    private int detVenta_Item;
    private int idM;
    private int detVenta_cantidad;
    private double detVenta_subtotal;
    
    public Detalleventa(){
        
    }

    public int getVentaID() {
        return ventaID;
    }

    public void setVentaID(int ventaID) {
        this.ventaID = ventaID;
    }

    public int getDetVenta_Item() {
        return detVenta_Item;
    }

    public void setDetVenta_Item(int detVenta_Item) {
        this.detVenta_Item = detVenta_Item;
    }

    public int getIdM() {
        return idM;
    }

    public void setIdM(int idM) {
        this.idM = idM;
    }

    public int getDetVenta_cantidad() {
        return detVenta_cantidad;
    }

    public void setDetVenta_cantidad(int detVenta_cantidad) {
        this.detVenta_cantidad = detVenta_cantidad;
    }

    public double getDetVenta_subtotal() {
        return detVenta_subtotal;
    }

    public void setDetVenta_subtotal(double detVenta_subtotal) {
        this.detVenta_subtotal = detVenta_subtotal;
    }
    
}
