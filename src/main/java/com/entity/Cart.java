package com.entity;

public class Cart {
	private int cartId;
	private int bookId;
	private int userId;
	private String bookName;
	private String authorName;
	private double price;
	private double totalPrice;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Cart(int cartId, int bookId, int userId, String bookName, String authorName, double price,
			double totalPrice) {
		super();
		this.cartId = cartId;
		this.bookId = bookId;
		this.userId = userId;
		this.bookName = bookName;
		this.authorName = authorName;
		this.price = price;
		this.totalPrice = totalPrice;
	}

	public Cart() {
		super();
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", bookId=" + bookId + ", userId=" + userId + ", bookName=" + bookName
				+ ", authorName=" + authorName + ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}
}
