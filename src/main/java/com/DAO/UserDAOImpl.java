package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection con;

	public UserDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	public boolean userRegister(User user) {
		boolean flag = false;
		try {
			String sql = "insert into user (name, email, phone_no, password) values(?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone_no());
			ps.setString(4, user.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public User login(String email, String password) {
		User user = null;
		try {
			String sql = "select * from user where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone_no(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setLandmark(rs.getString(7));
				user.setCity(rs.getString(8));
				user.setState(rs.getString(9));
				user.setZip_code(rs.getInt(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean checkPassword(int id, String password) {
		boolean flag = false;
		try {
			String sql = "select * from user where id = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updateProfile(User user) {
		boolean flag = false;
		try {
			String sql = "update user set name = ?, email = ?, phone_no = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone_no());
			ps.setInt(4, user.getId());
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
