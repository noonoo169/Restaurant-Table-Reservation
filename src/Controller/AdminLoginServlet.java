package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.AdminLoginBO;
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessout = request.getSession();
		sessout.removeAttribute("user");
		response.sendRedirect("admin/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String destination = null;		
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		AdminLoginBO adminLoginBo = new AdminLoginBO();
		if(adminLoginBo.isValidUser(userName, passWord))
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("user", userName);
			destination = "/TableBookServlet";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("admin/login.jsp");
		}
	}

}
