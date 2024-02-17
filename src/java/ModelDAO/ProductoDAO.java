/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Model.Producto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio Trinidad
 */
public class ProductoDAO{
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Producto listarId(int id){
        String sql = "SELECT * FROM producto WHERE idProducto="+id;
        Producto p = new Producto();
        try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        while(rs.next()){
               p.setId(rs.getInt(1));
               p.setNombres(rs.getString(2));
               p.setFoto(rs.getBinaryStream(3));
               p.setDescripcion(rs.getString(4));
               p.setPrecio(rs.getDouble(5));
               p.setStock(rs.getInt(6));
        }
        } 
        catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return p;
    }
    
    
    
    public List listar(){
        List<Producto>productos = new ArrayList();
        String sql = "SELECT * FROM producto;";
        try {
           con = cn.getConnection();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
           
           while(rs.next()){
               Producto p = new Producto();
               
               p.setId(rs.getInt(1));
               p.setNombres(rs.getString(2));
               p.setFoto(rs.getBinaryStream(3));
               p.setDescripcion(rs.getString(4));
               p.setPrecio(rs.getDouble(5));
               p.setStock(rs.getInt(6));
               
               productos.add(p);
               
           }
        } catch (Exception e) {
            System.out.println("Problema: "+e);
        }
        return productos;
    }
    
    public void listarIMG(int id, HttpServletResponse response){
        String sql = "SELECT * FROM producto WHERE idProducto="+id;
        InputStream inputStream = null;
        OutputStream outputStream =null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
      
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if(rs.next()){
                
                inputStream = rs.getBinaryStream("Foto");
                            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            
            int i =0;
            while((i=bufferedInputStream.read())!= -1){
                bufferedOutputStream.write(i);
            }
        }
        catch (Exception e) {
                 System.out.println("Problema: "+e);
       }
      
    }
    
}
