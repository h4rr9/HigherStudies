package entities;

public class Material {
	private String name;
	private String image;
	private String about;
	private String[] references;

	public Material(String name, String image, String about, String[] references) {
		super();
		this.name = name;
		this.image = image;
		this.about = about;
		this.references = references;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String[] getReferences() {
		return references;
	}

	public void setReferences(String[] references) {
		this.references = references;
	}

}
