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
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	height: 50vh;
	width: 100%
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img bg-white">
		<h2 class="text-center text-danger">EBook Management System</h2>
	</div>
	<!-- Recent Book Start -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BooksDAOImpl dao1 = new BooksDAOImpl(DBConnect.getConnection());
			List<BookDetails> list1 = dao1.getRecentBooks();
			for (BookDetails book : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthorName()%></p>
						<p>
							<%
							if (book.getBookCategory().equals("Old")) {
							%>
							Categories:
							<%=book.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:
						<%=book.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-1">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View Details</a>
		</div>
	</div>
	<!-- Recent Book End -->

	<hr>

	<!-- New Book Start -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BooksDAOImpl dao2 = new BooksDAOImpl(DBConnect.getConnection());
			List<BookDetails> list2 = dao2.getNewBooks();
			for (BookDetails book : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthorName()%></p>
						<p>
							Categories:
							<%=book.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View Details</a>
		</div>
	</div>
	<!-- New Book End -->

	<hr>

	<!-- Old Book Start -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BooksDAOImpl dao3 = new BooksDAOImpl(DBConnect.getConnection());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails book : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthorName()%></p>
						<p>
							Categories:
							<%=book.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="" class="btn btn-danger btn-sm text-white">View Details</a>
		</div>
	</div>
	<!-- Old Book End -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>