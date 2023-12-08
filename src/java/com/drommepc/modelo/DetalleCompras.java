
package com.drommepc.modelo;

public class DetalleCompras {
    int id;
    int idcompra;
    int idproducto;
    int cantidad;
    int precioCompra;
    Producto producto;

    public DetalleCompras() {
    }

    public DetalleCompras(int id, int idcompra, int idproducto, int cantidad, int precioCompra, Producto producto) {
        this.id = id;
        this.idcompra = idcompra;
        this.idproducto = idproducto;
        this.cantidad = cantidad;
        this.precioCompra = precioCompra;
        this.producto = producto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(int precioCompra) {
        this.precioCompra = precioCompra;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
    
    
}
