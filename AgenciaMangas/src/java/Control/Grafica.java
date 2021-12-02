/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.util.List;
import Control.Venta;
import java.util.ArrayList;
import Control.conexionU;
import java.sql.*;
import java.io.*;
/**
 *
 * @author bocal
 */
public class Grafica {
    public void executarP() throws IOException{
        String prg = "import sys"; 
        BufferedWriter out = new BufferedWriter(new FileWriter("path/localhost:8080\\AgenciaMangas\\web\\GraficasMangacomp.py")); 
        out.write(prg); 
        out.close(); 
        Process p = Runtime.getRuntime().exec("python path/GraficasMangacomp.py"); 
        BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream())); 
        String ret = in.readLine(); 
        System.out.println("value is : "+ret); 
    }
}
