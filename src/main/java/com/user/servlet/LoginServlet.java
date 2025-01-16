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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			if (email.equals("admin@gmail.com") && password.equals("admin")) {
				User user = new User();
				user.setName("admin");
				session.setAttribute("UserObj", user);
				response.sendRedirect("admin/home.jsp");
			} else {
				User user = dao.login(email, password);
				if (user != null) {
					session.setAttribute("UserObj", user);
					response.sendRedirect("home.jsp");
				} else {
					session.setAttribute("failed_msg", "Email and Password are incorrect...");
					response.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
