package models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Material;

public class MaterialModel {
	private Connection conn;

	public MaterialModel(Connection conn) {
		super();
		this.conn = conn;
	}

	public void insert(Material material) throws SQLException {
		String sql = "INSERT INTO materials (name, about, image, resources) VALUES(?, ?, ?, ?)";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, material.getName());
		stmt.setString(2, material.getAbout());
		stmt.setString(3, material.getImage());
		Array references = conn.createArrayOf("VARCHAR", material.getReferences());
		stmt.setArray(4, references);
		stmt.executeUpdate();

		stmt.close();
	}

	public ArrayList<Material> getAllMaterials() throws SQLException {

		ArrayList<Material> materials = new ArrayList<Material>();
		String sql = "SELECT * FROM materials";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String image = rs.getString("image");
			String[] references = (String[]) rs.getArray("resources").getArray();

			materials.add(new Material(name, about, image, references));

		}

		rs.close();
		return materials;
	}

	public Material getMaterial(String materialname) throws SQLException {

		Material material = null;
		String sql = "SELECT * FROM materials WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, materialname);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			String about = rs.getString("about");
			String image = rs.getString("image");
			String[] references = (String[]) rs.getArray("resources").getArray();

			material = new Material(name, about, image, references);

		}

		rs.close();
		return material;
	}

	public void delete(String name) throws SQLException {
		String sql = "DELETE FROM materials WHERE name=?";
		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.executeUpdate();
		stmt.close();
	}

	public void update(String name, Material material) throws SQLException {
		String sql = "UPDATE materials SET name=?, about=?, image=?, resources=? WHERE name=?";

		PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);

		stmt.setString(1, material.getName());
		stmt.setString(2, material.getAbout());
		stmt.setString(3, material.getImage());
		Array references = conn.createArrayOf("VARCHAR", material.getReferences());
		stmt.setArray(4, references);
		stmt.setString(5, name);
		stmt.executeUpdate();

		stmt.close();
	}

}
