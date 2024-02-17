<%-- 
    Document   : index
    Created on : 1 dic. 2022, 20:07:03
    Author     : Sergio Trinidad
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html lang="en">
        <head>
            <!-- Required meta tags -->
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"> <!<!-- iconos -->

            <link href="css/style.css" rel="stylesheet" type="text/css"/>
            <link rel="shortcut icon" href="peliIMG/hera.ico">
            <title>Refaccionaria Equipo 8</title>
        </head>
        <body id="index1">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <img src="peliIMG/sip.png" class="d-inline-block align-top"/>
                <a class="navbar-brand" href="Controlador?accion=home">Refaccionaria E8</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link bi bi-house-fill" href="Controlador?accion=home">  Home   <span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Controlador?accion=Carrito"><i class="bi bi-cart-dash-fill" style="color: white" >
                                    ( <label style="color: white">${contador}</label> )</i>  Carrito de Compras</a>
                        </li>
                    </ul>
                   
                </div>
            </li>
        </ul>

    </div>
</nav>

            <CENTER><h2>Inventario Refaccionaria</h2></center>
<div class="container mt-4">
    <div class="row">

        <c:forEach var="p" items="${productos}">
            <div class="col-sm-4">
                <div class="card border-warning">
                    <div class="card-header">
                        <label id="tablat"> ${p.getNombres()}</label>
                    </div>
                    <div class="card-body">
                      
                        <center><img src="ControladorIMG?id=${p.getId()}" width="200" height="300"  /></center>
                     
                        <i id="tablal">$  ${p.getPrecio()}</i>
                    </div>
                    <div class="card-footer text-center">
                        <label id="tablad"> ${p.getDescripcion()}</label>
                                <div>
                                    <label id="tablad"> Cantidad en Almacen:</label>
                                    <label id="tablad"> ${p.getStock()}</label>
                                </div>
                        <div>
                            <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn-outline-info bi bi-cart4"> Agregar a Carrito</a>
                            <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-warning bi bi-wrench-adjustable"> Comprar</a>
                        </div>


                    </div>

                </div>


            </div>
        </c:forEach>
    </div>
</div>




<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
-->
</body>
</html>