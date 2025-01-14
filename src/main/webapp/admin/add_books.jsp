<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<form>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price <span
									class="text-danger">*</span></label> <input type="number"
									class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" class="form-control">
									<option selected>--Select--</option>
									<option>New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" class="form-control">
									<option selected>--Select--</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>