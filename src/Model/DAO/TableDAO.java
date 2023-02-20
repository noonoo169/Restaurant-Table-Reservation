package Model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Context.DBContext;
import Model.BEAN.Table;

public class TableDAO {

	public ArrayList<Table> getAllTable() {
		// TODO Auto-generated method stub
		String query = "Select * from tables";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Table> tables = new ArrayList<>();
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					Table table = new Table();
					table.setId(resultSet.getInt("type"));
					table.setPrice(resultSet.getString("price"));
					table.setBooked(resultSet.getInt("booked"));
					tables.add(table);
				}
				return tables;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
		}
		return null;
	}

	public boolean addTable(String type, String price) {
		// TODO Auto-generated method stub
		String query = "INSERT INTO tables(type,price,booked)VALUES(?,?,0)";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1,type);
				statement.setString(2,price);
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

	public boolean delTable(String type) {
		// TODO Auto-generated method stub
		String query = "delete from tables where type = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1,type);
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

	public boolean updateTable(String type, String price) {
		// TODO Auto-generated method stub
		String query = "update tables set price = ? where type = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1,price);
				statement.setString(2,type);
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
