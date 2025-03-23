<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Multimedia</title>
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
            h2 {
                text-align: center;
                color: #0ff;
                padding: 20px;
                background: linear-gradient(90deg, #00f, #0ff);
                box-shadow: 0px 0px 15px #0ff;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0px 0px 15px #0ff;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 10px;
            }
            th, td {
                padding: 12px 15px;
                text-align: left;
                color: #0ff;
            }
            th {
                background: linear-gradient(90deg, #00f, #0ff);
                color: white;
                text-shadow: 0px 0px 10px #fff;
            }
            tr:nth-child(even) {
                background: rgba(255, 255, 255, 0.05);
            }
            tr:hover {
                background: rgba(0, 255, 255, 0.2);
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
            a {
                color: #0ff;
                text-decoration: none;
                font-weight: bold;
                transition: 0.3s;
            }
            a:hover {
                color: #ff0;
                text-shadow: 0px 0px 10px #ff0;
            }

            /* Estilo para el botón de eliminar */
            a.eliminar-btn {
                color: #ff0;
                text-decoration: none;
                font-size: 18px;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 8px;
                background: rgba(255, 0, 0, 0.2);
                box-shadow: 0px 0px 8px #ff0;
                transition: 0.3s;
            }

            a.eliminar-btn:hover {
                background: #ff0;
                color: #000;
                box-shadow: 0px 0px 15px #ff0;
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
                <th>Acción</th>
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
                        String id = rs.getString("id");
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
                        out.println("<td><a href='eliminarMultimedia.jsp?id=" + id + "' class='eliminar-btn' onclick=\"return confirm('¿Estás seguro de eliminar este archivo?');\">Eliminar</a></td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
        <li><a href="index.html">Volver</a></li>
    </body>
</html>
