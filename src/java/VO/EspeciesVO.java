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
public class EspeciesVO {

    private String idEspecie;
    private String Nombre;

    public EspeciesVO(String idEspecie, String Nombre) {
        this.idEspecie = idEspecie;
        this.Nombre = Nombre;
    }

    public EspeciesVO() {
    }

    public String getIdEspecie() {
        return idEspecie;
    }

    public void setIdEspecie(String idEspecie) {
        this.idEspecie = idEspecie;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

}
