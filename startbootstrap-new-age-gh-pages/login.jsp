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
                con = DriverManager.getConnection("jdbc:mysql://localhost/EcoWaysDB", "root", "n0m3l0");
                stm = con.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }

            try {
                resul = stm.executeQuery("SELECT * FROM Usuario, poliDat where correoUsuario='" + email + "' and contraUsuario='" + contra + "'");
                if (resul.next()) {
                    int id = resul.getInt("idUsuario");
                    String nombre = resul.getString("nombreUsuario");
                    String correo = resul.getString("correoUsuario");
                    int estado = resul.getInt("estadoUsuario");
                    String password = resul.getString("contraUsuario");
                    String celular = resul.getString("celUsuario");
                    String edad = resul.getString("edadUsuario");
                    String escuela = resul.getString("nomEscuela");
                    String fotoPoli = resul.getString("fotoPoli");
                    int idTipoUsuario = resul.getInt("idTipoUsuario");
                    float calif = resul.getFloat("califUsuario");
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("id", id);
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("estado", estado);
                    sesion.setAttribute("password", password);
                    sesion.setAttribute("celular", celular);
                    sesion.setAttribute("edad", edad);
                    sesion.setAttribute("calificacion", calif);
                    sesion.setAttribute("escuela", escuela);
                    sesion.setAttribute("fotoPoli", fotoPoli);
                    if(estado == 1){
                        if(idTipoUsuario == 1){
                            response.sendRedirect("./usuario/principal.jsp");
                        }
                        if(idTipoUsuario == 2){
                            response.sendRedirect("./usuario/VehiculoM.html");
                        }
                    }
                    else if(estado == 2){
                            response.sendRedirect("./usuario/principalInactivo.jsp");
                    } 
                } else {
                    response.sendRedirect("loginRechazado.html");
                }

                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        %>
        <h1>Hei</h1>
    </body>
</html>
