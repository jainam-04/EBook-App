<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
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
	<div class="container-fluid" style="margin-bottom: 5vh;">
		<table class="table table-striped">
			<thead class="bg-primary text-light">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Category</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
				List<BookDetails> list = dao.getAllBooks();
				for (BookDetails book : list) {
				%>
				<tr>
					<td><%=book.getBookId()%></td>
					<td><img src="../book/<%=book.getPhoto()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=book.getBookName()%></td>
					<td><%=book.getAuthorName()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getBookCategory()%></td>
					<td><%=book.getStatus()%></td>
					<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
						href="#" class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>