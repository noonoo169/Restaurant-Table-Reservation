package Model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Context.DBContext;
import Model.BEAN.User;

public class UserDAO {

	public ArrayList<User> getAllUserAccount() {
		// TODO Auto-generated method stub
		String query = "Select * from login";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;	
		ArrayList<User> users = new ArrayList<>();
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUserName(resultSet.getString("uname"));
					user.setPassWord(resultSet.getString("pass"));
					users.add(user);
				}
				return users;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
		}
		return null;
	}

	public boolean deleteUserByID(String id) {
		// TODO Auto-generated method stub
		String query = "delete from login where id = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1, id);
				if(statement.executeUpdate() > 0)
				{
					return true;
				}
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				new DBContext().closeConnection(connection, statement, null);
			}
		}
		return false;
	}

	public boolean updateUserByID(String id, String userName, String passWord)  {
		// TODO Auto-generated method stub
		String query = "update login set uname = ? , pass = ? where id = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1, userName);
				statement.setString(2, passWord);
				statement.setString(3, id);
				if(statement.executeUpdate() > 0)
				{
					return true;
				}
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				new DBContext().closeConnection(connection, statement, null);
			}
		}
		return false;
	}

	public boolean addNewUser(String userName, String passWord) {
		// TODO Auto-generated method stub
		String query = "INSERT INTO login(uname,pass)VALUES(?,?)";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1,userName);
				statement.setString(2,passWord);
				if(statement.executeUpdate() > 0)
					return true;
				else return false;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				new DBContext().closeConnection(connection, statement, null);
			}
		}
		return false;
	}

}
