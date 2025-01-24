<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Order Success</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container mt-3 text-center" style="margin-bottom: 27.8vh;">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You!!</h1>
		<h2>Your order is successful...</h2>
		<h5>Within 7 days your product will be delivered on your address.</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>