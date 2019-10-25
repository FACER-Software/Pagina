<%-- 
    Document   : BuscarA
    Created on : 14/05/2019, 02:22:02 PM
    Author     : Profesor
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <h1>Consultas</h1>
        <%@page import="java.sql.*, java.io.*" %>
        <%
            String matri = request.getParameter("matricula");
            Connection conecta = null;
            Statement stat = null;
            ResultSet encontrados = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conecta = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                stat = conecta.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }
            try {
                encontrados = stat.executeQuery("SELECT * FROM autoDat where matricula = '"+matri+"'");
                out.println("<table border='2'>");
                while (encontrados.next()) {
                    String marca = encontrados.getString("marca");
                    String modelo = encontrados.getString("modelo");
                    String matricula = encontrados.getString("matricula");
                    String color = encontrados.getString("color");
                    String fotoCirculacion = encontrados.getString("fotoCirculacion");
                    String fotoAuto = encontrados.getString("fotoAuto");
                    out.println("<tr>");
                    out.println("<td>" + marca + "</td>");
                    out.println("<td>" + modelo + "</td>");
                    out.println("<td>" + matricula + "</td>");
                    out.println("<td>" + color + "</td>");
                    out.println("<td>" + fotoCirculacion + "</td>");
                    out.println("<td>" + fotoAuto + "</td>");
                    out.print("</tr>");
                }
                out.print("</table>");
                out.print("<script>alert('Encontrados')</script>");
            } catch (SQLException error) {
                out.print(error.toString());
            }
            conecta.close();
            stat.close();
        %>
    <td><a href="./mantenimientoautos.html" target="dos" onclick="self.close()">Regresar</a></td>
</body>
</html>