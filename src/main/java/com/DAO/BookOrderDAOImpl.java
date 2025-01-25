package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderDAOImpl implements BookOrderDAO {
	private Connection con;

	public BookOrderDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	public BookOrderDAOImpl() {
		super();
	}

	public boolean saveOrder(List<BookOrder> list) {
		boolean flag = false;
		try {
			String sql = "insert into book_order (order_id, user_name, email, address, phone_no, book_name, author_name, price, payment_type) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(sql);
			for (BookOrder order : list) {
				ps.setString(1, order.getOrderId());
				ps.setString(2, order.getUserName());
				ps.setString(3, order.getEmail());
				ps.setString(4, order.getFullAddress());
				ps.setString(5, order.getPhoneNo());
				ps.setString(6, order.getBookName());
				ps.setString(7, order.getAuthorName());
				ps.setString(8, order.getPrice());
				ps.setString(9, order.getPaymentType());
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			con.commit();
			flag = true;
			con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<BookOrder> getBook(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder order = null;
		try {
			String sql = "select * from book_order where email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new BookOrder();
				order.setId(rs.getInt(1));
				order.setOrderId(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFullAddress(rs.getString(5));
				order.setPhoneNo(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthorName(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPaymentType(rs.getString(10));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookOrder> getAllOrderBook() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder order = null;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new BookOrder();
				order.setId(rs.getInt(1));
				order.setOrderId(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFullAddress(rs.getString(5));
				order.setPhoneNo(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthorName(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPaymentType(rs.getString(10));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
