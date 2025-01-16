package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BooksDAO {
	public boolean addBooks(BookDetails bookDetails);

	public List<BookDetails> getAllBooks();
}
