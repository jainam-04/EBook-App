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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("full_name");
			String email = request.getParameter("email");
			String phoneNo = request.getParameter("phone_no");
			String password = request.getParameter("password");
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhone_no(phoneNo);
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
			HttpSession session = request.getSession();
			boolean flag = dao.checkPassword(id, password);
			if (flag) {
				flag = dao.updateProfile(user);
				if (flag) {
					session.setAttribute("success_msg", "Profile updated successfully...");
					response.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("failed_msg", "Something wrong on server...");
					response.sendRedirect("edit_profile.jsp");
				}
			} else {
				session.setAttribute("failed_msg", "Your password is incorrect...");
				response.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
