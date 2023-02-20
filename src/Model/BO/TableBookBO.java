package Model.BO;

import java.util.ArrayList;

import Model.BEAN.TableBook;
import Model.DAO.TableBookDAO;

public class TableBookBO {

	TableBookDAO tableBookDao = new TableBookDAO();
	public int getCountOfNewTableBook() {
		// TODO Auto-generated method stub
		return tableBookDao.getCountOfNewTableBook();
	}

	public int getCountOfTableBooked() {
		// TODO Auto-generated method stub
		return tableBookDao.getCountOfTableBooked();
	}

	public ArrayList<TableBook> getAllTableBook() {
		// TODO Auto-generated method stub
		return tableBookDao.getAllTableBook();
	}

	public TableBook getTableBookByID(String id) {
		// TODO Auto-generated method stub
		return tableBookDao.getTableBookByID(id);
	}

	public boolean updateStatus(String id) {
		// TODO Auto-generated method stub
		return tableBookDao.updateStatus(id);
		
	}

	public ArrayList<String> getAllTable() {
		// TODO Auto-generated method stub
		return tableBookDao.getAllTable();
	}

	public boolean deleteTableBooked(String id) {
		// TODO Auto-generated method stub
		return tableBookDao.deleteTableBooked(id);
	}
	
	

}
