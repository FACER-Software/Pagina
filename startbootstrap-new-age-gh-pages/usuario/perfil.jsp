<%-- 
    Document   : perfil
    Created on : May 11, 2019, 7:51:41 PM
    Author     : Armando Castillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
    <link rel="stylesheet" href="../css/perfil.css">
    <link rel="stylesheet" href="../css/colores.css">
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
                    String nombre = (String)sesion.getAttribute("nombre");
                    String edad = (String)sesion.getAttribute("edad");
                    String correo = (String)sesion.getAttribute("correo");
                    String password = (String)sesion.getAttribute("password");
                    String escuela = (String)sesion.getAttribute("escuela");
                    String fotoPoli = (String)sesion.getAttribute("fotoPoli");
         
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                        stm = con.createStatement();
                    } catch (SQLException error) {
                        out.println(error.toString());
                    }

                    if(request.getParameter("cambiarNombreBtn") != null){
                        try{
                        String nuevoNombre = request.getParameter("nuevoNombre");
                        stm.executeUpdate("UPDATE Usuario SET nombreUsuario='" + nuevoNombre + "'where idUsuario='" + id + "'");
                        resul = stm.executeQuery("SELECT * FROM Usuario where idUsuario='" + id + "'");
                        if(resul.next()){
                            nombre = resul.getString("nombreUsuario");
                            sesion.setAttribute("nombre", nombre);
                        }
                        response.sendRedirect("./perfil.jsp");
                        }
                        catch(SQLException e){
                            System.out.println(e.toString());
                        }

                    }
                
                    if(request.getParameter("cambiarEdadBtn") != null){
                        try{
                        String nuevaEdad = request.getParameter("nuevaEdad");
                        stm.executeUpdate("UPDATE Usuario SET edadUsuario='" + nuevaEdad + "'where idUsuario='" + id + "'");
                        resul = stm.executeQuery("SELECT * FROM Usuario where idUsuario='" + id + "'");
                        if(resul.next()){
                            edad = resul.getString("edadUsuario");
                            sesion.setAttribute("edad", edad);
                        }
                        response.sendRedirect("./perfil.jsp");
                        }
                        catch(SQLException e){
                            System.out.println(e.toString());
                        }

                    }
                    if(request.getParameter("cambiarEscuelaBtn") != null){
                        try{
                        String nuevaEscuela = request.getParameter("nuevaEscuela");
                        stm.executeUpdate("UPDATE poliDat SET nomEscuela='" + nuevaEscuela + "'where idUsuario='" + id + "'");
                        resul = stm.executeQuery("SELECT * FROM poliDat where idUsuario='" + id + "'");
                        if(resul.next()){
                            escuela = resul.getString("nomEscuela");
                            sesion.setAttribute("escuela", escuela);
                        }
                        response.sendRedirect("./perfil.jsp");
                        }
                        catch(SQLException e){
                            System.out.println(e.toString());
                        }

                    }
                    if(request.getParameter("cambiarCorreoBtn") != null){
                        try{
                        String nuevoCorreo = request.getParameter("nuevoCorreo");
                        stm.executeUpdate("UPDATE Usuario SET correoUsuario='" + nuevoCorreo + "'where idUsuario='" + id + "'");
                        resul = stm.executeQuery("SELECT * FROM Usuario where idUsuario='" + id + "'");
                        if(resul.next()){
                            correo = resul.getString("correoUsuario");
                            sesion.setAttribute("correo", correo);
                        }
                        response.sendRedirect("./perfil.jsp");
                        }
                        catch(SQLException e){
                            System.out.println(e.toString());
                        }

                    }
                    if(request.getParameter("borrarUsuario") != null){
                        try{
                        stm.executeUpdate("UPDATE Usuario SET estadoUsuario=2 where idUsuario='" + id + "'");
                        sesion.invalidate();
                        response.sendRedirect("../index.html");
                        }
                        catch(SQLException e){
                            System.out.println(e.toString());
                        }

                    }
        %>

    <!--Header-->
    <nav class="navbar navbar-expand-lg bg-azul-claro fixed-top text-uppercase" id="mainNav">
        <div class="container">
            <div class="tituloIndex">
                <img class="logotipoWhite" src="../img/leafWhite.svg" width="40px" height="40px"
                    style="padding-bottom: 10px;" />
                <a class="navbar-brand js-scroll-trigger" href="./principal.jsp"><%
                                            out.print(nombre);
                        %></a>
            </div>
            <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                <a class="btn btn-l mt-1 btn-outline-light" href="./principal.jsp">
                    Regresar
                </a>
                </ul>
            </div>
        </div>
    </nav>

    <!--Datos-->
    <div class="wrapperPerfil mb-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 text-center">
                    <img src="<%
                                            out.print(fotoPoli);
                             %>" alt="" style="background-color: #2b81b9">
                </div>
                <div class="col-sm-4">
                    <ul class="ajaja">
                        <li>Nombre: <%
                                            out.print(nombre);
                                %>
                            <button data-toggle="modal" data-target="#cambiarNombre">
                                <img src="../img/nut-icon-blue.svg" alt="nut-icon">
                            </button>
                        </li>
                        <li>Edad: <%
                                            out.print(edad);
                                %>
                            <button data-toggle="modal" data-target="#cambiarEdad">
                                <img src="../img/nut-icon-blue.svg" alt="nut-icon">
                            </button>
                        </li>
                        <li>Escuela: <%
                                            out.print(escuela);
                                %><button data-toggle="modal" data-target="#cambiarEscuela">
                                <img src="../img/nut-icon-blue.svg" alt="nut-icon">
                            </button>
                        </li>
                        <li>Correo: <%
                                            out.print(correo);
                                %>
                            <button data-toggle="modal" data-target="#cambiarCorreo">
                                <img src="../img/nut-icon-blue.svg" alt="nut-icon">
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-2 offset-sm-1 d-flex align-items-center flex-wrap">
                    <a href="./calificaciones.html" class="botonesPerfila">
                        <button class="btn btn-warning botonesPerfil">Insignias</button>
                    </a>
                    <a href="./historial.jsp" class="botonesPerfila">
                        <button class="btn btn-danger botonesPerfil">Historial de viajes</button>
                    </a>
                </div>
                <div class="col-sm-1 d-flex align-items-center">
                    <button data-toggle="modal" data-target="#borrarUsuario" class="borrarUsuario">
                        <img src="../img/delete-user.svg" alt="delete-user">
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!--Autos-->
    <div class="container">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Autos y rutas registrados</h1>
        </div>

        <!-- Content Row -->
        <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Ruta 1</div>
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
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-danger shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Ruta 2</div>
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
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Ruta 3</div>
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
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Auto 1</div>
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


        <!-- Modal Cambiar Nombre-->
        <div class="modal fade" id="cambiarNombre" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <div class=" modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="./perfil.jsp">

                        <div class="modal-header">
                            <h5 class="modal-title texto-azul" id="exampleModalLongTitle">Nombre de Usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Nombre de usuario:<span class="pl-2">
                                    <%
                                        out.print( nombre);
                                        %>
                                </span>
                            </p>
                            <p class="d-flex">Nuevo nombre de usuario:<input type="text" class="ml-2 p-1 nuevoNombre"
                                    name="nuevoNombre" required></p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary cerrarBtn"
                                data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary guardarBtn" name="cambiarNombreBtn"
                                value="Guardar cambios">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Cambiar Nombre-->


        <!-- Modal Cambiar Edad-->
        <div class="modal fade" id="cambiarEdad" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <div class=" modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="./perfil.jsp">

                        <div class="modal-header">
                            <h5 class="modal-title texto-azul" id="exampleModalLongTitle">Edad del Usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Edad de usuario:<span class="pl-2">
                                    <%
                                        out.print( edad);
                                        %>
                                </span>
                            </p>
                            <p class="d-flex">Nueva edad de usuario:<input type="text" class="ml-2 p-1 nuevoNombre"
                                    name="nuevaEdad" required></p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary cerrarBtn"
                                data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary guardarBtn" name="cambiarEdadBtn"
                                value="Guardar cambios">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Cambiar Edad-->

        <!-- Modal Cambiar Escuela-->
        <div class="modal fade" id="cambiarEscuela" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class=" modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="./perfil.jsp">

                        <div class="modal-header">
                            <h5 class="modal-title texto-azul" id="exampleModalLongTitle">Escuela del Usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Escuela de usuario:<span class="pl-2">
                                    <%
                                        out.print( escuela);
                                        %>
                                </span>
                            </p>
                            <p class="d-flex align-items-center">Nueva escuela de usuario:
                                <select id="EscuelaP" name="nuevaEscuela" class="form-control nuevaEscuela ml-2" required>
                                    <option> CECyT 1 </option>
                                    <option> CECyT 2</option>
                                    <option> CECyT 3</option>
                                    <option> CECyT 4</option>
                                    <option> CECyT 5</option>
                                    <option> CECyT 6</option>
                                    <option> CECyT 7</option>
                                    <option> CECyT 8</option>
                                    <option> CECyT 9</option>
                                    <option> CECyT 10</option>
                                    <option> CECyT 11</option>
                                    <option> CECyT 12</option>
                                </select>
                            </p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary cerrarBtn"
                                data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary guardarBtn" name="cambiarEscuelaBtn"
                                value="Guardar cambios">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Cambiar Escuela-->

        <!-- Modal Cambiar Correo-->
        <div class="modal fade" id="cambiarCorreo" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class=" modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="./perfil.jsp">

                        <div class="modal-header">
                            <h5 class="modal-title texto-azul" id="exampleModalLongTitle">Correo del Usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                             </button>
                        </div>
                        <div class="modal-body">
                            <p>Correo de usuario:<span class="pl-2">
                                    <%
                                        out.print( correo);
                                        %>
                                </span>
                            </p>
                            <p class="d-flex">Nuevo correo de usuario:<input type="text" class="ml-2 p-1 nuevoNombre"
                                    name="nuevoCorreo" required></p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary cerrarBtn"
                                data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary guardarBtn" name="cambiarCorreoBtn"
                                value="Guardar cambios">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Cambiar Correo-->

        <!-- Modal Borrar Usuario-->
        <div class="modal fade" id="borrarUsuario" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class=" modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="./perfil.jsp">
                        <div class="modal-header">
                            <h5 class="modal-title texto-azul" id="exampleModalLongTitle">¡Borrar Usuario!</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                             </button>
                        </div>
                        <div class="modal-body">
                            <h4>
                                    <%
                                        out.print(nombre);
                                        %>
                                
                            </h4>
                            <p class="d-flex">¿Estás seguro que quieres eliminar tu cuenta?<br>
                                Solo se pondrá en estado inactiva, en cualquier momento puedes volver a activarla.<br>
                                Se cerrará sesión automaticamente
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary cerrarBtn"
                                data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary guardarBtn" name="borrarUsuario"
                                value="Borrar cuenta">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Borrar Usuario-->

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

        <body>

</html>