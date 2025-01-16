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
import com.entity.BookDetails;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("book_name");
			String authorName = request.getParameter("author_name");
			String price = request.getParameter("price");
			String status = request.getParameter("book_status");
			BookDetails book = new BookDetails();
			book.setBookId(bookId);
			book.setBookName(bookName);
			book.setAuthorName(authorName);
			book.setPrice(price);
			book.setStatus(status);
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
			boolean flag = dao.updateEditBooks(book);
			HttpSession session = request.getSession();
			if (flag) {
				session.setAttribute("success_msg", "Book updated successfully...");
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
