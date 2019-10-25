<%-- 
    Document   : historial
    Created on : May 13, 2019, 11:11:17 PM
    Author     : Armando Castillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    <link rel="stylesheet" href="../css/historial.css">
    <link rel="stylesheet" href="../css/fuentes.css">
    <title>Historial</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.io.*" %>
    <%
            Connection con = null;
            Statement stm = null;
            ResultSet resul = null;
            HttpSession sesion = request.getSession();
            int id = (Integer)sesion.getAttribute("id");  
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                stm = con.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }
            try {
                resul = stm.executeQuery("SELECT * FROM Viajes AS V INNER JOIN relusuviajes AS R ON V.idViaje = R.idViaje WHERE idUsuario = '"+id+"' ORDER BY V.idViaje; ");
                if (resul.next()) {
                    int aux = 0;
                    String puntoPartida = resul.getString("puntoPartida");
                    String puntoDestino = resul.getString("puntoDestino");
                    String costo = resul.getString("costo");
                    String fecha = resul.getString("fechaViaje");
                   
                } 

                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
            
        %>
        <!--Header-->
    <nav class="navbar navbar-expand-lg bg-vino fixed-top text-uppercase" id="mainNav">
        <div class="container">
            <div class="tituloIndex">
                <img class="logotipoWhite" src="../img/leafWhite.svg" width="40px" height="40px"
                    style="padding-bottom: 10px;" />
                <a class="navbar-brand js-scroll-trigger" href="usuario/principal.jsp">EcoWays</a>
            </div>
            <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                <a class="btn btn-l mt-1 btn-outline-light" href="./perfil.jsp">
                    Regresar
                </a>
                </ul>
            </div>
        </div>
    </nav>

    <!--Reportes-->
    <div class="wrapperReportes">
        <div class="container">
            <div class="row">

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-md-12 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                </div>
                                <div class="col-auto">
                                    <img src="img/micros1.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-md-12 mb-4">
                    <div class="card border-left-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Viaje 3
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                                </div>
                                <div class="col-auto">
                                    <img src="img/warning.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-md-12 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Viaje 2
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">99</div>
                                        </div>
                                        <div class="col">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <img src="./img/pape.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="col-md-12 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Viaje 1
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                </div>
                                <div class="col-auto">
                                    <img src="img/matraz.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
