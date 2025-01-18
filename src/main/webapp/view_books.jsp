<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Book Details</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
	BookDetails book = dao.getBookById(id);
	%>
	<div class="container p-3 mt-4" style="margin-bottom: 7.8vh;">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book/<%=book.getPhoto()%>"
					style="height: 200px; width: 150px;">
				<h4 class="mt-3">
					Book Name : <span class="text-success"><%=book.getBookName()%></span>
				</h4>
				<h4>
					Author Name : <span class="text-success"><%=book.getAuthorName()%></span>
				</h4>
				<h4>
					Category : <span class="text-success"><%=book.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=book.getBookName()%></h2>
				<%
				if (book.getBookCategory().equals("Old")) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i> Email :
					<%=book.getEmail()%></h5>
				<%
				}
				%>
				<div class="row mt-3">
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-money-bill-wave fa-3x"></i>
						<p>Cash on delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-undo-alt fa-3x"></i>
						<p>Return available</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-truck-moving fa-3x"></i>
						<p>Free delivery</p>
					</div>
				</div>
				<%
				if (book.getBookCategory().equals("Old")) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a> <a
						class="btn btn-danger text-white"><%=book.getPrice()%> <i
						class="fas fa-rupee-sign"></i></a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Add Cart</a> <a class="btn btn-danger text-white"><%=book.getPrice()%>
						<i class="fas fa-rupee-sign"></i></a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>