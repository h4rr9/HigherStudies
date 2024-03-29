package entities;

import java.io.Serializable;
import java.util.Arrays;

@SuppressWarnings("serial")
public class Exam implements Serializable{
	private String name;
	private String about;
	private String image;
	private String[] portions;

	public Exam(String name, String about, String image, String[] portions) {
		super();
		this.name = name;
		this.about = about;
		this.image = image;
		this.portions = portions;
	}

	@Override
	public String toString() {
		return "Exam [name=" + name + ", about=" + about + ", image=" + image + ", portions="
				+ Arrays.toString(portions) + "]";
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

	public String[] getPortions() {
		return portions;
	}

	public void setPortions(String[] portions) {
		this.portions = portions;
	}

}
