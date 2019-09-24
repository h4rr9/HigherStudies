package models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.College;
import entities.User;

public class CollegeModel {
	private Connection conn;

	public CollegeModel(Connection conn) {
		super();
		this.conn = conn;
	}

	public void insert(College college) throws SQLException {
		String sql = "INSERT INTO colleges (name, about, image, courses, exams) VALUES(?, ?, ?, ?, ?)";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, college.getName());
		stmt.setString(2, college.getAbout());
		stmt.setString(3, college.getImage());
		Array courses = conn.createArrayOf("VARCHAR", college.getCourses());
		stmt.setArray(4, courses);
		Array exams = conn.createArrayOf("VARCHAR", college.getExams());
		stmt.setArray(5, exams);
		stmt.executeUpdate();

		stmt.close();
	}

	public ArrayList<College> getAllColleges() throws SQLException {

		ArrayList<College> colleges = new ArrayList<College>();
		String sql = "SELECT * FROM colleges";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String image = rs.getString("image");
			String[] courses = (String[]) rs.getArray("courses").getArray();
			String[] exams = (String[]) rs.getArray("exams").getArray();

			colleges.add(new College(name, about, image, courses, exams));

		}

		rs.close();
		return colleges;
	}

	public College getCollege(String collegename) throws SQLException {

		College college = null;
		String sql = "SELECT * FROM colleges WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, collegename);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String image = rs.getString("image");
			String[] courses = (String[]) rs.getArray("courses").getArray();
			String[] exams = (String[]) rs.getArray("exams").getArray();

			college = new College(name, about, image, courses, exams);

		}

		rs.close();
		return college;
	}

	public void delete(String name) throws SQLException {
		String sql = "DELETE FROM colleges WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.executeUpdate();
		stmt.close();
	}

	public void update(String name, College college) throws SQLException {
		String sql = "UPDATE colleges SET name=?, about=?, image=?, courses=?, exams=? WHERE name=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, college.getName());
		stmt.setString(2, college.getAbout());
		stmt.setString(3, college.getImage());
		Array courses = conn.createArrayOf("VARCHAR", college.getCourses());
		stmt.setArray(4, courses);
		Array exams = conn.createArrayOf("VARCHAR", college.getExams());
		stmt.setArray(5, exams);
		stmt.setString(6, name);
		stmt.executeUpdate();

		stmt.close();
	}

}
