<%-- 
    Document   : BORautos
    Created on : 13/05/2019, 12:49:48 PM
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style=" margin:0px; width: 100%; height: 100%">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Auto</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Pagos/web/css/forma.css" rel="stylesheet" type="text/css">
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
        <link rel="icon" href="img/leaf.png">
        <link rel="stylesheet" href="../css/calificaciones.css">
        <link rel="stylesheet" href="../css/colores.css">
        <link rel="stylesheet" href="../css/fuentes.css">
        <link rel="stylesheet" href="../css/Autos.css">
        <script>
            function borra(){
                var result = confirm("¿Desea borrar este cliente?");
                if (result === true)
                    document.getElementById("borrar").submit();
                else
                    alert("no se borra falso");
            }
            </script>
    <body>
        <nav class="navbar navbar-expand-lg bg-amarillo fixed-top text-uppercase" id="mainNav" style="display: table; width: 100%; height: 15%; float: left; background-color: #A91212" >
            <div class="container">
                <div class="tituloIndex">
                    <img class="logotipoWhite" src="../img/leafWhite.svg" width="40" height="40"
                         style="padding-bottom: 10px;" />
                    <a class="navbar-brand js-scroll-trigger" href="./principal.html">EcoWays</a>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarResponsive">
                    <a class="btn btn-l mt-1 btn-outline-light" href="./principal.html">
                        Regresar
                    </a>
                </div>
            </div>
        </nav>
        <div style="display: table; width: 100%; height: 20%; float: left;">
            <br><br><br><br><br><br><br>
            <center><h1 style="color:#A91212">Eliminar Auto</h1></center>
            <br><br>
        </div>
        <%@page import="java.sql.*,java.io.*" %>
        <%
            String Matricula;
            Connection c = null;
            Statement s = null;
            ResultSet r = null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB","root","n0m3l0");
                s = c.createStatement();
            }
            catch(SQLException error){
                out.print(error.String());
            }
            try
            {
                Matricula = request.getParameter("marca");
                r = s.executeQuery("select * from autoDat where NombreMatri='"+matricula+"';");
                if(r.next()){
                    String marca = r.getString("marca");
                    String modelo = r.getString("modelo");
                    String matricula = r.getString("matricula");
                    String color = r.getString("color");
                    String fotoCirculacion = r.getString ("fotoCirculacion");
                    String fotoAuto = r.getString("fotoAuto");
                            out.println(marca + "<br>");
                            out.println(modelo + "<br>");
                            out.println(matricula + "<br>");
                            out.println(color + "<br>");
                            out.println(fotoCirculacion + "<br>");
                            out.println(fotoAuto + "<br>");
                            
                            out.println("<form id ='borrar' action='BajaA.jsp' method='post'>");
                            out.println("<input type='text' name'cochesito' value='"+Coche+"'></input>");
                            out.println("</form>");
                            out.println("<script>borra();</script>");
                }
                else
                    out.println("<script>alert('no existe el Carro.');<script>");
                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=htto://localhost:8084/Autosjsp/'/>");
                            
                    
                }
            catch(SQLException error){
                out.println(error.toString());
            }
            %>
            <a href="./mantenimientoautos.html">regresar</a>
            }
            
    </body>
</html>
