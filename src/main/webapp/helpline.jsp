<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Help Center</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container mt-5" style="margin-bottom: 23vh;">
		<div class="row">
			<div class="col-md-4 offset-md-4 text-center">
				<i class="fas fa-phone-square-alt fa-5x text-success my-2"></i>
				<h3 class="my-2">24*7 Service</h3>
				<h4 class="my-2">Helpline Number</h4>
				<h5 class="my-2">+91 9021469439</h5>
				<a href="index.jsp" class="btn btn-primary my-2">Home</a>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>