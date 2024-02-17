<%-- 
    Document   : error
    Created on : 3 dic. 2022, 03:37:00
    Author     : Sergio Trinidad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"> <!<!-- iconos -->


        <title>Error</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="col-sm-4">
                <div class="alert alert-danger" role="alert">
                    <h4>Error al Generar!</h4>
                    <hr>
                    <a href="Controlador?accion=home" class="btn btn-warning">
                        Volver
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
