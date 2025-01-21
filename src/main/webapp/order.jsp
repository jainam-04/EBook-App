<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Order</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container my-3">
		<h3 class="text-center">Your Order</h3>
		<table class="table table-striped">
			<thead class="text-white bg-primary">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>@mdo</td>
					<td>@mdo</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>