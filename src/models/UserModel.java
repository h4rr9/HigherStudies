package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.User;

public class UserModel {

	private Connection conn;

	public UserModel(Connection conn) {
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
	
	public ArrayList<User> getAllAccounts() throws SQLException {
		
		ArrayList<User> users = new ArrayList<User>();
		String sql = "SELECT * FROM users";
		PreparedStatement stmt = (PreparedStatement)conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			String firstname = rs.getString("firstname");
			String lastname = rs.getString("lastname");
			String email = rs.getString("email");
			String password = rs.getString("password");
			String dob = rs.getString("dob");
			String number = rs.getString("number");
			
			users.add(new User(firstname, lastname, email, password, dob, number));
			
		}
		
		rs.close();
		return users;
	}
	
	public void removeUser(String email) throws SQLException {
		String sql = "DELETE FROM users WHERE email=?";
		PreparedStatement stmt = (PreparedStatement)conn.prepareStatement(sql);
		stmt.setString(1, email);
		stmt.executeUpdate();
		stmt.close();
	}
}