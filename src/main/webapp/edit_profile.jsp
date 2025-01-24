<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Edit Profile</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%
	User user = (User) session.getAttribute("UserObj");
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary p-1">Edit Profile</h4>
						<c:if test="${not empty success_msg}">
							<h5 class="text-center text-success">${success_msg}</h5>
							<c:remove var="success_msg" scope="session" />
						</c:if>
						<c:if test="${not empty failed_msg}">
							<h5 class="text-center text-danger">${failed_msg}</h5>
							<c:remove var="failed_msg" scope="session" />
						</c:if>
						<form action="update_profile" method="post">
							<input type="hidden" value="<%=user.getId()%>" name="id" />
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="full_name" value="<%=user.getName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="<%=user.getEmail()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="phone_no" value="<%=user.getPhone_no()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password">
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>