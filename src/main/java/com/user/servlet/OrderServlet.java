package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phoneNo = request.getParameter("phone_no");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zipCode = request.getParameter("zip_code");
			String paymentMode = request.getParameter("payment_type");
			String fullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + zipCode;
			CartDAOImpl dao1 = new CartDAOImpl(DBConnect.getConnection());
			List<Cart> list1 = dao1.getBookByUser(id);
			HttpSession session = request.getSession();
			if (list1.isEmpty()) {
				session.setAttribute("failed_msg", "Add Book Item...");
				response.sendRedirect("cart.jsp");
			} else {
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnect.getConnection());
				BookOrder order = null;
				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
				Random random = new Random();
				for (Cart cart : list1) {
					order = new BookOrder();
					order.setOrderId("BOOK-ORD-00" + random.nextInt(1000));
					order.setUserName(name);
					order.setEmail(email);
					order.setPhoneNo(phoneNo);
					order.setFullAddress(fullAddress);
					order.setBookName(cart.getBookName());
					order.setAuthorName(cart.getAuthorName());
					order.setPrice(cart.getPrice() + "");
					order.setPaymentType(paymentMode);
					orderList.add(order);
				}
				if (paymentMode.equals("no_select")) {
					session.setAttribute("failed_msg", "Please choose your payment method...");
					response.sendRedirect("cart.jsp");
				} else {
					boolean flag = dao2.saveOrder(orderList);
					if (flag) {
						response.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failed_msg", "Something wrong on server...");
						response.sendRedirect("cart.jsp");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
