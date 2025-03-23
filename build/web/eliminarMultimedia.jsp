<%@ page import="java.sql.*" %>
<%
    // Obtener el ID del multimedia desde la URL o formulario
    String id = request.getParameter("id");

    // Validar que el ID no sea nulo o vacío
    if (id != null && !id.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Conectar a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/media_db", "root", "Admin$1234");

            // Crear la consulta para eliminar
            String sql = "DELETE FROM multimedia WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));

            // Ejecutar la eliminación
            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                out.println("<script>alert('Multimedia eliminada correctamente.'); window.location.href='verMultimedia.jsp';</script>");
            } else {
                out.println("<script>alert('No se encontró el archivo multimedia.'); window.location.href='verMultimedia.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error al eliminar multimedia.'); window.location.href='verMultimedia.jsp';</script>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("<script>alert('ID no válido.'); window.location.href='verMultimedia.jsp';</script>");
    }
%>
