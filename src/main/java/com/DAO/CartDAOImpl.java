package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection con;

	public CartDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	public boolean addCart(Cart cart) {
		boolean flag = false;
		try {
			String sql = "insert into cart (book_id, user_id, book_name, author_name, price, total_price) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cart.getBookId());
			ps.setInt(2, cart.getUserId());
			ps.setString(3, cart.getBookName());
			ps.setString(4, cart.getAuthorName());
			ps.setDouble(5, cart.getPrice());
			ps.setDouble(6, cart.getTotalPrice());
			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
