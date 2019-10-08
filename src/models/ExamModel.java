package models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Exam;

public class ExamModel {
	private Connection conn;

	public ExamModel(Connection conn) {
		super();
		this.conn = conn;
	}

	public void insert(Exam exam) throws SQLException {
		String sql = "INSERT INTO exams (name, about, portions, image) VALUES(?, ?, ?, ?)";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, exam.getName());
		stmt.setString(2, exam.getAbout());
		Array portions = conn.createArrayOf("VARCHAR", exam.getPortions());
		stmt.setArray(3, portions);
		stmt.setString(4, exam.getImage());
		stmt.executeUpdate();

		stmt.close();
	}

	public ArrayList<Exam> getAllExams() throws SQLException {

		ArrayList<Exam> exams = new ArrayList<Exam>();
		String sql = "SELECT * FROM exams";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String[] portions = (String[]) rs.getArray("portions").getArray();
			String image = rs.getString("image");

			exams.add(new Exam(name, about, image, portions));

		}

		rs.close();
		return exams;
	}
	
	public ArrayList<Exam> searchExams(String value) throws SQLException {

		ArrayList<Exam> exams = new ArrayList<Exam>();
		String sql = "SELECT * FROM exams WHERE LOWER(name) LIKE ?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		value = '%' + value.toLowerCase() + '%';
		stmt.setString(1, value);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String[] portions = (String[]) rs.getArray("portions").getArray();
			String image = rs.getString("image");

			exams.add(new Exam(name, about, image, portions));

		}

		rs.close();
		return exams;
	}

	public Exam getExam(String examname) throws SQLException {

		Exam exam = null;
		String sql = "SELECT * FROM exams WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, examname);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String[] portions = (String[]) rs.getArray("portions").getArray();
			String image = rs.getString("image");
			exam = new Exam(name, about, image,  portions);

		}

		rs.close();
		return exam;
	}

	public void delete(String name) throws SQLException {
		String sql = "DELETE FROM exams WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.executeUpdate();
		stmt.close();
	}

	public void update(String name, Exam exam) throws SQLException {
		String sql = "UPDATE exams SET name=?, about=?, portions=?, image=? WHERE name=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, exam.getName());
		stmt.setString(2, exam.getAbout());
		Array portions = conn.createArrayOf("VARCHAR", exam.getPortions());
		stmt.setArray(3, portions);
		stmt.setString(4, exam.getImage());
		stmt.setString(5, name);
		stmt.executeUpdate();

		stmt.close();
	}

}
