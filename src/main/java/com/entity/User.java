package com.entity;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String phone_no;
	private String address;
	private String landmark;
	private String city;
	private String state;
	private int zip_code;

	public User(int id, String name, String email, String password, String phone_no, String address, String landmark,
			String city, String state, int zip_code) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone_no = phone_no;
		this.address = address;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.zip_code = zip_code;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZip_code() {
		return zip_code;
	}

	public void setZip_code(int zip_code) {
		this.zip_code = zip_code;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phone_no="
				+ phone_no + ", address=" + address + ", landmark=" + landmark + ", city=" + city + ", state=" + state
				+ ", zip_code=" + zip_code + "]";
	}
}
