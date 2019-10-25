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
                    Connection con = null;
                    Statement stm = null;
                    ResultSet resul = null;
            
                    HttpSession sesion = request.getSession();
                    String nombre = (String)sesion.getAttribute("nombre");
                    int id = (Integer)sesion.getAttribute("id");

                
                     try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                            stm = con.createStatement();
                        } catch (SQLException error) {
                            out.println(error.toString());
                        }
                    if(request.getParameter("cerrarSesion") != null){
                        sesion.invalidate();
                        response.sendRedirect("../index.html");
                    }
                
            if(request.getParameter("activarSesion") != null){
                    try{
                        stm.executeUpdate("UPDATE Usuario SET estadoUsuario=1 where idUsuario='" + id + "'");
                        sesion.invalidate();
                        response.sendRedirect("../login.html");
                        }
                        catch(SQLException e){
                            System.out.println(e.toString());
                        }

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

                    <p id="nombreUsuario" class="m-0 texto-blanco">
                        <%
                                out.print(nombre);
                        %>
                    </p>

                </div>
            </div>
        </div>
    </nav>

    <!--Opciones-->
    <div class="container mt-4 pt-4">
        <div class="row mt-4 pt-4">
            <div class="col-sm-10 offset-sm-1 seccion1 text-center mt-4 pt-4">
                <h3 class="mt-4 pt-4">
                    Tu cuenta se encuentra inactiva en este momento
                    <br><br>
                    ¿Deseas activarla?
                </h3>
            </div>
        </div>

    </div>

    <div class="container mt-4">
        <div class="row ">
            <div class="col-sm-12 text-center">
                <form action="./principalInactivo.jsp" class="mt-4" method="POST">
                    <input type="submit" class="btn cerrarBtn" name="activarSesion" value="Activar Sesion">
                </form>
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