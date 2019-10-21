<%-- 
    Document   : ConsultaMensajes
    Created on : 14/05/2019, 12:12:12 PM
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/crudAdmin.css">
    </head>
    <body style="width:100%; height:100%;" id="page-top">
        <%@page import="java.sql.*, java.io.*" %>
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
            <div class="container">
                <div class="tituloIndex" style="width: 250px;">
                    <img class="logotipoWhite" src="./img/leafWhite.svg" width="40px" height="40px" style="padding-bottom: 10px;" />
                    <a class="navbar-brand js-scroll-trigger" href="AceptarUsuarios.jsp">EcoWays</a>
                </div>
                <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button"
                        data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                        aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <center>
                    <div class="collapse navbar-collapse text-white" id="navbarResponsive">
                        <h1>Consultas</h1>
                    </div>
                </center>
            </div>
        </nav>
        <br><br><br><br><br><br><br>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Peticiones Usuarios</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                   
                        <% out.print("Contador: "); %>
                
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Telefono</th>
                                <th>Opinion</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            Connection con = null;
                            Statement state = null;
                            ResultSet r = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                                state = con.createStatement();
                            } catch (SQLException e) {
                                out.print("<center><h1>" + e + "</h1></center>");
                                out.print("<center><h1> Error en la conexión </h1></center>");
                            }
                              try{
                                r = state.executeQuery("select * from Opiniones" );
                                while(r.next()){
                                    int id = r.getInt("idOpinion");
                                    String Nombre = r.getString("Nombre");
                                    String correo = r.getString("correo");
                                    String cel = r.getString("telefono");
                                    String opi = r.getString("opinion");
                                    String fecha = r.getString("fecha");
                                    
                                    out.print("<tr>");
                                    out.print("<th name ='usu"+id+"'>"+id+"</th>");
                                    out.print("<th>"+Nombre+"</th>");
                                    out.print("<th>"+correo+"</th>");
                                    out.print("<th>"+cel+"</th>");
                                    out.print("<th>"+opi+"</th>");
                                    out.print("<th>"+fecha+"</th>");
                                    out.print("/<tr>");
                                }
                               }catch(SQLException e){ 
                                 out.print("<center><h1>" + e + "</h1></center>");
                                 out.print("<center><h1> Error en la consulta </h1></center>");
                               }   
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Telefono</th>
                                <th>Opinion</th>
                                <th>Fecha</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
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
    </body>
</html>