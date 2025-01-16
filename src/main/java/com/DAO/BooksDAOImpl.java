package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BooksDAOImpl implements BooksDAO {
	private Connection con;

	public BooksDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	public BooksDAOImpl() {
		super();
	}

	public boolean addBooks(BookDetails bookDetails) {
		boolean flag = false;
		try {
			String sql = "insert into book_details (book_name, author_name, price, book_category, status, photo, email) values(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bookDetails.getBookName());
			ps.setString(2, bookDetails.getAuthorName());
			ps.setString(3, bookDetails.getPrice());
			ps.setString(4, bookDetails.getBookCategory());
			ps.setString(5, bookDetails.getStatus());
			ps.setString(6, bookDetails.getPhoto());
			ps.setString(7, bookDetails.getEmail());
			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthorName(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setBookCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
