package Model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Context.DBContext;
import Model.BEAN.TableBook;

public class TableBookDAO {

	public int getCountOfNewTableBook() {
		// TODO Auto-generated method stub
		String query = "Select * from tablebook where status =? ";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		int count = 0;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1, "NOT CONFIRM");
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					count++;			
				}
				return count;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
			
		}
		return 0;
	}

	public ArrayList<TableBook> getAllTableBook() {
		// TODO Auto-generated method stub
		String query = "Select * from tablebook";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<TableBook> tables = new ArrayList<>();
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					TableBook table = new TableBook();
					table.setId(resultSet.getInt("id"));
					table.setFName(resultSet.getString("FName"));
					table.setLName(resultSet.getString("LName"));
					table.setPhone(resultSet.getString("Phone"));
					table.setEmail(resultSet.getString("Email"));
					table.setCountry(resultSet.getString("Country"));
					table.setTableType(resultSet.getString("Tbltyp"));
					table.setPurpose(resultSet.getString("Purpose"));
					table.setMeal(resultSet.getString("Meal"));
					table.setTime(resultSet.getTime("time"));
					table.setDate(resultSet.getDate("date"));
					table.setStatus(resultSet.getString("status"));
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
	
	public int getCountOfTableBooked() {
		// TODO Auto-generated method stub
		String query = "Select * from tablebook where status =? ";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		int count = 0;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1, "Confirm");
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					count++;			
				}
				return count;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
			
		}
		return 0;
	}

	public TableBook getTableBookByID(String id) {
		// TODO Auto-generated method stub
		String query = "Select * from tablebook where id = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		TableBook table = new TableBook();
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1, id);
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					table.setTitle(resultSet.getString("Title"));
					table.setId(resultSet.getInt("id"));
					table.setFName(resultSet.getString("FName"));
					table.setLName(resultSet.getString("LName"));
					table.setEmail(resultSet.getString("Email"));
					table.setNational(resultSet.getString("National"));
					table.setCountry(resultSet.getString("Country"));
					table.setPhone(resultSet.getString("Phone"));
					table.setTableType(resultSet.getString("Tbltyp"));
					table.setPurpose(resultSet.getString("Purpose"));
					table.setMeal(resultSet.getString("Meal"));
					table.setTime(resultSet.getTime("time"));
					table.setDate(resultSet.getDate("date"));
					table.setStatus(resultSet.getString("status"));
				}
				return table;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
			
		}
		return null;
	}

	public ArrayList<String> getAllTable() {
		// TODO Auto-generated method stub
		String query = "Select * from tables";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<String> tableAvails = new ArrayList<>();
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				resultSet = statement.executeQuery();
				while(resultSet.next())
				{
					tableAvails.add(resultSet.getString("type") + " - "+ resultSet.getString("price"));
				}
				return tableAvails;
			} catch (SQLException e) {
			}finally {
				new DBContext().closeConnection(connection, statement, resultSet);
			}
			
		}
		return null;
	}

	public boolean updateStatus(String id) {
		// TODO Auto-generated method stub
		String query = "update tablebook set status = ? where id = ?";
		String query1 = "update tables set booked = booked + 1 where type = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1,"Confirm");
				statement.setString(2, id);
				if(statement.executeUpdate() > 0)
				{
					TableBook table = this.getTableBookByID(id);
					PreparedStatement statement1 = connection.prepareStatement(query1);
					statement1.setString(1,table.getTableType());
					statement1.executeUpdate();
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

	public boolean deleteTableBooked(String id) {
		// TODO Auto-generated method stub
		String query= "update tables set booked = booked - 1 where type = ?";
		String query1 = "delete from tablebook where id = ?";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				TableBook table = this.getTableBookByID(id);
				statement = connection.prepareStatement(query);
				statement.setString(1, table.getTableType());
				if(statement.executeUpdate() > 0)
				{
					
					PreparedStatement statement1 = connection.prepareStatement(query1);
					statement1.setString(1,id);
					statement1.executeUpdate();
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

}
