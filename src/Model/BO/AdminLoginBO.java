package Model.BO;

import Model.DAO.AdminLoginDAO;

public class AdminLoginBO {
	
	AdminLoginDAO adminLoginDao = new AdminLoginDAO();

	public boolean isValidUser(String userName, String passWord) {
		// TODO Auto-generated method stub
		return adminLoginDao.isValidUser(userName, passWord);
	}

}
