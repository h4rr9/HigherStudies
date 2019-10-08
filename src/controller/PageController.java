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
import javax.sql.DataSource;

import entities.College;
import entities.Course;
import entities.Exam;
import entities.Material;
import models.CollegeModel;
import models.CourseModel;
import models.ExamModel;
import models.MaterialModel;

/**
 * Servlet implementation class PageController
 */
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PageController() {
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

		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException();
		}

		String type = request.getParameter("type");

		if (type == null) {
			out.println("type not specified.");
		} else {
			if (type.equals("college")) {
				String page = request.getParameter("page");

				CollegeModel collegeModel = new CollegeModel(conn);

				try {
					College college = collegeModel.getCollege(page);

					if (college == null) {
						out.println("college not found.");
						return;
					}

					request.setAttribute("college", college);
					request.getRequestDispatcher("/college.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equals("course")) {
				String page = request.getParameter("page");

				CourseModel courseModel = new CourseModel(conn);

				try {
					Course course = courseModel.getCourse(page);

					if (course == null) {
						out.println("course not found.");
						return;
					}

					request.setAttribute("course", course);
					request.getRequestDispatcher("/course.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if (type.equals("exam")) {
				String page = request.getParameter("page");

				ExamModel examModel = new ExamModel(conn);

				try {
					Exam exam = examModel.getExam(page);

					if (exam == null) {
						out.println("exam not found.");
						return;
					}

					request.setAttribute("exam", exam);
					request.getRequestDispatcher("/exam.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if (type.equals("material")) {
				String page = request.getParameter("page");

				MaterialModel materialModel = new MaterialModel(conn);

				try {
					Material material = materialModel.getMaterial(page);

					if (material == null) {
						out.println("material not found.");
						return;
					}

					request.setAttribute("material", material);
					request.getRequestDispatcher("/material.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {
				out.println("unknown type.");
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
		doGet(request, response);
	}

}
