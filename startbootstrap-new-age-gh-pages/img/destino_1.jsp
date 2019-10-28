<%-- 
    Document   : destino
    Created on : May 5, 2019, 10:08:46 PM
    Author     : Armando Castillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EcoWays</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template -->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
              type="text/css">
        <!-- Plugin CSS -->
        <link href="../vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template -->
        <link href="../css/freelancer.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/stylePrincipal.css">
        <link rel="icon" href="../img/hoja.png">
        <link rel="stylesheet" href="../css/crudAdmin.css">
        <link rel="stylesheet" href="../css/usuarioPrincipal.css">
        <link rel="stylesheet" href="../css/fuentes.css">
    </head>
    <body>
        <!--Header-->
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
            <div class="container">
                <div class="tituloIndex" style="width: 250px;">
                    <img class="logotipoWhite" src="../img/leafWhite.svg" width="40px" height="40px"
                         style="padding-bottom: 10px;" />
                    <a class="navbar-brand js-scroll-trigger" href="../index.html">EcoWays</a>
                </div>
                <a href="./perfil.html" class="headerPerfil">
                    <div class="collapse navbar-collapse text-white d-flex justify-content-end align-items-center" id="navbarResponsive">
                        <h4><%= request.getAttribute("nombre")%></h4>
                    </div>
                    <div class="menuUsuario">
                        <img src="../img/user.svg" alt="Icono de Usuario">
                    </div>
                </a>
            </div>
        </nav>

        <!--Opciones de Navegación-->
        <div class="container containerPrincipal">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h5>Haz click en la acción que desees realizar</h5>
                </div>
            </div>
        </div>

        <!--Opciones-->
        <div class="wrapperOpciones">
            <div class="opcion1">
                <a href="./perfil.html">
                    <button class="boton" id="boton">
                        <img src="../img/user.svg" alt="Perfil">
                        <h5>
                            Perfil de Usuario
                        </h5>
                    </button>
                </a>
            </div>
            <div class="opcion2">
                <a href="./menurutas.html">
                    <button class="boton" id="boton">
                        <img src="../img/gps-route.svg" alt="Perfil">
                        <h5>
                            Iniciar Viaje
                        </h5>
                    </button>
                </a>
            </div>
            <div class="opcion3">
                <a href="./pagos.html">
                    <button class="boton" id="boton">
                        <img src="../img/payment.svg" alt="Perfil">
                        <h5>
                            Métodos de Pago
                        </h5>
                    </button>
                </a>
            </div>
            <div class="opcion4">
                <a href="./historial.html">
                    <button class="boton" id="boton">
                        <img src="../img/clipboard.svg" alt="Perfil">
                        <h5>
                            Historial
                        </h5>
                    </button>
                </a>
            </div>
            <div class="opcion5">
                <a href="./calificaciones.html">
                    <button class="boton" id="boton">
                        <img src="../img/calif.svg" alt="Perfil">
                        <h5>
                            Calificación  e Insignias
                        </h5>
                    </button>
                </a>
            </div>
        </div>

        <!-- footer -->
        <footer class="page-footer font-small blue">
            <div class="copyright py-4 text-center text-white">
                <div class="container">
                    <small>Copyright &copy; AjoloCoding 2019</small>
                </div>
            </div>
        </footer>
        <p>Me ha llegado <%= request.getAttribute("id")%></p>
        <p>Me ha llegado </p>
        <p>Me ha llegado <%= request.getAttribute("correo")%></p>

    </body>
</html>
