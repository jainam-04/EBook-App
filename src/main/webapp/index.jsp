<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%
	User user = (User) session.getAttribute("UserObj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty success_msg}">
		<div id="toast">${success_msg}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>
		<c:remove var="success_msg" scope="session" />
	</c:if>
	<c:if test="${not empty failed_msg}">
		<h4 class="text-center text-danger">${failed_msg}</h4>
		<c:remove var="failed_msg" scope="session" />
	</c:if>
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
							<a href="view_books.jsp?id=<%=book.getBookId()%>"
								class="btn btn-danger btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p>
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
		<div class="text-center mt-1">
			<a href="all_recent_books.jsp"
				class="btn btn-danger btn-sm text-white">View All Books</a>
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
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>
							<%
							} else {
							%>
							<a
								href="add_cart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?id=<%=book.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white">View
				All Books</a>
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
							<a href="view_books.jsp?id=<%=book.getBookId()%>"
								class="btn btn-danger btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=book.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white">View
				All Books</a>
		</div>
	</div>
	<!-- Old Book End -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>