<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center mt-3">Hello Admin</h3>
	<div class="container-fluid p-3">
		<table class="table table-striped">
			<thead class="bg-primary text-light">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConnection());
				List<BookOrder> list = dao.getAllOrderBook();
				for (BookOrder order : list) {
				%>
				<tr>
					<td><%=order.getOrderId()%></td>
					<td><%=order.getUserName()%></td>
					<td><%=order.getEmail()%></td>
					<td><%=order.getFullAddress()%></td>
					<td><%=order.getPhoneNo()%></td>
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
	<%@ include file="footer.jsp"%>
</body>
</html>