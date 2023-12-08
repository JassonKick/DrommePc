package com.drommepc.modelo;
    
public class Cliente {
    private int id;
    private String rut;
    private String nombres;
    private String direccion;
    private String email;
    private String password;

    public Cliente() {
    }

    public Cliente(int id, String rut, String nombres, String direccion, String correo, String password) {
        this.id = id;
        this.rut = rut;
        this.nombres = nombres;
        this.direccion = direccion;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
