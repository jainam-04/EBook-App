package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
			boolean flag = dao.deleteBooks(id);
			HttpSession session = request.getSession();
			if (flag) {
				session.setAttribute("success_msg", "Old book deleted successfully...");
				response.sendRedirect("old_book.jsp");
			} else {
				session.setAttribute("failed_msg", "Something wrong on server...");
				response.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
