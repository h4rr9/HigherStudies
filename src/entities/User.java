package entities;

public class User {
	String firstname = "";
	String lastname = "";
	String email = "";
	String password = "";
	String dob = "";
	String number = "";
	String message = "";

	public User() {

	}

	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public User(String firstname, String lastname, String email, String password, String dob, String number) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.number = number;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean validate() {

		if (!email.matches("\\w+@\\w+\\.\\w+")) {
			setMessage("Invalid email address");
			return false;
		} else if (password.length() < 8) {
			setMessage("Password must be at least 8 characters");
			return false;
		} else if (password.matches("\\w*\\s+\\w*")) {
			setMessage("Password cannot contain space");
			return false;
		}
		else if(!password.matches("^(?=.*[A-Z].)(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$")) {
			setMessage("Password is not strong enough");
			return false;
		}

		return true;

	}

	@Override
	public String toString() {
		return "User [firstname=" + firstname + ", lastname=" + lastname + ", email=" + email + ", password=" + password
				+ ", dob=" + dob + ", number=" + number + ", message=" + message + "]";
	}
	
}
