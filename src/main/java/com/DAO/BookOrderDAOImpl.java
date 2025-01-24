package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
