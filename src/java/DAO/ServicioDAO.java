/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Config.Conexion;
import VO.ServiciosVo;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ServicioDAO extends Conexion {

    Conexion conexion = new Conexion();
    private Connection Conn = null;
    private Statement puente = null;
    private ResultSet rs = null;

    public List Listar() {
        ArrayList<ServiciosVo> List = new ArrayList<>();
        String Sql = "Select Servicio from Servicios;";
        try {
            conn = conexion.obtenerConexion();
            puente = conn.prepareStatement(Sql);
            rs = puente.executeQuery(Sql);
            while (rs.next()) {
                ServiciosVo serviciosVo = new ServiciosVo();
                serviciosVo.setTipoServicio(rs.getString("Servicio"));
                List.add(serviciosVo);
            }

        } catch (Exception e) {
            e.getStackTrace();
        }
        return List;
    }

}
