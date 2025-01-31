<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Settings</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container" style="margin-bottom: 4.7vh;">
		<h2 class="text-center mt-3">Hello ${UserObj.name}</h2>
		<div class="row p-4">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fas fa-book-open fa-3x text-primary"></i>
							<h3 class="mt-2">Sell Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fas fa-book-open fa-3x text-primary"></i>
							<h3 class="mt-2">Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fas fa-address-card fa-3x text-primary"></i>
							<h3 class="mt-2">Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fas fa-box-open fa-3x text-danger"></i>
							<h4 class="mt-2">My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fas fa-user-circle fa-3x text-primary"></i>
							<h4 class="mt-2">Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>