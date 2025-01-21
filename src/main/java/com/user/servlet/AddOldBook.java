package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookName = request.getParameter("book_name");
			String authorName = request.getParameter("author_name");
			String price = request.getParameter("price");
			String bookCategories = "Old";
			String bookStatus = "Active";
			String userEmail = request.getParameter("email");
			Part part = request.getPart("book_image");
			String fileName = part.getSubmittedFileName();
			BookDetails bookDetails = new BookDetails();
			bookDetails.setBookName(bookName);
			bookDetails.setAuthorName(authorName);
			bookDetails.setPrice(price);
			bookDetails.setBookCategory(bookCategories);
			bookDetails.setStatus(bookStatus);
			bookDetails.setPhoto(fileName);
			bookDetails.setEmail(userEmail);
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
			boolean flag = dao.addBooks(bookDetails);
			HttpSession session = request.getSession();
			if (flag) {
				String path = getServletContext().getRealPath("") + "book";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("success_msg", "Book added successfully...");
				response.sendRedirect("sell_book.jsp");
			} else {
				session.setAttribute("failed_msg", "Something wrong on server...");
				response.sendRedirect("sell_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
