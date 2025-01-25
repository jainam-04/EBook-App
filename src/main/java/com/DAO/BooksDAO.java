package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BooksDAO {
	public boolean addBooks(BookDetails bookDetails);

	public List<BookDetails> getAllBooks();

	public BookDetails getBookById(int id);

	public boolean updateEditBooks(BookDetails book);

	public boolean deleteBooks(int id);

	public List<BookDetails> getNewBooks();

	public List<BookDetails> getRecentBooks();

	public List<BookDetails> getOldBooks();

	public List<BookDetails> getAllRecentBooks();

	public List<BookDetails> getAllNewBooks();

	public List<BookDetails> getAllOldBooks();

	public List<BookDetails> getBookByUser(String email, String category);

	public List<BookDetails> getBookBySearch(String ch);
}
