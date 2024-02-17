/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sergio Trinidad
 */
public class PersonaDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Cliente validar(String nombres, String password) {
        Cliente em = new Cliente();

        String sql = "SELECT * FROM cliente WHERE Email=? and Password=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombres);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setNombre(rs.getString("Email"));
                em.setPassword(rs.getString("Password"));
            }

        } catch (Exception e) {

        }
        return em;
    }
}
