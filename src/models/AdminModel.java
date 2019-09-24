package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Admin;

public class AdminModel {
	private Connection conn;

	public AdminModel(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean login(Admin admin) throws SQLException {
		String sql = "SELECT COUNT(*) AS count FROM admins WHERE username=? AND password=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, admin.getUsername());
		stmt.setString(2, admin.getPassword());

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
}
