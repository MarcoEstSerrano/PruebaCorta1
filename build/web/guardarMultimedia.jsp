<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guardar Multimedia</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Orbitron&display=swap');
            
            body {
                font-family: 'Orbitron', sans-serif;
                margin: 0;
                padding: 0;
                background: #0a0a0a;
                color: #0ff;
                text-align: center;
            }
            header {
                background: linear-gradient(90deg, #00f, #0ff);
                color: white;
                padding: 20px;
                box-shadow: 0px 0px 15px #0ff;
            }
            header h1 {
                margin: 0;
                text-shadow: 0px 0px 10px #fff;
            }
            section {
                max-width: 800px;
                margin: 40px auto;
                background: rgba(255, 255, 255, 0.1);
                padding: 20px;
                box-shadow: 0px 0px 15px #0ff;
                border-radius: 10px;
            }
            section h3 {
                color: #0ff;
                text-shadow: 0px 0px 10px #0ff;
            }
            section p {
                color: #ddd;
                line-height: 1.6;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                color: #0ff;
                text-decoration: none;
                font-size: 18px;
                padding: 10px 20px;
                border-radius: 8px;
                background: rgba(255, 255, 255, 0.1);
                box-shadow: 0px 0px 8px #0ff;
                transition: 0.3s;
            }
            a:hover {
                background: #0ff;
                color: #000;
                box-shadow: 0px 0px 15px #0ff;
            }
            footer {
                text-align: center;
                padding: 20px;
                background: linear-gradient(90deg, #0ff, #00f);
                color: white;
                margin-top: 40px;
                box-shadow: 0px 0px 15px #0ff;
            }
        </style>
    </head>
    <body>

        <header>
            <h1>Gestión de Contenido Multimedia</h1>
        </header>

        <section>
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
        </section>

        <footer>
            Prueba Corta 1
        </footer>

    </body>
</html>
