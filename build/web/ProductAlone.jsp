<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>

    <body style="background: #ffb8f1;">

        <nav class="navbar navbar-expand-lg navbar-black bg-black">
            <div class="container-fluid" style="align-items: center; padding: 20px;">
                <img class="logo2" src="Fotos/Logo.png" width="300" height="100"
                     style="border-radius: 80%; border: 5px solid white; margin: 0 auto">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                        aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 " style="align-items: center; margin: 0 auto; ">
                        <li class="nav-item">
                            <a href="index.html"><button type="button" class="btn btn-secondary"
                                                         style="color: white; background-color: #310027; margin: 15px;">Inicio</button></a>
                        </li>
                        <li class="nav-item">
                            <a href="productos.html"><button type="button" class="btn btn-secondary"
                                                             style="color: white; background-color: #310027;  margin: 15px;">Producto</button></a>
                        </li>
                        <li class="nav-item">
                            <a href="carrito.html"><button class="btn btn-secondary"
                                                           style="color: white; background-color: #310027;  margin: 15px;">Carrito</button></a>
                        </li>
                        <li class="nav-item">
                            <a href="login.html"><button class="btn btn-secondary"
                                                         style="color: white; background-color: #310027;  margin: 15px;">Login</button></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <br>
        <section style="padding: 50px">
            <!-- Imagen del producto -->
            <table align="center">
                <tr>
                    <td>
                        <div class="card" style="background: none; border-color: #ffb8f1;">
                            <!-- Accediendo a la ruta de la imagen del producto -->
                            <img src="<c:out value='${p.foto}'/>" class="card-img" alt="Producto"/>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Nombre del producto -->
            <div class="card" style="padding: 50px; align-items: center; background: none; border-color: #ffb8f1;">
                <h1>
                    <!-- Accediendo al nombre del producto -->
                    <c:out value='${p.nombres}' />
                </h1>
            </div>

            <!-- Descripción del producto -->
            <div class="card" style="padding: 50px; background: none; border: solid;">
                <h3>
                    Descripcion
                </h3>
                <!-- Accediendo a la descripción del producto -->
                <p><c:out value='${p.descripcion}' /></p>
            </div>

            <!-- Precio del producto -->
            <div class="card" style="padding: 50px; background: none; border-color: #ffb8f1;">
                <h3>
                    Valor
                </h3>
                <!-- Accediendo al precio del producto -->
                <p><c:out value='${p.precio}' /></p>
            </div>

            <!-- Botones para agregar al carrito o comprar -->
            <div class="button" style="padding: 20px;">
                <button type="button" class="btn  btn-lg" style="margin-right: 30px; background: #310027; color: #fff; border-color: #fff;">Agregar al carro</button>
                <button type="button" class="btn  btn-lg" style=" background: #310027; color: #fff; border-color: #fff;">Comprar ahora</button>
            </div>

            <!-- Stock del producto -->
            <div class="card" style="padding: 50px; background: none; border-color: #ffb8f1;">
                <p>
                    Stock
                </p>
                <!-- Accediendo al stock del producto -->
                <p><c:out value='${p.stock}' /></p>
            </div>

        </section>


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
