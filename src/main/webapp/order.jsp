<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Order</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<h3 class="text-center mt-3">Your Orders</h3>
	<div class="container p-3">
		<table class="table table-striped">
			<thead class="text-white bg-primary">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User user = (User) session.getAttribute("UserObj");
				String email = user.getEmail();
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConnection());
				List<BookOrder> list = dao.getBook(email);
				for (BookOrder order : list) {
				%>
				<tr>
					<td><%=order.getOrderId()%></td>
					<td><%=order.getUserName()%></td>
					<td><%=order.getBookName()%></td>
					<td><%=order.getAuthorName()%></td>
					<td><%=order.getPrice()%></td>
					<td><%=order.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>