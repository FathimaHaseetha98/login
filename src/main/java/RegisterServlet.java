import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/icbt",
                    "root",
                    ""
            );

            // ✅ Check if username exists
            String checkSql = "SELECT 1 FROM users WHERE username=?";
            psCheck = con.prepareStatement(checkSql);
            psCheck.setString(1, username);
            rs = psCheck.executeQuery();

            if (rs.next()) {
                // ❌ Username exists
                response.sendRedirect("register.jsp?error=1");
            } else {
                // ✅ Insert new user
                String insertSql = "INSERT INTO users (username, password) VALUES (?, ?)";
                psInsert = con.prepareStatement(insertSql);
                psInsert.setString(1, username);
                psInsert.setString(2, password);
                psInsert.executeUpdate();

                response.sendRedirect("register.jsp?success=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=1");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (psCheck != null) psCheck.close(); } catch (Exception e) {}
            try { if (psInsert != null) psInsert.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
