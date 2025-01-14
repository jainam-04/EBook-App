<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<div class="container-fluid" style="margin-bottom: 40.5vh;">
		<table class="table table-striped">
			<thead class="bg-primary text-light">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Category</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
						href="#" class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
						href="#" class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
						href="#" class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>