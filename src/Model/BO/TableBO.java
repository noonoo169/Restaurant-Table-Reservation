package Model.BO;

import java.util.ArrayList;

import Model.BEAN.Table;
import Model.DAO.TableDAO;

public class TableBO {

	TableDAO tableDao = new TableDAO();
	public ArrayList<Table> getAllTable() {
		// TODO Auto-generated method stub
		return tableDao.getAllTable();
	}
	public boolean addTable(String type, String price) {
		// TODO Auto-generated method stub
		return tableDao.addTable(type, price);
	}
	public boolean delTable(String type) {
		// TODO Auto-generated method stub
		return tableDao.delTable(type);
	}
	public boolean updateTable(String type, String price) {
		// TODO Auto-generated method stub
		return tableDao.updateTable(type, price);
	}

}
