<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Cart</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${not empty success_msg}">
		<div class="alert alert-success text-center" role="alert">${success_msg}</div>
		<c:remove var="success_msg" scope="session" />
	</c:if>
	<c:if test="${not empty failed_msg}">
		<div class="alert alert-danger text-center" role="alert">${failed_msg}</div>
		<c:remove var="failed_msg" scope="session" />
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body bg-white">
						<h3 class="text-center text-success mb-3">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author Name</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("UserObj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
								List<Cart> list = dao.getBookByUser(user.getId());
								double totalPrice = 0.0;
								for (Cart cart : list) {
									totalPrice = cart.getTotalPrice();
								%>
								<tr>
									<td><%=cart.getBookName()%></td>
									<td><%=cart.getAuthorName()%></td>
									<td><%=cart.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=cart.getBookId()%>&&uid=<%=cart.getUserId()%>&&cid=<%=cart.getCartId()%>"
										class="btn btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success mb-3">Your Details for
							Order</h3>
						<form action="order" method="post">
							<input type="hidden" value="<%=user.getId()%>" name="id" />
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" value="<%=user.getName()%>" name="name" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" value="<%=user.getEmail()%>" name="email" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile Number</label> <input
										type="number" class="form-control"
										value="<%=user.getPhone_no()%>" name="phone_no" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" name="address" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" name="landmark" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" name="city" required="required">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" name="state" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip Code</label> <input
										type="number" class="form-control" name="zip_code"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment_type">
									<option value="no_select">--Select--</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>