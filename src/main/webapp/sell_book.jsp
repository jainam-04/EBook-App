<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Sell Book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary p-1">Sell Old Book</h4>
						<c:if test="${not empty success_msg}">
							<p class="text-center text-success">${success_msg}</p>
							<c:remove var="success_msg" scope="session" />
						</c:if>
						<c:if test="${not empty failed_msg}">
							<p class="text-center text-danger">${failed_msg}</p>
							<c:remove var="failed_msg" scope="session" />
						</c:if>
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${UserObj.email}" name="email" />
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="book_name">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="exampleInputPassword1"
									name="author_name">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price <span
									class="text-danger">*</span></label> <input type="number"
									class="form-control" id="exampleInputPassword1" name="price">
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="book_image">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>