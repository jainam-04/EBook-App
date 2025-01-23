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
<title>Ebook: Old Book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: f0f1f2;">
	<c:if test="${empty UserObj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${not empty success_msg}">
		<div class="alert alert-success text-center">${success_msg}</div>
		<c:remove var="success_msg" scope="session" />
	</c:if>
	<c:if test="${not empty failed_msg}">
		<p class="text-center text-danger">${failed_msg}</p>
		<c:remove var="failed_msg" scope="session" />
	</c:if>
	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User user = (User) session.getAttribute("UserObj");
				String email = user.getEmail();
				BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
				List<BookDetails> list = dao.getBookByUser(email, "Old");
				for (BookDetails book : list) {
				%>
				<tr>
					<td><%=book.getBookName()%></td>
					<td><%=book.getAuthorName()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getBookCategory()%></td>
					<td><a href="delete_old_book?id=<%=book.getBookId()%>"
						class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>