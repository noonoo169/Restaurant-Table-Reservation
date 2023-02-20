package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.User;
import Model.BO.UserBO;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserBO userBo = new UserBO();
		if(request.getParameter("iddelete") != null)
		{
			String id = request.getParameter("iddelete");
			userBo.deleteUserByID(id);
		}
		if(request.getParameter("setting") != null)
		{
			
		}
		ArrayList<User> users = userBo.getAllUserAccount();
		request.setAttribute("users", users);
		String destination = "/admin/usersetting.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserBO userBo = new UserBO();
		if(request.getParameter("add") != null)
		{
			String userName = request.getParameter("newun");
			String passWord = request.getParameter("newps");
			userBo.addNewUser(userName, passWord);
		}
		if(request.getParameter("update") != null)
		{
			
			String id = request.getParameter("id");
			String userName = request.getParameter("userName");
			String passWord = request.getParameter("passWord");
			userBo.updateUserByID(id, userName, passWord);
		}
		doGet(request, response);
	}

}
