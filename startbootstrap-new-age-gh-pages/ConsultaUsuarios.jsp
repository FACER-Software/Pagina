<%-- 
    Document   : ConsultaUsuarios
    Created on : 8/05/2019, 09:19:08 AM
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
        <form method="post" action="ConsultaUsuarios.jsp">
            <input type="text" name="borra" placeholder="ID de usuario a dar de baja" class="form-inline" required>
            <input type="submit" value="Eliminar" class="form-control-lg" name="goma">
        </form>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Usuarios</h6>
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
                                <th>Estado</th>
                                <th>Celular</th>
                                <th>Edad</th>
                                <th>Calificacion</th>
                                <th>Tipo de Usuario</th>
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
                                if(request.getParameter("goma") == "Eliminar"){
                                int id = Integer.parseInt(request.getParameter("borra"));
                                 String query = "call spBajaUsuario(?)";
                                 CallableStatement cs = con.prepareCall(query);
                                 cs.setInt(1, id);
                                 cs.executeUpdate();
                                }
                            }
                            catch(SQLException e){
                            out.print("<center><h1>" + e + "</h1></center>");
                                 out.print("<center><h1> Error en base de datos </h1></center>");
                            }
                              try{
                                r = state.executeQuery("select idUsuario, nombreUsuario, correoUsuario, estadoUsuario, celUsuario, edadUsuario, califUsuario, tipoUsuario from Usuario inner join cattipousuario on idTipoUsuario = idTipoUsu;");
                                while(r.next()){
                                    int id = r.getInt("idUsuario");
                                    String Nombre = r.getString("nombreUsuario");
                                    String correo = r.getString("correoUsuario");
                                    String estado = r.getString("estadoUsuario");
                                    String cel = r.getString("celUsuario");
                                    String edad = r.getString("edadUsuario");
                                    String calif = r.getString("califUsuario");
                                    String tipo = r.getString("tipoUsuario");
                                    
                                    out.print("<tr>");
                                    out.print("<th name ='usu"+id+"'>"+id+"</th>");
                                    out.print("<th>"+Nombre+"</th>");
                                    out.print("<th>"+correo+"</th>");
                                    out.print("<th>"+estado+"</th>");
                                    out.print("<th>"+cel+"</th>");
                                    out.print("<th>"+edad+"</th>");
                                    out.print("<th>"+calif+"</th>");
                                    out.print("<th>"+tipo+"</th>");
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
                                <th>Estado</th>
                                <th>Celular</th>
                                <th>Edad</th>
                                <th>Calificacion</th>
                                <th>Tipo de Usuario</th>
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