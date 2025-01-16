<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty UserObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container p-4" style="margin-bottom: 4.3vh;">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnection());
						BookDetails book = dao.getBookById(id);
						%>
						<form action="../edit_books" method="post">
							<input type="hidden" name="book_id" value="<%=book.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="book_name"
									value="<%=book.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="exampleInputPassword1"
									name="author_name" value="<%=book.getAuthorName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price <span
									class="text-danger">*</span></label> <input type="number"
									class="form-control" id="exampleInputPassword1" name="price"
									value="<%=book.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" class="form-control" name="book_status">
									<%
									if (book.getStatus().equals("Active")) {
									%>
									<option>Active</option>
									<option>Inactive</option>
									<%
									} else {
									%>
									<option>Active</option>
									<option>Inactive</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>