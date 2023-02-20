package Model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Context.DBContext;

public class AdminLoginDAO {

	public boolean isValidUser(String userName, String passWord) {
		String query = "Select uname, pass from login where uname =? and pass =?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1, userName);
				statement.setString(2, passWord);
				resultSet = statement.executeQuery();
				resultSet.next();
				int count = resultSet.getRow();
				if (count > 0)
					return true;
				else
					return false;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
			
		}
		return false;
	}

}
