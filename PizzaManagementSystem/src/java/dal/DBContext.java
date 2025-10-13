package dal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class DBContext {
    public Connection connection;
    public DBContext() {
        try {
            String username = "sa";
            String password = "1234";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PizzaManagement;encrypt=true;trustServerCertificate=true;";
            // Bỏ Class.forName() - Driver tự load từ JDBC 4.0+
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // Phương thức tiện ích để đóng connection (gọi sau khi dùng)
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
