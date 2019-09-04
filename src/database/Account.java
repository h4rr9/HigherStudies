package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.User;

public class Account {

	private Connection conn;

	public Account(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public String getFirstName(User user) throws SQLException {
		if(user.getFirstname().equals("")) {
			String sql = "SELECT firstname FROM users WHERE email=?";

			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

			stmt.setString(1, user.getEmail());

			ResultSet rs = stmt.executeQuery();

			String firstname = null;
			if (rs.next()) {
				firstname = rs.getString("firstname");
			}

			rs.close();
			
			return firstname;

		}
		else {
			return user.getFirstname();
		}
	}
	
	public boolean login(User user) throws SQLException {

		String sql = "SELECT COUNT(*) AS count FROM users WHERE email=? AND password=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, user.getEmail());
		stmt.setString(2, user.getPassword());

		ResultSet rs = stmt.executeQuery();

		int count = 0;
		if (rs.next()) {
			count = rs.getInt("count");
		}

		rs.close();
		
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	public boolean exists(User user) throws SQLException {
		String sql = "SELECT COUNT(*) AS count FROM users WHERE email=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, user.getEmail());

		ResultSet rs = stmt.executeQuery();

		int count = 0;
		if (rs.next()) {
			count = rs.getInt("count");
		}

		rs.close();

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	public void create(User user) throws SQLException {
		String sql = "INSERT INTO users (firstname, lastname, email, password, dob, number) VALUES(?, ?, ?, ?, ?, ?)";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, user.getFirstname());
		stmt.setString(2, user.getLastname());
		stmt.setString(3, user.getEmail());
		stmt.setString(4, user.getPassword());
		stmt.setString(5, user.getDob());
		stmt.setString(6, user.getNumber());

		stmt.executeUpdate();

		stmt.close();
	}
}
