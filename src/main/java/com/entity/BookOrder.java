package com.entity;

public class BookOrder {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phoneNo;
	private String fullAddress;
	private String bookName;
	private String authorName;
	private String price;
	private String paymentType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public BookOrder(int id, String orderId, String userName, String email, String phoneNo, String fullAddress,
			String bookName, String authorName, String price, String paymentType) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.fullAddress = fullAddress;
		this.bookName = bookName;
		this.authorName = authorName;
		this.price = price;
		this.paymentType = paymentType;
	}

	public BookOrder() {
		super();
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phoneNo=" + phoneNo + ", fullAddress=" + fullAddress + ", bookName=" + bookName + ", authorName="
				+ authorName + ", price=" + price + ", paymentType=" + paymentType + "]";
	}
}
