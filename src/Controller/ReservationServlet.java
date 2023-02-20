package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.TableBook;
import Model.BO.ReservationBO;
import Model.BO.TableBookBO;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		TableBookBO tableBookBo = new TableBookBO();
		ArrayList<String> tableAvaiList = tableBookBo.getAllTable();
		request.setAttribute("tableAvaiList", tableAvaiList);
		String destination = "/reservation.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		TableBook tableBook = new TableBook();
		tableBook.setTitle(request.getParameter("title"));
		tableBook.setFName(request.getParameter("fname"));
		tableBook.setLName(request.getParameter("lname"));
		tableBook.setEmail(request.getParameter("email"));
		tableBook.setNational(request.getParameter("title"));
		tableBook.setCountry(request.getParameter("country"));
		tableBook.setPhone(request.getParameter("phone"));
		tableBook.setTableType(request.getParameter("table").substring(0,1));
		tableBook.setPurpose(request.getParameter("purpose"));
		tableBook.setMeal(request.getParameter("meal"));
		tableBook.setTime(Time.valueOf(request.getParameter("tme") + ":00"));
		tableBook.setDate(Date.valueOf(request.getParameter("dte")));
		tableBook.setStatus("NOT CONFIRM");
		ReservationBO reservationBo = new ReservationBO();
		PrintWriter out = response.getWriter();
		if (reservationBo.addTableBook(tableBook)) {
			out.print("<script type='text/javascript'> alert('Your Booking application has been sent'); window.location.href = '"+request.getContextPath()+"/home.jsp';</script>");
//			destination = "/home.jsp";
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//			rd.forward(request, response);
		}
		else
		{
			out.print("<script type='text/javascript'> alert('Error booking table'); window.location.href = '"+request.getContextPath()+"/reservation.jsp'; </script>");
//			destination = "/reservation.jsp";
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//			rd.forward(request, response);
		}
		
	}

}
