package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {
	public boolean saveOrder(List<BookOrder> list);

	public List<BookOrder> getBook(String email);

	public List<BookOrder> getAllOrderBook();
}
