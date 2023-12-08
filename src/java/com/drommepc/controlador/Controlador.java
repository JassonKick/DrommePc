package com.drommepc.controlador;

import com.drommepc.config.Fecha;
import com.drommepc.modelo.Carrito;
import com.drommepc.modelo.Cliente;
import com.drommepc.modelo.Compras;
import com.drommepc.modelo.DetalleCompras;
import com.drommepc.modelo.Pago;
import com.drommepc.modelo.Producto;
import com.drommepc.modeloDAO.ClienteDAO;
import com.drommepc.modeloDAO.ComprasDAO;
import com.drommepc.modeloDAO.ProductoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controlador extends HttpServlet {

    Pago pago = new Pago();
    Cliente cl = new Cliente();
    ClienteDAO cldao = new ClienteDAO();
    ComprasDAO cdao = new ComprasDAO();
    ProductoDAO pdao = new ProductoDAO();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList<>();

    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    int subtotal = 0;
    int totalPagar = 0;
    int cantidad = 1;
    int idp;
    Carrito car = new Carrito();
    int idcompra;
    int idpago;
    int montopagar;
    int idProducto;
    String logueo = "Iniciar Session";
    String correo = "Iniciar Session";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("logueo", logueo);
        session.setAttribute("correo", correo);
        String accion = request.getParameter("accion");
        productos = pdao.listar();
        switch (accion) {
            case "Comprar":
                totalPagar = 0;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                item = item + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * p.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "VerProducto":
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.obtenerProductoPorId(idp);

                if (p != null) {
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("ProductAlone.jsp").forward(request, response);
                } else {
                    // Manejo para producto no encontrado o error
                    request.getRequestDispatcher("paginaDeError.jsp").forward(request, response);
                }
                break;

            case "AgregarCarrito":
                int pos = 0;
                cantidad = 1;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                if (listaCarrito.size() > 0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdProducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdProducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                        int subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubTotal(subtotal);
                    } else {
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombres());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        listaCarrito.add(car);
                    }
                } else {
                    item = item + 1;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(p.getId());
                    car.setNombres(p.getNombres());
                    car.setDescripcion(p.getDescripcion());
                    car.setPrecioCompra(p.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubTotal(cantidad * p.getPrecio());
                    listaCarrito.add(car);
                }
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            case "Delete":
                idProducto = Integer.parseInt(request.getParameter("id"));
                if (listaCarrito != null) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (listaCarrito.get(i).getIdProducto() == idProducto) {
                            listaCarrito.remove(i);
                            break;
                        }
                    }
                    response.sendRedirect("Controlador?accion=Carrito");
                }
                break;
            case "ActualizarCantidad":
                idProducto = Integer.parseInt(request.getParameter("id"));
                int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));

                for (Carrito carrito : listaCarrito) {
                    if (carrito.getIdProducto() == idProducto) {
                        carrito.setCantidad(nuevaCantidad);
                        carrito.setSubTotal(nuevaCantidad * carrito.getPrecioCompra());
                        break;
                    }
                }
                // Redireccionar de vuelta a la página del carrito
                response.sendRedirect("Controlador?accion=Carrito");
                break;

            case "Carrito":
                totalPagar = 0;
                item = 0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                    listaCarrito.get(i).setItem(item + i + 1);
                }
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);

                break;
            case "Validar":
                String email = request.getParameter("txtemail");
                String pass = request.getParameter("txtpassword");
                cl = cldao.Validar(email, pass);
                if (cl.getId() != 0) {
                    logueo = cl.getNombres();
                    correo = cl.getEmail();
                }
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            case "Registrar":
                String nom = request.getParameter("txtnom");
                String rut = request.getParameter("txtrut");
                String em = request.getParameter("txtemail");
                String pas = request.getParameter("txtpassword");
                String dir = request.getParameter("txtdire");
                cl.setNombres(nom);
                cl.setRut(rut);
                cl.setEmail(em);
                cl.setPassword(pas);
                cl.setDireccion(dir);
                cldao.AgregarCliente(cl);
                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                break;
            case "Nuevo":
                listaCarrito = new ArrayList();
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
           /* case "RealizarPago":
                montopagar = totalPagar;
                if (cl.getId() != 0 && montopagar > 0) {
                    cdao.(montopagar);
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                } else {
                    montopagar = 0;
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;*/
            case "GenerarCompra":
                idpago = cdao.IdPago();
                if (cl.getId() != 0 && listaCarrito.size() != 0 && montopagar > 0) {
                    if (totalPagar > 0.0) {
                        Compras co = new Compras();
                        co.setIdCliente(cl.getId());
                        co.setIdPago(idpago);
                        co.setFecha("26-11-2023");
                        co.setMonto(totalPagar);
                       
                        co.setEstado("Cancelado - En Proceso de Envio");
                        cdao.guardarCompra(co);
                        montopagar = 0;

                        idcompra = cdao.IdCompra();
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            DetalleCompras dc = new DetalleCompras();
                            dc.setIdcompra(idcompra);
                            dc.setIdproducto(listaCarrito.get(i).getIdProducto());
                            dc.setCantidad(listaCarrito.get(i).getCantidad());
                            dc.setPrecioCompra(listaCarrito.get(i).getPrecioCompra());
                            cdao.guardarDetalleCompra(dc);
                        }
                        listaCarrito = new ArrayList<>();
                        request.getRequestDispatcher("compras.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;
            case "Salir":
                listaCarrito = new ArrayList();
                cl = new Cliente();
                session.invalidate();
                logueo = "Iniciar Sesion";
                correo = "Iniciar Sesion";
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            default:
                request.setAttribute("cont", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
