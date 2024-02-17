/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Sergio Trinidad
 */
public class Conexion {
     String USERNAME = "root";
     String PASSWORD = "1234";
     String HOST = "localhost";
     String PORT = "3306";
     String DATABASE = "PELISCORP";
     String CLASSNAME = "com.mysql.cj.jdbc.Driver";
     String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
     Connection con;
     
     public Connection getConnection(){
         try{
             Class.forName(CLASSNAME);
             con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
         }
         catch(Exception e){
             
         }
         
         return con;
     }
}
