package entities;

import java.util.Arrays;

public class College {
	private String name;
	private String about;
	private String image;
	private String[] courses;
	private String[] exams;

	public College(String name, String about, String image, String[] courses, String[] exams) {
		super();
		this.name = name;
		this.about = about;
		this.image = image;
		this.courses = courses;
		this.exams = exams;
	}

	@Override
	public String toString() {
		return "College [name=" + name + ", about=" + about + ", image=" + image + ", courses="
				+ Arrays.toString(courses) + ", exams=" + Arrays.toString(exams) + "]";
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String[] getCourses() {
		return courses;
	}

	public void setCourses(String[] courses) {
		this.courses = courses;
	}

	public String[] getExams() {
		return exams;
	}

	public void setExams(String[] exams) {
		this.exams = exams;
	}
}
