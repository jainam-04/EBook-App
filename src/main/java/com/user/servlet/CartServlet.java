package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/add_cart")
public class CartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(request.getParameter("bid"));
			int userId = Integer.parseInt(request.getParameter("uid"));
			BooksDAOImpl dao1 = new BooksDAOImpl(DBConnect.getConnection());
			BookDetails book = dao1.getBookById(bookId);
			Cart cart = new Cart();
			cart.setBookId(bookId);
			cart.setUserId(userId);
			cart.setBookName(book.getBookName());
			cart.setAuthorName(book.getAuthorName());
			cart.setPrice(Double.parseDouble(book.getPrice()));
			cart.setTotalPrice(Double.parseDouble(book.getPrice()));
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConnection());
			boolean flag = dao2.addCart(cart);
			HttpSession session = request.getSession();
			if (flag) {
				session.setAttribute("success_msg", "Cart added successfully...");
				response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failed_msg", "Something wrong on server...");
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
