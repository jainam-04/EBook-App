package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			if(i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
