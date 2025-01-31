<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: All Recent Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%
	User user = (User) session.getAttribute("UserObj");
	%>
	<%@ include file="all_component/navbar.jsp"%>
	<h1 class="text-center mt-3">Recent Books</h1>
	<div class="container my-3">
		<div class="row">
			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
			List<BookDetails> list = dao.getAllRecentBooks();
			for (BookDetails book : list) {
			%>
			<div class="col-md-3">
				<div class="card my-2 crd-ho">
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
							<a href="view_books.jsp?id=<%=book.getBookId()%>"
								class="btn btn-danger btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%><p>
							Categories:
							<%=book.getBookCategory()%></p>
						<div class="row">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a
								href="add_cart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?id=<%=book.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
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
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>