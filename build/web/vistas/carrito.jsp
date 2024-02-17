<%-- 
    Document   : carrito
    Created on : 1 dic. 2022, 20:07:11
    Author     : Sergio Trinidad
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"> <!<!-- iconos -->

            <link href="css/style.css" rel="stylesheet" type="text/css"/>
            <link rel="shortcut icon" href="peliIMG/icono-title.ico">
            <title>PelisCorp -Un lugar para recordar el cine-</title>
        </head>
        <body id="carrito1">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                          <img src="peliIMG/peliscorp-icon.png" class="d-inline-block align-top"/>
                <a class="navbar-brand" href="Controlador?accion=home">PelisCorp</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link bi bi-house-fill" href="Controlador?accion=home">  Home   <span class="sr-only">(current)</span></a>
                        </li>
                    <li class="nav-item">
                        <a class="nav-link bi bi-shop" href="Controlador?accion=home" style="color: white" >  Seguir Comprando</a>
                    </li>
                    <!--    </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>

                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                            Iniciar Sesión
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                </ul>
-->
            </div>
        </nav>
        <div class="container mt-4">
            <h2>Carrito de Compras</h3>
            <br>  
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                <th>CANT</th>
                                <th>SUBTOTAL</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="car" items="${carritop}">
                                <tr>
                                    <td> ${ car.getItem() } </td>
                                    <td> ${ car.getNombres() }  </td>
                                    <td> ${ car.getDescripcion() }  
                                        <img src="ControladorIMG?id=${car.getIdProducto() }" width="100" height="100"/>
                                    </td>
                                    <td> ${ car.getPrecioCompra() }  </td>
                                    <td>
                                        <input type="hidden" id="idpro" value="${car.getIdProducto() }">
                                        <input type="number" id="Cantidad" value="${ car.getCantidad() }" class="form-control text-center" min="1" >
                                    </td>
                                    <td> ${ car.getSubTotal() }  </td>
                                    <td>
                                        <input type="hidden" id="idp" value="${car.getIdProducto() }">
                                        <a href="#" id="btnDelete" class="btn-danger btn-sm bi bi-trash3-fill"> </a>

                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>

                </div>
                <div class="col-sm-4">

                    <div class="card bg-dark">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                            <label id="labCarritoGC">Subtotal: </label>
                            <input type="text" value="$ ${totalpagar}0" readonly="" class="form-control">
                            <label id="labCarritoGC">Descuento: </label>
                            <input type="text" value="$ 0.00" readonly="" class="form-control">
                            <label id="labCarritoGC">Total a Pagar: </label>
                            <input type="text" value="$ ${totalpagar}0" readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="Controlador?accion=GenerarCompra" class="btn btn-danger btn-block bi bi-box2-fill" > Generar Compra</a>
                            <!--  a href="#" class="btn btn-info btn-block bi bi-cash-coin" > Realizar Pago</a>-->                         
                        </div>
                    </div>

                </div>

            </div>
        </div>





        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>


</body>
</html>
