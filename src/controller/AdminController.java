package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

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

import entities.Admin;
import entities.Material;
import models.AdminModel;
import models.CollegeModel;
import models.CourseModel;
import models.ExamModel;
import models.MaterialModel;
import models.UserModel;

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
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException();
		}

		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if (action == null) {
			response.sendRedirect("/HigherStudies/MainController");
		} else if (action.equals("login")) {
			request.setAttribute("username", "");
			request.setAttribute("password", "");
			request.setAttribute("message", "");
			request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
		} else if (action.equals("users")) {
			HttpSession session = request.getSession();

			String name = (String) session.getAttribute("user");

			if (name == null) {
				request.setAttribute("message", "Session expired");
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			} else {
				UserModel userModel = new UserModel(conn);

				try {
					request.setAttribute("users", userModel.getAllAccounts());
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.getRequestDispatcher("/adminusers.jsp").forward(request, response);
			}
		} else if (action.equals("colleges")) {
			HttpSession session = request.getSession();

			String name = (String) session.getAttribute("user");

			if (name == null) {
				request.setAttribute("message", "Session expired");
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			} else {
				CollegeModel collegeModel = new CollegeModel(conn);

				try {
					request.setAttribute("colleges", collegeModel.getAllColleges());
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.getRequestDispatcher("/admincolleges.jsp").forward(request, response);
			}
		} else if (action.equals("courses")) {
			HttpSession session = request.getSession();

			String name = (String) session.getAttribute("user");

			if (name == null) {
				request.setAttribute("message", "Session expired");
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			} else {
				CourseModel courseModel = new CourseModel(conn);

				try {
					request.setAttribute("courses", courseModel.getAllCourses());
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.getRequestDispatcher("/admincourses.jsp").forward(request, response);
			}

		} else if (action.equals("exams")) {
			HttpSession session = request.getSession();

			String name = (String) session.getAttribute("user");

			if (name == null) {
				request.setAttribute("message", "Session expired");
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			} else {
				ExamModel examModel = new ExamModel(conn);

				try {
					MaterialModel materialModel = new MaterialModel(conn);
					request.setAttribute("materials", materialModel.getAllMaterials());
					request.setAttribute("exams", examModel.getAllExams());
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.getRequestDispatcher("/adminexams.jsp").forward(request, response);
			}

		} else if (action.equals("materials")) {
			HttpSession session = request.getSession();

			String name = (String) session.getAttribute("user");

			if (name == null) {
				request.setAttribute("message", "Session expired");
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			} else {
				MaterialModel materialModel = new MaterialModel(conn);

				try {
					request.setAttribute("materials", materialModel.getAllMaterials());
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				request.getRequestDispatcher("/adminmaterials.jsp").forward(request, response);
			}

		} else {
			out.println("Unknown action.");
		}

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		AdminModel supr = new AdminModel(conn);

		if (action == null) {
			request.setAttribute("email", "");
			request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
		} else if (action.contentEquals("dologin")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			Admin admin = new Admin(username, password);

			if (admin.validate()) {
				try {
					if (supr.login(admin)) {
						HttpSession session = request.getSession();

						String adminname = admin.getUsername();
						session.setAttribute("user", adminname);

						response.sendRedirect("/HigherStudies/AdminController?action=users");
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
		} else {
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
