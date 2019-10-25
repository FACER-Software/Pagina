<%-- 
    Document   : Autos
    Created on : 8/05/2019, 09:34:47 AM
    Author     : Alumno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Altas</h1>
        <%@page import ="java.sql.*, java.io.*"%>
        <%
            Connection c = null;
            Statement s = null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jbdc:mysql://localhost/EcoWaysDB","root","n0m3l0");
                s = c.createStatement();
            } catch (SQLException error){
                out.print(error.toString());
            }
            try{
                
                String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String matricula = request.getParameter("matricula");
            String color = request.getParameter("color");
            String foto1 = request.getParameter("fotoCirculacion");
            String foto2 = request.getParameter("fotoAuto");
                
                s.executeUpdate("insert into autoDat values('"+marca+"','"+modelo+"','"+matricula+"','"+color+"','"+foto1+"','"+foto2+"')");
                out.print(marca);
                c.close();
                s.close();
                
                out.println("<script> alert ('Registro Guardado');</script>");
            } catch(SQLException error){
                out.println(error.toString());
            }
        %>
        <a href="./principal.jsp">regresar</a>
    </body>
</html>
