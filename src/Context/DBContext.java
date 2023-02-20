package Context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBContext {
	public Connection getConnecttion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/newdb";
			String user = "root";
			String pass = "1609";
			return DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException |  SQLException e) {
			return null;
		}
	}
	public void closeConnection(Connection connection,PreparedStatement statement , ResultSet resultSet)
	{
		try {
			if(connection != null) {
				connection.close();
			}
			if(statement != null) {
				statement.close();
			}
			if(resultSet != null) {
				resultSet.close();
			}
		} catch (Exception e2) {
		}
	}
}
