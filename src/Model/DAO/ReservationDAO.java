package Model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Context.DBContext;
import Model.BEAN.TableBook;

public class ReservationDAO {

	public boolean addTableBook(TableBook tableBook) {
		String query = "INSERT INTO tablebook(Title,FName,LName,Email,National,Country,Phone,Tbltyp,Purpose,Meal,time,date,status)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection connection = new DBContext().getConnecttion();
		PreparedStatement statement = null;
		if (connection != null) {
			try {
				statement = connection.prepareStatement(query);
				statement.setString(1,tableBook.getTitle());
				statement.setString(2,tableBook.getFName());
				statement.setString(3,tableBook.getLName());
				statement.setString(4,tableBook.getEmail());
				statement.setString(5,tableBook.getNational());
				statement.setString(6,tableBook.getCountry());
				statement.setString(7,tableBook.getPhone());
				statement.setString(8,tableBook.getTableType());
				statement.setString(9,tableBook.getPurpose());
				statement.setString(10,tableBook.getMeal());
				statement.setString(11,tableBook.getTime().toString());
				statement.setString(12,tableBook.getDate().toString());
				statement.setString(13,tableBook.getStatus());
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
