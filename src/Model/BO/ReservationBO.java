package Model.BO;

import Model.BEAN.TableBook;
import Model.DAO.ReservationDAO;

public class ReservationBO {
	
	ReservationDAO reservationDao = new ReservationDAO();
	
	public boolean addTableBook(TableBook tableBook) {
		return reservationDao.addTableBook(tableBook);
	}

}
