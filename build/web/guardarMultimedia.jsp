<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guardar Multimedia</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }
            h3 {
                text-align: center;
                color: #333;
                padding: 20px;
                background-color: #4CAF50;
                color: white;
                margin: 0;
            }
            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #4CAF50;
                text-decoration: none;
                font-size: 18px;
            }
            a:hover {
                text-decoration: underline;
            }
            footer {
                text-align: center;
                padding: 20px;
                background-color: #4CAF50;
                color: white;
                margin-top: 40px;
            }
        </style>
    </head>
    <body>

        <%
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            String url = request.getParameter("url");
            String tipo = request.getParameter("tipo");

            if (titulo == null || titulo.trim().isEmpty() || url == null || url.trim().isEmpty() || tipo == null) {
                out.println("<h3>Por favor, completa todos los campos requeridos.</h3>");
                return;
            }

            Connection conn = null;
            PreparedStatement ps = null;
            try {
                // Establecer conexión con la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/media_db", "root", "Admin$1234");

                // Sentencia SQL para insertar datos
                String query = "INSERT INTO multimedia (titulo, descripcion, url, tipo) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(query);
                ps.setString(1, titulo);
                ps.setString(2, descripcion);
                ps.setString(3, url);
                ps.setString(4, tipo);

                // Ejecutar la inserción
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<h3>Contenido multimedia guardado con éxito.</h3>");
                    out.println("<a href='verMultimedia.jsp'>Ver contenidos Multimedia ya registrados</a>");
                } else {
                    out.println("<h3>Error al guardar el contenido.</h3>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>


    </body>
</html>
