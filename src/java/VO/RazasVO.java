/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author Admin
 */
public class RazasVO {

    private String idRaza;
    private String Nombre;
    private String FKEspecie;

    public RazasVO(String idRaza, String Nombre) {
        this.idRaza = idRaza;
        this.Nombre = Nombre;
    }

    
    public RazasVO(String idRaza, String Nombre, String FKEspecie) {
        this.idRaza = idRaza;
        this.Nombre = Nombre;
        this.FKEspecie = FKEspecie;
    }

    
    public RazasVO() {
    }

    
    public String getIdRaza() {
        return idRaza;
    }

    public void setIdRaza(String idRaza) {
        this.idRaza = idRaza;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getFKEspecie() {
        return FKEspecie;
    }

    public void setFKEspecie(String FKEspecie) {
        this.FKEspecie = FKEspecie;
    }

    
    
}
