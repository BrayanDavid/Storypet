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
public class MascotasVO {

    private String idMascota;
    private String Nombre;
    private String FechaNacimiento;
    private String Sexo;
    private String FKRaza;
    private String FKUsuario;

    public MascotasVO(String idMascota, String Nombre, String FechaNacimiento, String Sexo, String FKRaza, String FKUsuario) {
        this.idMascota = idMascota;
        this.Nombre = Nombre;
        this.FechaNacimiento = FechaNacimiento;
        this.Sexo = Sexo;
        this.FKRaza = FKRaza;
        this.FKUsuario = FKUsuario;
    }

    public MascotasVO() {
    }

    public String getIdMascota() {
        return idMascota;
    }

    public void setIdMascota(String idMascota) {
        this.idMascota = idMascota;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public String getFKRaza() {
        return FKRaza;
    }

    public void setFKRaza(String FKRaza) {
        this.FKRaza = FKRaza;
    }

    public String getFKUsuario() {
        return FKUsuario;
    }

    public void setFKUsuario(String FKUsuario) {
        this.FKUsuario = FKUsuario;
    }

}
