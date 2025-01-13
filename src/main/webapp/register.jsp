<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-4" style="margin-bottom: 5.3vh;">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						<%
						String success_msg = (String) session.getAttribute("success_msg");
						String failed_msg = (String) session.getAttribute("failed_msg");
						String check_box_msg = (String) session.getAttribute("check_box_msg");
						if (success_msg != null && success_msg.equals("User registered successfully...")) {
							out.println("<p class='text-center text-success'>" + success_msg + "</p>");
							session.invalidate();
						}
						if (failed_msg != null && failed_msg.equals("Something went wrong on server...")) {
							out.println("<p class='text-center text-danger'>" + failed_msg + "</p>");
							session.invalidate();
						}
						if (check_box_msg != null && check_box_msg.equals("Please Check Terms & Conditons...")) {
							out.println("<p class='text-center text-danger'>" + check_box_msg + "</p>");
							session.invalidate();
						}
						%>
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="full_name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No.</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									name="phone_no">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms & Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>