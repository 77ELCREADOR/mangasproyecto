/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author bocal
 */
public class Usuario {
    
    private int idU, tel, privilegio, idD,in,ex,idC;
    private String fNac;
    private java.sql.Date fNacD;
    private String nombre, appat, apmat, curp, colonia, nombreS, contrasenaS, calle,cp;
    
    public int getIdC(){
        return idC;
    }
    public void setIdC(int idC){
        this.idC=idC;
    }
    public int getIn(){
        return in;
    }
    public void setIn(int in){
        this.in=in;
    }
    public int getEx(){
        return ex;
    }
    public void setEx(int ex){
        this.ex=ex;
    }
    public int getIdD(){
        return idD;
    }
    public void setIdD(int idD){
        this.idD=idD;
    }
    public int getIdu() {
        return idU;
    }
    public void setIdu(int idU) {
        this.idU = idU;
    }
    public int getPrivilegio(){
        return privilegio;
    }
    public void setPrivilegio(int privilegio){
        this.privilegio=privilegio;
    }
    public String getNombreS(){
        return nombreS;
    }
    public void setNombreS(String nombreS) {
        this.nombreS = nombreS;
    }
    public String getContrasenaS(){
        return contrasenaS;
    }
    public void setContrasenaS(String contrasenaS) {
        this.contrasenaS = contrasenaS;
    }
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public String getAppat(){
        return appat;
    }
    public void setAppat(String appat){
        this.appat=appat;
    }
    public String getApmat(){
        return apmat;
    }
    public void setApmat(String apmat){
        this.apmat=apmat;
    }
    public String getCurp(){
        return curp;
    }
    public void setCurp(String curp){
        this.curp=curp;
    }
    public String getCalle(){
        return calle;
    }
    public void setCalle(String calle){
        this.calle=calle;
    }
    public String getColonia(){
        return colonia;
    }
    public void setColonia(String colonia){
        this.colonia=colonia;
    }
    public String getFNac() {
        return fNac;
    }
    public void setFNac(String fNac) {
        this.fNac = fNac;
    }
    public java.sql.Date getFNacD() {
        return fNacD;
    }
    public void setFNacD(java.sql.Date fNacD) {
        this.fNacD = fNacD;
    }
    public String getCp() {
        return cp;
    }
    public void setCp(String cp) {
        this.cp =cp ;
    }
    public int getTelefono() {
        return tel;
    }
    public void setTelefono(int tel) {
        this.tel = tel;
    }
    
}
