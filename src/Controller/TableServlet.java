package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BEAN.Table;
import Model.BO.TableBO;

/**
 * Servlet implementation class TableServlet
 */
@WebServlet("/TableServlet")
public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TableBO tableBo = new TableBO();
		String destination;
		ArrayList<Table> tables = tableBo.getAllTable();
		request.setAttribute("tables", tables);
		if(request.getParameter("setting") != null)
		{
			destination = "/admin/setting.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		
		if(request.getParameter("add") != null)
		{
			destination = "/admin/addtable.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		
		if(request.getParameter("update") != null)
		{
			destination = "/admin/updatetable.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		
		if(request.getParameter("delete") != null)
		{
			destination = "/admin/deletetable.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}

		if(request.getParameter("typeDelete") != null)
		{
			String type = request.getParameter("typeDelete");
			tableBo.delTable(type);
			tables = tableBo.getAllTable();
			request.setAttribute("tables", tables);
			destination = "/admin/deletetable.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TableBO tableBo = new TableBO();
		PrintWriter out = response.getWriter();
		if(request.getParameter("addTable") != null)
		{
			String type = request.getParameter("type");
			String price = request.getParameter("price");
			
			if(tableBo.addTable(type, price))
			{
				out.print("<script type='text/javascript'> alert('Added 1 table.'); window.location.href = 'TableServlet?add=1';</script>");
			}
			else
			{
				out.print("<script type='text/javascript'> alert('Type table is exist!!!'); window.location.href = 'TableServlet?add=1';</script>");
			}
		}
		if(request.getParameter("updateTable") != null)
		{
			String type = request.getParameter("typetable");
			String price = request.getParameter("pricetable");
			
			if(tableBo.updateTable(type, price))
			{
				out.print("<script type='text/javascript'>window.location.href = 'TableServlet?update=1';</script>");
			}
			else
			{
				out.print("<script type='text/javascript'>window.location.href = 'TableServlet?update=1';</script>");
			}
		}
	}

}
