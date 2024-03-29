package entities;

import java.io.Serializable;
import java.util.Arrays;

@SuppressWarnings("serial")
public class Course implements Serializable{
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

	@Override
	public String toString() {
		return "Course [name=" + name + ", about=" + about + ", prospects=" + prospects + ", image=" + image + "]";
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
