package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.TableBook;
import Model.BO.TableBookBO;

/**
 * Servlet implementation class TableServlet
 */
@WebServlet("/TableBookServlet")
public class TableBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TableBookBO tableBookBo = new TableBookBO();
		if(request.getParameter("idConfirm") != null)
		{
			String id = request.getParameter("idConfirm");
			
			if(tableBookBo.updateStatus(id))
			{
				
			}
		}
		if(request.getParameter("idDelete") != null)
		{
			String id = request.getParameter("idDelete");
			if(tableBookBo.deleteTableBooked(id))
			{
			
			}
		}
		
		int countNewBook = tableBookBo.getCountOfNewTableBook();
		int countBooked = tableBookBo.getCountOfTableBooked();
		ArrayList<TableBook> tableBookList = tableBookBo.getAllTableBook();
		request.setAttribute("countNewBook", countNewBook);
		request.setAttribute("countBooked", countBooked);
		request.setAttribute("tableBookList", tableBookList);
		String destination = "/admin/home.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
