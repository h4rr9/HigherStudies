package models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.College;
import entities.Course;

public class CourseModel {
	private Connection conn;

	public CourseModel(Connection conn) {
		super();
		this.conn = conn;
	}

	public void insert(Course course) throws SQLException {
		String sql = "INSERT INTO courses (name, about, prospects, image) VALUES(?, ?, ?, ?)";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, course.getName());
		stmt.setString(2, course.getAbout());
		stmt.setString(3, course.getProspects());
		stmt.setString(4, course.getImage());
		stmt.executeUpdate();

		stmt.close();
	}

	public ArrayList<Course> getAllCourses() throws SQLException {

		ArrayList<Course> courses = new ArrayList<Course>();
		String sql = "SELECT * FROM courses";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String prospects = rs.getString("prospects");
			String image = rs.getString("image");

			courses.add(new Course(name, about, prospects, image));

		}

		rs.close();
		return courses;
	}
	
	public ArrayList<Course> searchCourses(String value) throws SQLException {

		ArrayList<Course> courses = new ArrayList<Course>();
		String sql = "SELECT * FROM courses WHERE LOWER(name) LIKE ?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		value = '%' + value.toLowerCase() + '%';
		stmt.setString(1, value);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String prospects = rs.getString("prospects");
			String image = rs.getString("image");

			courses.add(new Course(name, about, prospects, image));

		}

		rs.close();
		return courses;
	}

	public Course getCourse(String coursename) throws SQLException {

		Course course = null;
		String sql = "SELECT * FROM courses WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, coursename);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String prospects = rs.getString("prospects");
			String image = rs.getString("image");

			course = new Course(name, about, prospects, image);

		}

		rs.close();
		return course;
	}

	public void delete(String name) throws SQLException {
		String sql = "DELETE FROM courses WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.executeUpdate();
		stmt.close();
	}

	public void update(String name, Course course) throws SQLException {
		String sql = "UPDATE courses SET name=?, about=?, prospects=?, image=? WHERE name=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, course.getName());
		stmt.setString(2, course.getAbout());
		stmt.setString(3, course.getProspects());
		stmt.setString(4, course.getImage());
		stmt.setString(5, name);
		stmt.executeUpdate();

		stmt.close();
	}

}
