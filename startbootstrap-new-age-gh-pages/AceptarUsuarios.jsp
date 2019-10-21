<%-- 
    Document   : AceptarUsuarios
    Created on : 6/05/2019, 02:24:34 PM
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html style="width:100%; height:100%;">

    <head>
        <title>Gestion de Usuarios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template -->
        <link href="css/freelancer.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/stylePrincipal.css">
        <link rel="icon" href="img/leaf.png">

        <link rel="stylesheet" href="./css/crudAdmin.css">
        <link rel="stylesheet" href="./css/fuentes.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/scroll.css">

    </head>

    <body style="width:100%; height:100%;" id="page-top">
        <%@page import="java.sql.*, java.io.*" %>
        <%
            Connection con = null;
            Statement state = null;
            ResultSet encontrados = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                state = con.createStatement();
            } catch (SQLException e) {
                out.print("<center><h1>" + e + "</h1></center>");
                out.print("<center><h1> Error en la conexión </h1></center>");
            }
        %>
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
            <div class="container">
                <div class="tituloIndex" style="width: 250px;">
                    <img class="logotipoWhite" src="./img/leafWhite.svg" width="40px" height="40px" style="padding-bottom: 10px;" />
                    <a class="navbar-brand js-scroll-trigger" href="index.html">EcoWays</a>
                </div>

                <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button"
                        data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                        aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto text-center">
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-2 mt-1 mr-2 px-0 px-lg-4 rounded js-scroll-trigger" href="ConsultaUsuarios.jsp">Consulta
                                de Usuarios</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <br><br><br><br><br><br><br>
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Estadisticas</h1>
            </div>

            <!-- Content Row -->
            <div class="row">

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Registros</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%
                                            try {
                                                encontrados = state.executeQuery("select max(idUsuario) from usuario");
                                                encontrados.next();
                                                int id = encontrados.getInt("max(idUsuario)");
                                                out.print(id);
                                            } catch (SQLException e) {
                                                out.print("<center><h1>" + e + "</h1></center>");
                                                out.print("<center><h1> Error en la consulta </h1></center>");
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <img src="img/paloma.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">¡Reportes!</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <% try {
                                                encontrados = state.executeQuery("select max(idOpinion) from Opiniones");
                                                encontrados.next();
                                                int id = encontrados.getInt("max(idOpinion)");
                                                out.print(id);
                                            } catch (SQLException e) {
                                                out.print("<center><h1>" + e + "</h1></center>");
                                                out.print("<center><h1> Error en la consulta </h1></center>");
                                            } %>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <a href="ConsultaMensajes.jsp"> <img src="img/warning.png"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Conductores</div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                <%                                                    try {
                                                        encontrados = state.executeQuery("select max(idCondDat) from condDat");
                                                        encontrados.next();
                                                        int id = encontrados.getInt("max(idCondDat)");
                                                        out.print(id);
                                                        out.print("<div style='visibility: hidden;'>");
                                                        out.print("<input type='text' value='" + id + "' id='NumCond'>");
                                                        out.print("</div>");
                                                    } catch (SQLException e) {
                                                        out.print("<center><h1>" + e + "</h1></center>");
                                                        out.print("<center><h1> Error en la consulta </h1></center>");
                                                    }
                                                %>
                                            </div>
                                        </div>
                                        <div class="col">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <img src="./img/chauffeur.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Politecnicos</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%
                                            try {
                                                encontrados = state.executeQuery("select max(idPoliDat) from poliDat");
                                                encontrados.next();
                                                int id = encontrados.getInt("max(idPoliDat)");
                                                out.print(id);
                                                out.print("<div style='visibility: hidden;'>");
                                                out.print("<input type='text' value='" + id + "' id='NumPoli'>");
                                                out.print("</div>");
                                            } catch (SQLException e) {
                                                out.print("<center><h1>" + e + "</h1></center>");
                                                out.print("<center><h1> Error en la consulta </h1></center>");
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <img src="img/Poli.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br><br><br><br><br>

            <!-- Content Row -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Vista General</h1>
            </div>

            <div class="row">

                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Reportes Mensuales</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-bar">
                                <canvas id="myBarChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Usuarios</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChart"></canvas>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fas fa-circle text-primary"></i> Conductor
                                </span>
                                <span class="mr-2">
                                    <i class="fas fa-circle text-info"></i> Politecnico 
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="visibility: hidden;">

                </div>
            </div>
            <br><br><br><br>
        </div>

        <%
            try {
                out.print("<div style='visibility: hidden;>");
                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-01-%'");
                encontrados.next();
                int Enero = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Enero + "' id='Enero'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-02-%'");
                encontrados.next();
                int Febrero = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Febrero + "' id='Febrero'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-03-%'");
                encontrados.next();
                int Marzo = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Marzo + "' id='Marzo'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-04-%'");
                encontrados.next();
                int Abril = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Abril + "' id='Abril'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-05-%'");
                encontrados.next();
                int Mayo = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Mayo + "' id='Mayo'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-06-%'");
                encontrados.next();
                int Junio = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Junio + "' id='Junio'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-07-%'");
                encontrados.next();
                int Julio = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Julio + "' id='Julio'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-08-%'");
                encontrados.next();
                int Agosto = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Agosto + "' id='Agosto'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-09-%'");
                encontrados.next();
                int Septiembre = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Septiembre + "' id='Septiembre'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-10-%'");
                encontrados.next();
                int Octubre = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Octubre + "' id='Octubre'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-11-%'");
                encontrados.next();
                int Noviembre = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Noviembre + "' id='Noviembre'>");
                out.print("</div>");

                encontrados = state.executeQuery("select count(*) from opiniones where fecha like '20%-12-%'");
                encontrados.next();
                int Diciembre = encontrados.getInt("count(*)");
                out.print("<div style='visibility: hidden;'>");
                out.print("<input type='text' value='" + Diciembre + "' id='Diciembre'>");
                out.print("</div>");
                out.print("</div>");
            } catch (SQLException e) {
                out.print("<center><h1>" + e + "</h1></center>");
                out.print("<center><h1> Error en la consulta </h1></center>");
            }
            encontrados.close();
            state.close();
            con.close();
        %>
        <footer class="page-footer font-small blue">
            <div class="copyright py-4 text-center text-white">
                <div class="container">
                    <small>Copyright &copy; AjoloCoding 2019</small>
                </div>
            </div>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
        <script src="js/demo/chart-bar-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
    </body>

</html>