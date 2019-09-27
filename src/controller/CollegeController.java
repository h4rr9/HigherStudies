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

import entities.College;
import entities.Course;
import entities.Exam;
import models.CollegeModel;
import models.CourseModel;
import models.ExamModel;

/**
 * Servlet implementation class CollegeController
 */
public class CollegeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CollegeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException();
		}

		if (action == null) {
			out.println("action not specified");
		} else if (action.equals("add")) {
			String user = request.getParameter("user");
			String curruser = (String) session.getAttribute("user");
			
			if (curruser == null) {
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			} else if (curruser.equals(user)) {
				
				ExamModel examModel = new ExamModel(conn);
				try {
					ArrayList<Exam> exams= examModel.getAllExams();
					request.setAttribute("exams", exams);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				CourseModel courseModel = new CourseModel(conn);
				try {
					ArrayList<Course> courses= courseModel.getAllCourses();
					request.setAttribute("courses", courses);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("/adminaddcollege.jsp").forward(request, response);
			} else {
				response.sendRedirect("/HigherStudies/AdminController?action=login");
			}
		} else if (action.equals("edit")) {

			CollegeModel collegeModel = new CollegeModel(conn);

			String user = request.getParameter("user");
			String curruser = (String) session.getAttribute("user");
			try {
				if (curruser == null) {
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				} else if (curruser.equals(user)) {
					String collegename = request.getParameter("name");
					System.out.println("college name: " + collegename);
					College college = collegeModel.getCollege(collegename);
					System.out.println("college: " + college.toString());
					request.setAttribute("college", college);

					request.getRequestDispatcher("/admineditcollege.jsp").forward(request, response);
				} else {
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
		CollegeModel collegeModel = new CollegeModel(conn);
		HttpSession session = request.getSession();

		if (action == null) {
			out.println("Action not specified.");
		} else if (action.equals("create")) {
			String user = request.getParameter("user");
			String name = request.getParameter("name");
			String about = request.getParameter("about");
			String image = request.getParameter("image");
			String[] courses = request.getParameterValues("courses[]");
			String[] exams = request.getParameterValues("exams[]");

			College college = new College(name, about, image, courses, exams);

			String curruser = (String) session.getAttribute("user");

			try {
				if (curruser == null) {
					request.setAttribute("message", "Session expired");
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				} else if (curruser.equals(user)) {

					collegeModel.insert(college);
					response.sendRedirect("/HigherStudies/AdminController?action=colleges");

				} else {
					request.setAttribute("message", "Session expired");
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (action.equals("delete")) {
			try {
				String user = request.getParameter("user");
				String name = request.getParameter("name");

				String curruser = (String) session.getAttribute("user");

				if (curruser == null) {
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				} else if (curruser.equals(user)) {
					collegeModel.delete(name);
					response.sendRedirect("/HigherStudies/AdminController?action=colleges");
				} else {
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// Do something.
			}

		} else if (action.equals("edit")) {
			String user = request.getParameter("user");
			String tobemodified = request.getParameter("tobemodified");
			String name = request.getParameter("name");
			String about = request.getParameter("about");
			String image = request.getParameter("image");
			String[] courses = request.getParameterValues("courses[]");
			String[] exams = request.getParameterValues("exams[]");

			College college = new College(name, about, image, courses, exams);
			System.out.println("new college: " + college.toString());
			System.out.println("tobemodified: " + tobemodified);
			String curruser = (String) session.getAttribute("user");

			try {
				if (curruser == null) {
					request.setAttribute("message", "Session expired");
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				} else if (curruser.equals(user)) {

					collegeModel.update(tobemodified, college);
					response.sendRedirect("/HigherStudies/AdminController?action=colleges");

				} else {
					request.setAttribute("message", "Session expired");
					response.sendRedirect("/HigherStudies/AdminController?action=login");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			out.println("Unknown action " + action);
		}

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}

}
