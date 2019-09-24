package entities;

import java.util.Arrays;

public class Course {
	private String name;
	private String about;
	private String prospects;
	private String image;
	public Course(String name, String about, String prospects, String image) {
		super();
		this.name = name;
		this.about = about;
		this.prospects = prospects;
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getProspects() {
		return prospects;
	}
	public void setProspects(String prospects) {
		this.prospects = prospects;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

		
}
