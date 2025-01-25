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

	public BookDetails getBookById(int id) {
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	public boolean updateEditBooks(BookDetails book) {
		boolean flag = false;
		try {
			String sql = "update book_details set book_name = ?, author_name = ?, price = ?, status = ? where book_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, book.getBookName());
			ps.setString(2, book.getAuthorName());
			ps.setString(3, book.getPrice());
			ps.setString(4, book.getStatus());
			ps.setInt(5, book.getBookId());
			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteBooks(int id) {
		boolean flag = false;
		try {
			String sql = "delete from book_details where book_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<BookDetails> getNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_category = ? and status = ? order by book_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where status = ? order by book_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_category = ? and status = ? order by book_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where status = ? order by book_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
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

	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_category = ? and status = ? order by book_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
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

	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_category = ? and status = ? order by book_id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
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

	public List<BookDetails> getBookByUser(String email, String category) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_category = ? and email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
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

	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details where book_name like ? or author_name like ? or book_category like ? and status = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");
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
