
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

    </head>
    <body style="background: #ffb8f1;">
        <nav class="navbar navbar-expand-lg navbar-black bg-black">
            <div class="container-fluid" style="align-items: center; padding: 20px;">
                <img src="Fotos/Logo.png" alt="Logo" width="300" height="100" style="border-radius: 80%; border: 5px solid white; margin: 0 auto">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                        aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 " style="align-items: center; margin: 0 auto; ">
                        <li class="nav-item">
                            <a class="btn btn-secondary" aria-current="page" href="Controlador?accion=home" style="color: white; background-color: #310027; margin: 15px;">Home</a>
                        </li> 
                        <li class="nav-item">
                            <a class="btn btn-secondary" href="Controlador?accion=Carrito" style="color: white; background-color: #310027;  margin: 15px;">Carrito(<label >${contador}</label>)</a>
                        <li class="nav-item">
                        <li class="nav-item dropdown">
                            <a class="btn btn-secondary" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; background-color: #310027;  margin: 15px; align-items: center">
                                Iniciar Sesion
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <h2 style="text-align: center; border: solid"><i class="bi bi-cart-check"></i> Tu Carrito de Compras</h2>
            <br>
            <div>
                <div class="col-sm-12">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">ITEM</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">NOMBRES</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">DESCRIPCION</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">IMAGEN</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">PRECIO</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">CANTIDAD</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">SUBTOTAL</th>
                                <th style="background: none; border: solid; border-width: 1px; text-align: center">ACCION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">${car.getItem()}</td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">${car.getNombres()}</td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">${car.getDescripcion()}</td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center"><img src="ControladorIMG?id=${car.getIdProducto()}" width="100" height="100"></td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">$${car.getPrecioCompra()}</td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">
                                        <form action="Controlador" method="POST" style="background: none; border: solid; border-width: 1px; width:100px">
                                            <input type="hidden" name="accion" value="ActualizarCantidad">
                                            <input type="hidden" name="id" value="${car.getIdProducto()}">
                                            <input type="number" min="1" max="10" name="cantidad" value="${car.getCantidad()}" class="form-control text-center" onchange="this.form.submit()" style="background: none; border: solid; border-width: 1px; width:100px">
                                        </form>
                                    </td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">${car.getSubTotal()}</td>
                                    <td style="background: none; border: solid; border-width: 1px; text-align: center">
                                        <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                        <a href="Controlador?accion=Delete&id=${car.getIdProducto()}" id="">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <div class="card" style="background: none; border: solid; border-width: 1px">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$ ${totalPagar}" readonly="" class="form-control">
                            <label>Descuento:</label>
                            <input type="text" value="$ 0" readonly="" class="form-control">
                            <label>Total Pagar:</label>
                            <input type="text" value="$ ${totalPagar}" readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="Controlador?accion=" class="btn btn-info btn-block">Realizar Pago</a>
                            <a href="Controlador?accion=GenerarCompra" class="btn btn-danger btn-block" style="border-width: 5px">Generar Compra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="navbar-black bg-dark" style="position:absolute; padding: 1 em 0 ;width: 100%;">
            <div style="align-items: center; background-color: black; padding: 20px;">
                <ul class="nav justify-content-center">
                    <li class="nav-item" style="margin-right: 75px;">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                style="width: 200px; color: white; background-color: #310027;">
                            Atencion al Cliente
                        </button>
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                             aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Preguntas Frecuentes</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>¿Cuanto se demoran en llevar los productos?</p>
                                        <p>Los productos se demoran entre 5 a 7 dias habiles, dependiendo de la distancia.</p>
                                        <p>¿Como se hacen los cambios?</p>
                                        <p>Los cambios se efectuan a traves del mismo medio en el cual llego, solo se efectuan cambios por NO
                                            FUNCIONAMIENTO del producto.</p>
                                        <p>¿Como se puede retirar el producto?</p>
                                        <p>Por el momento solo contamos con tienda online, esperamos proximamente contar con una tienda
                                            fisica.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="telefono" style=" display: flex; margin-left: 75px;">
                            <img src="Fotos/telefono1.jpg" height="35px" width="35px">
                            <p style="color: #fff;">+56956764090</p>
                        </div>
                    </li>
                </ul>
            </div>
        </footer>
    </body>
</html>
