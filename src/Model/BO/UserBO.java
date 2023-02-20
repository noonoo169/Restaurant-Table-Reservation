package Model.BO;

import java.util.ArrayList;

import Model.BEAN.User;
import Model.DAO.UserDAO;

public class UserBO {
	
	UserDAO userDao = new UserDAO();
	
	public ArrayList<User> getAllUserAccount() {
		// TODO Auto-generated method stub
		return userDao.getAllUserAccount();
	}

	public boolean deleteUserByID(String id) {
		// TODO Auto-generated method stub
		return userDao.deleteUserByID(id);
	}

	public boolean updateUserByID(String id, String userName, String passWord) {
		// TODO Auto-generated method stub
		return userDao.updateUserByID(id, userName, passWord);
	}

	public boolean addNewUser(String userName, String passWord) {
		// TODO Auto-generated method stub
		return userDao.addNewUser(userName, passWord);
	}

}
