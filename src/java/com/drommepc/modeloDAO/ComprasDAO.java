package com.drommepc.modeloDAO;

import com.drommepc.modelo.Carrito;
import com.drommepc.config.Conexion;
import com.drommepc.modelo.Compras;
import com.drommepc.modelo.DetalleCompras;
import com.drommepc.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class ComprasDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
       public int IdCompra() {
        int idc = 0;
        String sql = "select max(idCompras) from compras";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idc = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idc;
    }

    public int guardarCompra(Compras co) {
        String sql = "insert into Compras(idCliente,idPago, FechaCompras,Monto,Estado)values(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, co.getIdCliente());
            ps.setInt(2, co.getIdPago());
            ps.setString(3, co.getFecha());
            ps.setInt(4, co.getMonto());
            ps.setString(5, co.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return 1;
    }

    public int guardarDetalleCompra(DetalleCompras dc) {
        String sql = "insert into Detalle_Compras(idProducto,idCompras, Cantidad, PrecioCompra)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dc.getIdproducto());
            ps.setInt(2, dc.getIdcompra());
            ps.setInt(3, dc.getCantidad());
            ps.setInt(4, dc.getPrecioCompra());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
        }
        return 1;
    }

    

    public int IdPago() {
        int idpago = 0;
        String sql = "select max(idPago) from pago";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idpago = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idpago;
    }
}
