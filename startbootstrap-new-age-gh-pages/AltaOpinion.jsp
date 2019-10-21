<%-- 
    Document   : AltaOpinion
    Created on : 13/05/2019, 12:09:16 PM
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template -->
        <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
              type="text/css">
        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template -->
        <link href="css/freelancer.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/CSS/bootstrap.min.css" />
        <link rel="stylesheet" href="css/historial.css">
        <link rel="icon" href="img/leaf.png">
        <link rel="stylesheet" href="css/perfil.css">
        <link rel="stylesheet" href="css/fuentes.css">
        <title>Historial</title>
    </head>

    <body>
        <!--Header-->
        <nav class="navbar navbar-expand-lg bg-azul-claro fixed-top text-uppercase" id="mainNav">
            <div class="container">
                <div class="tituloIndex">
                    <img class="logotipoWhite" src="img/leafWhite.svg" width="40px" height="40px"
                         style="padding-bottom: 10px;" />
                    <a class="navbar-brand js-scroll-trigger" href="/principal.html">EcoWays</a>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                    <a class="btn btn-l mt-1 btn-outline-light" href="login.html">
                        Ingresar
                    </a>
                    </ul>
                </div>
            </div>
        </nav>
        <%@page import="java.sql.*, java.io.*" %>
        <div class="wrapperPerfil mb-4">
            <div class="container">
                <%
                    //Variables
                   String Nombre = request.getParameter("Nombre");
                   String Correo = request.getParameter("correo");
                   String Cel = request.getParameter("tel");
                   String mensaje = request.getParameter("mensaje");
                   
                    //Fin Variables
                    Connection con = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                    } catch (SQLException e) {
                        out.print("<center><h1>" + e + "</h1></center>");
                        out.print("<center><h1> Error en la conexión </h1></center>");
                    }
                    try {
                           String querystring = "call spAltaOpinion(?,?,?,?)";
                           CallableStatement cs = con.prepareCall(querystring);
                           cs.setString(1, Nombre);
                           cs.setString(2, Correo);
                           cs.setString(3, Cel);
                           cs.setString(4, mensaje);
                           cs.executeUpdate();
                           out.print("<center><h1> Su opinion es <b>MUY</b> importantre para nosotros gracias por ayudar a EcoWays </h1></center>");
                           cs.close();
                           con.close();
                       } catch (Exception e) {
                           out.println("<center><h1>"+ e.getLocalizedMessage()+"</h1></center>");
                           out.println("<center><h1> Ocurrio Un Error</h1></center>");
                       }
                    
                %>
                <center><a class="btn btn-l mt-1 btn-outline-success" href="index.html">
                        Regresar
                    </a></center>
            </div>
        </div>
    </body>
</html>

