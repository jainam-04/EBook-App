<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: User Address</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success p-1">Add Address</h4>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip Code</label> <input
										type="number" class="form-control">
								</div>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Add Address</button>
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