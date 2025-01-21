package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookCartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(request.getParameter("bid"));
			int userId = Integer.parseInt(request.getParameter("uid"));
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
			boolean flag = dao.deleteBook(bookId, userId);
			HttpSession session = request.getSession();
			if (flag) {
				session.setAttribute("success_msg", "Book removed from cart successfully...");
				response.sendRedirect("cart.jsp");
			} else {
				session.setAttribute("failed_msg", "Something wrong on server...");
				response.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
