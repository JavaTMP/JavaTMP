package com.javatmp.demo.cache;

public interface BookRepository {
	Book getByIsbn(String isbn);
}
