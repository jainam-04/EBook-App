package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
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

	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = null;
		double totalPrice = 0;
		try {
			String sql = "select * from cart where user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cart = new Cart();
				cart.setCartId(rs.getInt(1));
				cart.setBookId(rs.getInt(2));
				cart.setUserId(rs.getInt(3));
				cart.setBookName(rs.getString(4));
				cart.setAuthorName(rs.getString(5));
				cart.setPrice(rs.getDouble(6));
				totalPrice = totalPrice + rs.getDouble(7);
				cart.setTotalPrice(totalPrice);
				list.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int bookId, int userId, int cartId) {
		boolean flag = false;
		try {
			String sql = "delete from cart where book_id = ? and user_id = ? and cart_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookId);
			ps.setInt(2, userId);
			ps.setInt(3, cartId);
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
