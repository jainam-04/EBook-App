package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(request.getParameter("id"));
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
			boolean flag = dao.deleteBooks(bookId);
			HttpSession session = request.getSession();
			if (flag) {
				session.setAttribute("success_msg", "Book deleted successfully...");
				response.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failed_msg", "Something wrong on server...");
				response.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
