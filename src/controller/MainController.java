package controller;

import java.io.FileInputStream;
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
import entities.Material;
import entities.User;
import models.CollegeModel;
import models.CourseModel;
import models.ExamModel;
import models.MaterialModel;
import models.UserModel;

/**
 * Servlet implementation class Controller
 */
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainController() {
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

		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");

		if (action == null) {
			response.sendRedirect("/HigherStudies");
		} else if (action.equals("signup")) {
			request.setAttribute("firstname", "");
			request.setAttribute("lastname", "");
			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("repeatpassword", "");
			request.setAttribute("dob", "");
			request.setAttribute("number", "");
			request.setAttribute("message", "");
			request.getRequestDispatcher("/signup.jsp").forward(request, response);
		} else if (action.equals("login")) {
			request.setAttribute("email", "");
			request.setAttribute("message", "");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (action.equals("search")) {
			request.getRequestDispatcher("/search.jsp").forward(request, response);
		} else if (action.equals("materials")) {
			Connection conn = null;
			try {
				conn = ds.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw new ServletException();
			}

			MaterialModel materialModel = new MaterialModel(conn);

			try {
				ArrayList<Material> materialArray = materialModel.getAllMaterials();
				request.setAttribute("materials", materialArray);
				request.getRequestDispatcher("/studymaterials.jsp").forward(request, response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (action.equals("getfile")) {
			response.setContentType("text/html");
			String filename = "materials.zip";
			String filepath = "D:\\java workspace\\MaterialFiles\\";
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

			FileInputStream fileInputStream = new FileInputStream(filepath + filename);

			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
			
			request.getRequestDispatcher("/studymaterials.jsp").forward(request, response);
		} else {
			out.println("Unknown action.");
			return;
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

		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		UserModel userModel = new UserModel(conn);

		if (action == null) {
			response.sendRedirect("/HigherStudies");
		} else if (action.equals("createaccount")) {
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatpassword");
			String dob = request.getParameter("dob");
			String number = request.getParameter("number");

			if (!password.equals(repeatPassword)) {
				request.setAttribute("firstname", firstname);
				request.setAttribute("lastname", lastname);
				request.setAttribute("email", email);
				request.setAttribute("password", password);
				request.setAttribute("repeatpassword", repeatPassword);
				request.setAttribute("dob", dob);
				request.setAttribute("number", number);
				request.setAttribute("message", "Passwords do not match.");
				request.getRequestDispatcher("/signup.jsp").forward(request, response);
			} else {
				User user = new User(firstname, lastname, email, password, dob, number);

				if (!user.validate()) {
					request.setAttribute("firstname", firstname);
					request.setAttribute("lastname", lastname);
					request.setAttribute("email", email);
					request.setAttribute("password", password);
					request.setAttribute("repeatpassword", repeatPassword);
					request.setAttribute("dob", dob);
					request.setAttribute("number", number);
					request.setAttribute("message", user.getMessage());
					request.getRequestDispatcher("/signup.jsp").forward(request, response);
				} else {
					try {
						if (userModel.exists(user)) {
							request.setAttribute("firstname", firstname);
							request.setAttribute("lastname", lastname);
							request.setAttribute("email", email);
							request.setAttribute("password", password);
							request.setAttribute("repeatpassword", repeatPassword);
							request.setAttribute("dob", dob);
							request.setAttribute("number", number);
							request.setAttribute("message", "An account with this email already exists.");
							request.getRequestDispatcher("/signup.jsp").forward(request, response);
						} else {
							userModel.create(user);
							request.setAttribute("email", "");
							request.setAttribute("message", "");
							request.getRequestDispatcher("/login.jsp").forward(request, response);
						}
					} catch (SQLException e) {
						e.printStackTrace();
						request.getRequestDispatcher("/error.jsp").forward(request, response);
					}
				}
			}

		} else if (action.equals("dologin")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			User user = new User(email, password);

			request.setAttribute("email", email);
			request.setAttribute("password", "");

			try {
				if (userModel.login(user)) {
					HttpSession session = request.getSession();

					String firstname = userModel.getFirstName(user);
					session.setAttribute("user", firstname);

					request.getRequestDispatcher("/search.jsp").forward(request, response);
				} else {
					request.setAttribute("message", "Email or Password not recognised");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// Do something.
			}

		} else if (action.equals("search")) {
			CollegeModel collegeModel = new CollegeModel(conn);
			CourseModel courseModel = new CourseModel(conn);
			ExamModel examModel = new ExamModel(conn);
			MaterialModel materialModel = new MaterialModel(conn);

			String value = request.getParameter("searchparameter");

			try {
				ArrayList<College> collegeList = collegeModel.searchColleges(value);
				ArrayList<Course> courseList = courseModel.searchCourses(value);
				ArrayList<Exam> examList = examModel.searchExams(value);

				request.setAttribute("colleges", collegeList);
				request.setAttribute("courses", courseList);
				request.setAttribute("exams", examList);

				request.getRequestDispatcher("/searchresults.jsp").forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			out.println("Unknown action.");
			return;
		}

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
