package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.Admin;
import database.Super;

/**
 * Servlet implementation class AdminController
 */
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();
			Context env = (Context) initContext.lookup("java:comp/env");
			ds = (DataSource) env.lookup("jdbc/HigherStudies");

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if (action == null) {
			response.sendRedirect("/HigherStudies/UserController");
		} else if (action.equals("login")) {
			request.setAttribute("username", "");
			request.setAttribute("password", "");
			request.setAttribute("message", "");
			request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
		} else {
			out.println("Unknown action.");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException();
		}
		
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
		Super sup = new Super(conn);
		
		if(action == null) {
			request.setAttribute("email", "");
			request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
		}
		else if(action.contentEquals("dologin")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			Admin admin = new Admin(username, password);
			
			if(admin.validate()) {
				try {
					if (sup.login(admin)) {
						HttpSession session = request.getSession();

						String adminname = admin.getUsername();
						session.setAttribute("name", adminname);

						request.getRequestDispatcher("/loginsuccess.jsp").forward(request, response);
					} else {
						request.setAttribute("username", username);
						request.setAttribute("message", "Username or Password not recognised");
						request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					// Do something.
				}

			}
		}
		else {
			out.println("Unknown action.");
		}
		
		
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
