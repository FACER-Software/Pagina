<%-- 
    Document   : rutas
    Created on : May 10, 2019, 4:03:20 PM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Plugin CSS -->
        <link href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/freelancer.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylePrincipal.css">
        <link rel="icon" href="${pageContext.request.contextPath}/img/leaf.png">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleRegistro.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleRutas.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/scroll.css">


    </head>

    <body>
        <%@page import="java.sql.*, java.io.*" %>
        <%
                Connection con = null;
                Statement stm = null;
                ResultSet resul = null;
                HttpSession sesion = request.getSession();
                double precio = 0.0;
                double kilometros = 0.0;
                
                
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                    stm = con.createStatement();
                } catch (SQLException error) {
                    out.println(error.toString());
                }
                
                if(request.getParameter("iniciarViajeRuta") != null){
                   
                    double kilo = new Double(request.getParameter("kilometros").toString());
                    precio = (4 * kilo) + 15.5;
                    sesion.setAttribute("precio",precio);
                    response.sendRedirect("./conductorEncontrado.jsp");
                }
                

        %>
        <nav class="navbar navbar-expand-lg bg-verde fixed-top text-uppercase" id="mainNav">
            <div class="container">
                <div class="tituloIndex">
                    <img class="logotipoWhite" src="../img/leafWhite.svg" width="40px" height="40px" style="padding-bottom: 10px;" />
                    <a class="navbar-brand js-scroll-trigger" href="./principal.jsp">EcoWays</a>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end ml-auto" id="navbarResponsive">
                    <a class="btn boton-regresar btn-outline-light" href="./menurutas.html">
                        Regresar
                    </a>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="contenedorRutas">
            <form name="formulario" action="./rutas.jsp" method="post">
                <h4 class="d-flex justify-content-center">Selecciona un Punto de Destino</h4>
                <div class="destino">
                    <select class="destinoCombo" id="puntoF" required>
                        <option value="">
                            Seleccione alguna opción
                        </option>
                        <option value="CECyT1">
                            CECyT 1 "Gonzalo Vázquez Vela"
                        </option>
                        <option value="CECyT2">
                            CECyT 2 "Miguel Bernard Perales"
                        </option>
                        <option value="CECyT3">
                            CECyT 3 "Estanislao"
                        </option>
                        <option value="CECyT4">
                            CECyT 4 "Lázaro Cárdenas"
                        </option>
                        <option value="CECyT5">
                            CECyT 5 "Benito Juárez"
                        </option>
                        <option value="CECyT6">
                            CECyT 6 "Miguel Othón de Mendizabal"
                        </option>
                        <option value="CECyT7">
                            CECYT 7 "Cuauhtémoc"
                        </option>
                        <option value="CECyT8">
                            CECyT 8 "Naarcisso Bassols"
                        </option>
                        <option value="CECyT9">
                            CECyT 9 "Juan de Dios Batiz"
                        </option>
                        <option value="CECyT10">
                            CECyT 10 "Carlos Vallejo Márquez"
                        </option>
                        <option value="CECyT11">
                            CECyT 11 "La 11"
                        </option>
                        <option value="CECyT12">
                            CECyT 12 "José María Morelos"
                        </option>
                        <option value="CECyT13">
                            CECyT 13 "Ricardo Flores Magón"
                        </option>
                        <option value="CECyT14">
                            CECyT 14 "Luis Enrique Erro Soler"
                        </option>
                    </select>
                </div>

                <div class="mapa">
                    <div class="container-fluid contenedorMapa">
                        <div class="row">
                            <div class="botones col-md-4 col-xs-10 offset-xs-1">
                                <input type="text" class="kilometros" id="kilometros" name="kilometros">
                                <input type="text" class="tiempo" id="tiempo" name="tiempo">
                                <input type="submit" value="Iniciar viaje" name="iniciarViajeRuta" class="btn btn-primary text-center"
                                       id="iniciarViaje">

                                <a href="" class="botonMapa">
                                    <input type="button" value="Guardar destino" name="destino" class="btn btn-primary">
                                </a>
                                <a href="./menurutas.html" class="botonMapa">
                                    <input type="button" value="Consultar transporte público" name="ruta" class="btn btn-primary">
                                </a>
                            </div>
                            <div class="col-md-8 col-xs-12 ">
                                <div class="map" id="map"></div>
                                <div class="output" id="output"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>



        <script src="../js/rutas.js">
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVnllvE7hWvfpjWjRw2S8KkN-KRpsX4EY&callback=initMap"
        async defer></script>

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    </body>

</html>