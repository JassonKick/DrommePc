<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
                                <li><a class="dropdown-item" href="#"data-bs-toggle="modal" data-bs-target="#loginModal">Iniciar Sesión</a></li>
                                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Registrarse</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Controlador?accion=Salir">Cerrar sesión</a></li>
                                <li>
                                    <c:if test="${not empty logueo}">
                                        <p class="dropdown-item">Bienvenido, ${logueo}.</p>
                                    </c:if>
                                </li>
                                <li><a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section>
            <div id="carouselExampleCaptions" class="carousel slide" style="padding-top: 100px">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                            aria-label=">lide "></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                            aria-label="Slide "></button>
                </div>
                <div class="carousel-inner " style="height: 500px ; padding: 50px">
                    <div class="carousel-item active">
                        <img src='Fotos/AMD_Ryzen_7_5800X (2).png' class="roynded mx-auto d-flex" style="height: 298px ; width:298px">
                        <div class="corousel-caption d-2">
                            <h4 style="color:#000">PROXIMAMENTE</h4>
                            <p style="color:#000">AMD Ryzen 7 5800X <br /> 8 núcleos / 16 hilos <br /> [100-100000063WOF] </p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Fotos/Radeon (2).png" class="roynded mx-auto d-flex" style="height:300px; width:300px">
                        <div class="corousel-caption d-2">
                            <h4 style="color:#000">PROXIMAMENTE</h4>
                            <p style="color:#000">Yeston RX7900XT-20GD6 <br /> AMD Radeon RX 7900 XT</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Fotos/MSI TOMAHAWK (2).png" class="roynded mx-auto d-block" style="height: 300px ; width: 300px ">
                        <div class="corousel-caption d-2">
                            <h4 style="color: #000">PROXIMAMENTE</h4>
                            <p style="color: #000">MSI MAG B550 TOMAHAWK <br /> AMD B550 (AM4) <br /> AM4</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
            </div>
        </section>
        <br>
        <h1 style="text-align: center"> <i class="bi bi-handbag-fill"></i> Nuestros Productos</h1>
        <section class="contenedor" style="max-width: 1200px; padding: 10px; margin: auto; justify-content: space-between; contain: paint;">
            <div class="contenedor-items" style="margin-top: 30px; display: grid; grid-template-columns: repeat(auto-fit,minmax(300px,1fr)); grid-gap: 30px; grid-row-gap: 30px; width: 100%;">
                <c:forEach var="p" items="${productos}">
                    <div class="item" style="max-width: 200px; padding: 10px; margin: auto; border: 1px solid #000; border-radius: 10px; padding: 20px">
                        <h4  class="titulo-item" style="text-decoration: none; color: black; display: block; font-weight: bold; text-align: center; text-transform: uppercase;">${p.getNombres()}</h4>
                        <div class="card-body text-center">
                            <img src="ControladorIMG?id=${p.getId()}"  class="img-item" style="width:100%;">
                            <span class="precio-item" style="display: block; text-align: center; font-weight: bold; font-size: 22px;">
                                <i>$ ${p.getPrecio()}</i> </span>
                            <br>
                            <div>
                                <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="boton-item" style="display: block; margin: 10px auto; border:none; background: #000; color: #fff; padding: 5px 15px; border-radius: 5px; cursor: pointer; text-decoration: none">Agregar a Carrito</a>
                                <a href="Controlador?accion=Comprar&id=${p.getId()}" class="boton-item" style="display: block; margin: 10px auto; border:none; background: #000; color: #fff; padding: 5px 15px; border-radius: 5px; cursor: pointer; text-decoration: none">Comprar</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <!-- Modal de Inicio de Sesión -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Iniciar Sesión</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario de inicio de sesión -->
                        <form action="Controlador?accion=Validar" method="post">
                            <!-- Campos del formulario -->
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Correo Electrónico</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" name="txtemail" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="txtpassword">
                            </div>
                            <!-- Botón de inicio de sesión -->
                            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Registro -->
        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registerModalLabel">Registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario de Registro -->
                        <form action="Controlador?accion=Registrar" method="post">
                            <div class="mb-3">
                                <label for="txtnom" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="txtnom" name="txtnom" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtrut" class="form-label">Rut</label>
                                <input type="text" maxlength="10" class="form-control" id="txtrut" name="txtrut" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtdire" class="form-label">Dirección</label>
                                <input type="text" class="form-control" id="txtdire" name="txtdire" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtemail" class="form-label">Correo Electrónico</label>
                                <input type="email" class="form-control" id="txtemail" name="txtemail" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtpassword" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="txtpassword" name="txtpassword" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Registrarse</button>
                        </form>
                    </div>
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