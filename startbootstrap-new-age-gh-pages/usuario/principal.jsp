<%-- 
    Document   : destino
    Created on : May 5, 2019, 10:08:46 PM
    Author     : Armando Castillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>

<head>
    <title>EcoWays</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
        type="text/css">
    <!-- Plugin CSS -->
    <link href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
        type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/freelancer.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylePrincipal.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/hoja.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/crudAdmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usuarioPrincipal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colores.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/scss/fuentes.css">

    <!--Scripts-->

</head>

<body>
    <%@page import="java.sql.*, java.io.*" %>
    <%
                HttpSession sesion = request.getSession();
                String nombre = (String)sesion.getAttribute("nombre");
                float calif = ((Float)sesion.getAttribute("calificacion")).floatValue();
                
                if(request.getParameter("cerrarSesion") != null){
                    sesion.invalidate();
                    response.sendRedirect("../index.html");
                }

        %>
    <!--Header-->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
        <div class="container-fluid">
            <div class="tituloIndex" style="width: 350px;">
                <img class="logotipoWhite" src="${pageContext.request.contextPath}/img/leafWhite.svg" width="40px"
                    height="40px" style="padding-bottom: 10px;" />
                <a class="navbar-brand js-scroll-trigger" href="#" data-toggle="modal"
                        data-target="#cerrarSesion">EcoWays</a>
            </div>
            <div class="dropdown d-flex align-items-center">
                <button class="btn btn-light dropdown-toggle d-flex texto-azul" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <p id="nombreUsuario" class="m-0">
                        <%
                            out.print(nombre);
                            %>
                    </p>

                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item d-flex my-2 texto-azul" href="./perfil.jsp">Ver Perfil
                        <img src="../img/man-user.svg" alt="">
                    </a>
                    <a class="dropdown-item d-flex texto-azul" href="#" data-toggle="modal"
                        data-target="#cerrarSesion">Cerrar Sesión
                        <img src="../img/sign-out-option.svg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </nav>


    <!--Opciones-->
    <div class="container-fluid containerPrincipal">
        <div class="row loPrincipal">
            <div class="col-lg-8 seccion1">
                <div id="map" class="map"></div>
                <a href="./menurutas.html" class="linkViajar text-center">
                    <input type="button" class="btn btnViajar" value="Iniciar Viaje">
                </a>
            </div>
            <div class="col-lg-4 p-4 text-center">
                <h4>Mi calificación:<p id="calificacion">

                        <%
                    out.print(calif);
                    %>
                </p>
                </h4>
                <div class="row labels mb-4">
                    <label class="star">
                        <input type="radio" name="star1" id="star1" disabled>
                        <img src="../img/star.svg">
                    </label>

                    <label class="star">
                        <input type="radio" name="star2" id="star2" disabled>
                        <img src="../img/star.svg">
                    </label>
                    <label class="star">
                        <input type="radio" name="star3" id="star3" disabled>
                        <img src="../img/star.svg">
                    </label>

                    <label class="star">
                        <input type="radio" name="star4" id="star4" disabled>
                        <img src="../img/star.svg">
                    </label>

                    <label class="star">
                        <input type="radio" name="star5" id="star5" disabled>
                        <img src="../img/star.svg">
                    </label>
                </div>

                <h4 class="pt-4">Mis insignias</h4>
            </div>
        </div>
    </div>
    <!--Opciones-->



    <!-- Modal -->
    <div class="modal fade" id="cerrarSesion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title texto-azul" id="exampleModalLabel"><%
                        out.print(nombre);
                        %></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h6>

                        ¿Seguro que deseas cerrar sesión?
                    </h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn guardarBtn" data-dismiss="modal">Cancelar</button>
                    <form action="principal.jsp">

                        <input type="submit" class="btn cerrarBtn" name="cerrarSesion" value="Cerrar Sesion">
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <script src="../js/estrellas.js"></script>

    <script src="../js/mapaPrincipal.js">
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVnllvE7hWvfpjWjRw2S8KkN-KRpsX4EY&callback=initMap"
        async defer></script>
</body>

</html>