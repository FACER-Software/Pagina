<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.io.*" %>
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet resul = null;
            
            
            
            String email = request.getParameter("email");
            String contra = request.getParameter("password");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/UsuariosFACER", "root", "n0m3l0");
                stm = con.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            try {
                resul = stm.executeQuery("SELECT * FROM UsuariosFACER, DatosUs where Correo='" + email + "' and Pass='" + contra + "'");
                if (resul.next()) {
                    int id = resul.getInt("idUs");
                    String correo = resul.getString("Correo");
                    String password = resul.getString("contraUsuario");
                    String nombre = resul.getString("nombreUs");
                    String apellidoP = resul.getString("ApellidoPus");
                    String apellidoM = resul.getString("ApellidoMus");
                    int edad = resul.getInt("Edad");
                    date fechaNac = resul.getDate("FechaNac");
                    double altura = resul.getDouble("Altura");
                    double peso = resul.getDouble("Peso");
                    int talla = resul.getInt("Talla");
                    String municipio = resul.getString("Muni");
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("id", id);
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("password", password);
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("apellidoP", apellidoP);
                    sesion.setAttribute("apellidoM", apellidoM);
                    sesion.setAttribute("edad", edad);
                    sesion.setAttribute("fechaNac", fechaNac);
                    sesion.setAttribute("altura", altura);
                    sesion.setAttribute("peso", peso);
                    sesion.setAttribute("talla", talla);
                    sesion.setAttribute("municipio", municipio);
                    if(correo = resul.getString("Correo");){
                        response.sendRedirect("Usuarios.html")
                    }
                } else {
                    response.sendRedirect("login.html");
                }

                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        %>
        <h1>Hei</h1>
    </body>
</html>
