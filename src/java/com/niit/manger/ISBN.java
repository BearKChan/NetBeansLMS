/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.manger;

/**
 *
 * @author Acer
 */
public class ISBN {
    private int isbn_id;
    private String isbn;
    private String book_name;
    private int book_amount;
    private int book_remains;
    private int book_times;

    /**
     * @return the isbn_id
     */
    public int getIsbn_id() {
        return isbn_id;
    }

    /**
     * @param isbn_id the isbn_id to set
     */
    public void setIsbn_id(int isbn_id) {
        this.isbn_id = isbn_id;
    }

    /**
     * @return the isbn
     */
    public String getIsbn() {
        return isbn;
    }

    /**
     * @param isbn the isbn to set
     */
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    /**
     * @return the book_name
     */
    public String getBook_name() {
        return book_name;
    }

    /**
     * @param book_name the book_name to set
     */
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    /**
     * @return the book_amount
     */
    public int getBook_amount() {
        return book_amount;
    }

    /**
     * @param book_amount the book_amount to set
     */
    public void setBook_amount(int book_amount) {
        this.book_amount = book_amount;
    }

    /**
     * @return the book_remains
     */
    public int getBook_remains() {
        return book_remains;
    }

    /**
     * @param book_remains the book_remains to set
     */
    public void setBook_remains(int book_remains) {
        this.book_remains = book_remains;
    }

    /**
     * @return the book_times
     */
    public int getBook_times() {
        return book_times;
    }

    /**
     * @param book_times the book_times to set
     */
    public void setBook_times(int book_times) {
        this.book_times = book_times;
    }
}
