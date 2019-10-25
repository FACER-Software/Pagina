<%-- 
    Document   : conductorEncontrado
    Created on : May 13, 2019, 9:43:35 PM
    Author     : Armando Castillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Rutas</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
    <link rel="icon" href="${pageContext.request.contextPath}/img/leaf.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleRegistro.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleRutas.css">
</head>

<body>
    <%@page import="java.sql.*, java.io.*" %>
    <%
            Connection con = null;
            Statement stm = null;
            ResultSet resul = null;
            HttpSession sesion = request.getSession();
                     
            double precio = new Double(sesion.getAttribute("precio").toString());
            precio = (double)Math.round(precio * 100d) / 100d;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                stm = con.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            
        %>
    <nav class="navbar navbar-expand-lg bg-verde fixed-top text-uppercase" id="mainNav">
        <div class="container">
            <div class="tituloIndex">
                <img class="logotipoWhite" src="../img/leafWhite.svg" width="40px" height="40px"
                    style="padding-bottom: 10px;" />
                <a class="navbar-brand js-scroll-trigger" href="./principal.jsp">EcoWays</a>
            </div>
            <div class="collapse navbar-collapse d-flex justify-content-end ml-auto" id="navbarResponsive">
                <a class="btn boton-regresar btn-outline-light" href="./rutas.jsp">
                    Regresar
                </a>
                </ul>
            </div>
        </div>
    </nav>


    <div class="contenedorRutas">
        <h2 class="mb-4">Buscando Conductores</h2>
        <form method="post" action="./viajeEnCurso.jsp">
            <div class="container-fluid Encontrado">
                <div class="row d-flex align-items-start">
                    <div class="col-md-6 d-flex align-items-start">
                        <div id="map" class="map" style="height: 50vh !important"></div>
                    </div>
                    <div class="col-md-6 d-flex align-items-start imagenesEncontrado">
                        <img class="padd-4" src="../img/user.svg" alt="">
                        <h6 class="text-center">Información</h6>
                        <img class="padd-4" src="../img/user.svg" alt="">
                        <h6 class="text-center">Costo: $<%out.print(precio);%></h6>

                    </div>
                </div>
            </div>
            <input id="mandar_cambio" type="submit" class="btn btnAceptar" value="Aceptar Conductor"
                name="aceptarConductor">
            <button id="mandar_cambio" type="button" class="btn btnBuscar">Buscar
                otro Conductor</button>

        </form>

    </div>
</body>

</html>