<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Multimedia</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
                color: #333;
            }
            h2 {
                text-align: center;
                color: #333;
                padding: 20px;
                background-color: #4CAF50;
                color: white;
                margin: 0;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }
            th, td {
                padding: 12px 15px;
                text-align: left;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            img, video, audio {
                max-width: 100px;
                max-height: 100px;
            }
            .media-container {
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body>

        <h2>Contenido Multimedia Registrado</h2>

        <table border="1">
            <tr>
                <th>Título</th>
                <th>Descripción</th>
                <th>Tipo</th>
                <th>Contenido</th>
                <th>Acción</th> <!-- Nueva columna para eliminar -->
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/media_db", "root", "Admin$1234");
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM multimedia";
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        String id = rs.getString("id"); // ID de la BD
                        String titulo = rs.getString("titulo");
                        String descripcion = rs.getString("descripcion");
                        String tipo = rs.getString("tipo");
                        String url = rs.getString("url");

                        out.println("<tr>");
                        out.println("<td>" + titulo + "</td>");
                        out.println("<td>" + descripcion + "</td>");
                        out.println("<td>" + tipo + "</td>");
                        out.print("<td>");
                        out.println("<div class='media-container'>");

                        if (tipo.equals("Imagen")) {
                            out.println("<img src='" + url + "' alt='" + titulo + "'>");
                        } else if (tipo.equals("Video")) {
                            out.println("<video width='320' height='240' controls>");
                            out.println("<source src='" + url + "' type='video/mp4'>");
                            out.println("Tu navegador no soporta el elemento de video.");
                            out.println("</video>");
                        } else if (tipo.equals("Audio")) {
                            out.println("<audio controls>");
                            out.println("<source src='" + url + "' type='audio/mpeg'>");
                            out.println("Tu navegador no soporta el elemento de audio.");
                            out.println("</audio>");
                        }

                        out.println("</div>");
                        out.println("</td>");

                        // Botón de eliminar
                        out.println("<td><a href='eliminarMultimedia.jsp?id=" + id + "' onclick=\"return confirm('¿Estás seguro de eliminar este archivo?');\">Eliminar</a></td>");

                        out.println("</tr>");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
        
        
    <li><a href="index.html">Volver</a></li>

    </body>
</html>
