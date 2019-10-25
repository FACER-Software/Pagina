<%-- 
    Document   : viajeEnCurso
    Created on : May 12, 2019, 5:41:41 PM
    Author     : Armando Castillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Viaje en Curso</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
    <link rel="icon" href="../img/leaf.png">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/viajeEnCurso.css">

</head>

<body>
    <%@page import="java.sql.*, java.io.*" %>
    <%
            Connection con = null;
            Statement stm = null;
            ResultSet resul = null;
            HttpSession sesion = request.getSession();
            
            
                         
            int id = (Integer)sesion.getAttribute("id");
            double precio = new Double(sesion.getAttribute("precio").toString());
            precio = (double)Math.round(precio * 100d) / 100d;
            String precioString = Double.toString(precio);
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                stm = con.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            if(request.getParameter("termViajeSin") != null){
                    float calif = Float.parseFloat(request.getParameter("star"));
                
                    String queryString = "INSERT into Viajes(puntoPartida, puntoDestino, costo, fechaViaje) values(?,?,?,?)";
                    PreparedStatement pstatement = con.prepareStatement(queryString);
                    pstatement.setString(1, "tu ubicacion");
                    pstatement.setString(2, "tu llegada");
                    pstatement.setString(3, precioString);
                    pstatement.setString(4, "13/05/19");
                    pstatement.executeUpdate();
                    stm = con.createStatement();
                    resul = stm.executeQuery("SELECT *  from Viajes where idViaje = (select count(puntoPartida) from Viajes); ");
                    if(resul.next()){
                        int idViaje = resul.getInt("idViaje");
                        String queryString2 = "INSERT into relUsuViajes(idUsuario, idViaje) values(?,?)";
                        pstatement = con.prepareStatement(queryString2);
                        pstatement.setInt(1, id);
                        pstatement.setInt(2, idViaje);
                        pstatement.executeUpdate();
                    }
                        stm.executeUpdate("UPDATE Usuario INNER JOIN relusuviajes ON Usuario.idUsuario = relusuviajes.idUsuario SET califUsuario = ((SELECT (califUsuario*(SELECT count(idRelUsuViajes) where relusuviajes.idUsuario = '"+id+"'))+"+calif+"WHERE usuario.idUsuario ='"+id+"') / ((SELECT count(idRelUsuViajes) where relusuviajes.idUsuario = '"+id+"')+1)) where usuario.idUsuario = '"+id+"';");
                        resul = stm.executeQuery("SELECT * FROM Usuario where idUsuario='" + id + "'");
                        if(resul.next()){
                            calif = resul.getFloat("califUsuario");
                            sesion.setAttribute("calificacion", calif);
                        response.sendRedirect("./principal.jsp");
                    }
            }
            

            if(request.getParameter("terminarViajeInsignias") != null){
                float calif = Float.parseFloat(request.getParameter("star"));
                
                    String queryString = "INSERT into Viajes(puntoPartida, puntoDestino, costo, fechaViaje) values(?,?,?,?)";
                    PreparedStatement pstatement = con.prepareStatement(queryString);
                    pstatement.setString(1, "tu ubicacion");
                    pstatement.setString(2, "tu llegada");
                    pstatement.setString(3, precioString);
                    pstatement.setString(4, "13/05/19");
                    pstatement.executeUpdate();
                    stm = con.createStatement();
                    resul = stm.executeQuery("SELECT *  from Viajes where idViaje = (select count(puntoPartida) from Viajes); ");
                    if(resul.next()){
                        int idViaje = resul.getInt("idViaje");
                        String queryString2 = "INSERT into relUsuViajes(idUsuario, idViaje) values(?,?)";
                        pstatement = con.prepareStatement(queryString2);
                        pstatement.setInt(1, id);
                        pstatement.setInt(2, idViaje);
                        pstatement.executeUpdate();
                    }
                    
                    
                    
                        stm.executeUpdate("UPDATE Usuario INNER JOIN relusuviajes ON Usuario.idUsuario = relusuviajes.idUsuario SET califUsuario = ((SELECT (califUsuario*(SELECT count(idRelUsuViajes) where relusuviajes.idUsuario = '"+id+"'))+"+calif+"WHERE usuario.idUsuario ='"+id+"') / ((SELECT count(idRelUsuViajes) where relusuviajes.idUsuario = '"+id+"')+1)) where usuario.idUsuario = '"+id+"';");
                        resul = stm.executeQuery("SELECT * FROM Usuario where idUsuario='" + id + "'");
                        if(resul.next()){
                            calif = resul.getFloat("califUsuario");
                            sesion.setAttribute("calificacion", calif);
                        response.sendRedirect("./principal.jsp");
                    }
            }
        %>
    <nav class="navbar navbar-expand-lg bg-verde fixed-top text-uppercase" id="mainNav">
        <div class="container ">
            <div class="tituloIndex">
                <img class="logotipoWhite" src="../img/leafWhite.svg" width="40px" height="40px"
                    style="padding-bottom: 10px;" />
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
    <!--Mapa-->
    <div class="wrapper">
        <div class="container contenedor">
            <div class="row">
                <div class="col-md-9">
                    <div class="map" id="map"></div>
                </div>
                <div class="col-md-3 botones d-flex">
                    <div class="a">
                        <button id="mandar_cambio" type="button" form="registrarse" class="btn btnCancelar">Cancelar
                            Viaje</button>
                        <abbr data-toggle="cancelar-viaje" data-placement="right" title="Se cobrará una tarifa">Más
                            Información</abbr>
                    </div>
                    <div class="b">

                        <button id="mandar_cambio" type="button" form="registrarse" class="btn btnTerminar"
                            data-toggle="modal" data-target="#calificaciones">Terminar Viaje</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Mapa-->

    <!--Modal calificaciones-->
    <div class="modal" tabindex="-1" role="dialog" id="calificaciones">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center text-uppercase texto-verde">Viaje Terminado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <form action="./viajeEnCurso.jsp" method="POST">
                            <div class="row my-4 text-center">
                                <div class="col-md-7 offset-md-1 my-2">
                                    <p class="costoF">Costo final del viaje:</p>
                                </div>
                                <div class="col-md-1 my-2">
                                    <p class="costoF" id="precio">$<%
                                        out.print(precio);
                                            %></p>
                                </div>
                            </div>
                            <h6 class="text-center my-4" id="laCalif">Calificación seleccionada:</h6>
                            <div class="row labels">
                                <label class="star1">
                                    <input type="radio" name="star" id="star1" value="1">
                                    <img src="../img/star1.svg">
                                </label>

                                <label class="star2">
                                    <input type="radio" name="star" id="star2" value="2">
                                    <img src="../img/star2.svg">
                                </label>
                                <label class="star3">
                                    <input type="radio" name="star" id="star3" value="3">
                                    <img src="../img/star3.svg">
                                </label>

                                <label class="star4">
                                    <input type="radio" name="star" id="star4" value="4">
                                    <img src="../img/star4.svg">
                                </label>

                                <label class="star5">
                                    <input type="radio" name="star" id="star5" value="5" checked>
                                    <img src="../img/star5.svg">
                                </label>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" name="termViajeSin" value="TerminarViaje">
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#insignias">Asignar
                        Insignias</button>
                </div>
                

            </div>
        </div>
    </div>
    <!--Modal calificaciones-->

    <!--Modal Insignias-->
    <div class="modal" tabindex="-1" role="dialog" id="insignias">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center text-uppercase texto-verde">Insignias</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                    <div class="modal-body">
                        <div class="container">
                            <h6 class="text-center my-4">Selecciona una insignia</h6>
                            <div class="row my-4 pt-4">
                                <div class="col-lg-4 label1">
                                    <input id="radio1" type="radio" class="text-center" name="insignia"/>
                                    <label for="radio1" class="text-center m-auto"></label>
                                    <p class="text-center">Auto limpio</p>
                                </div>
                                <div class="col-lg-4 label2">
                                    <input id="radio2" type="radio" class="text-center"  name="insignia"/>
                                    <label for="radio2" class="text-center m-auto"></label>
                                    <p class="text-center">Rapidez</p>
                                </div>
                                <div class="col-lg-4 label3">
                                    <input id="radio3" type="radio" class="text-center" name="insignia"/>
                                    <label for="radio3" class="text-center m-auto"></label>
                                    <p class="text-center">Buena Platica</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer my-4">
                        <input type="submit" class="btn btn-success" value="Terminar Viaje"
                            name="terminarViajeInsignias" />
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Regresar</button>
                </form>
            </div>
        </div>
    </div>
    </div>
    <!--Modal Insignias-->


    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVnllvE7hWvfpjWjRw2S8KkN-KRpsX4EY&" async
        defer></script>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <!--Scripts-->
    <script src="./viajeEnCurso.js"></script>
</body>

</html>