package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String name = request.getParameter("full_name");
			String email = request.getParameter("email");
			String phone_no = request.getParameter("phone_no");
			String password = request.getParameter("password");
			String check_box = request.getParameter("check");
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhone_no(phone_no);
			user.setPassword(password);
			if (check_box != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
				boolean flag = dao.userRegister(user);
				if (flag) {
					session.setAttribute("success_msg", "User registered successfully...");
					response.sendRedirect("register.jsp");
				} else {
					session.setAttribute("failed_msg", "Something went wrong on server...");
					response.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("check_box_msg", "Please Check Terms & Conditions...");
				response.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
