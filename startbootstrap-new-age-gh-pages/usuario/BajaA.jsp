

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="formato.css">
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*" %>
        <%
            
            Connection conecta= null;
            Statement s=null;
            ResultSet r=null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conecta= DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB","root","n0m3l0");
                s=conecta.createStatement();
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            String Coche = request.getParameter("cochesito");
            out.println();
            try{
                s.executeUpdate("delete from autoDat where matricula='"+matricula+"';");
                out.println("<script>alert('Registro dado de baja exitosamente.')</script>");
                
                out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=htto://localhost:8084/altasjsp/'/>");
            }
            catch(SQLException error){
                out.println(error.toString());
            }
            conecta.close();
            
        %>
        <a href="./mantenimientoautos.html">regresar</a>
    </body>
</html>