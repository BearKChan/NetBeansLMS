/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.user;

/**
 *
 * @author Bear
 */
public class Borrow_View {

    private int user_id;
    private int book_id;
    private String book_name;
    private String borrow_time;
    private String deadline_time;
    private int fine_money;

    /**
     * @return the user_id
     */
    public int getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the book_id
     */
    public int getBook_id() {
        return book_id;
    }

    /**
     * @param book_id the book_id to set
     */
    public void setBook_id(int book_id) {
        this.book_id = book_id;
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
     * @return the borrow_time
     */
    public String getBorrow_time() {
        return borrow_time;
    }

    /**
     * @param borrow_time the borrow_time to set
     */
    public void setBorrow_time(String borrow_time) {
        this.borrow_time = borrow_time;
    }

    /**
     * @return the deadline_time
     */
    public String getDeadline_time() {
        return deadline_time;
    }

    /**
     * @param deadline_time the deadline_time to set
     */
    public void setDeadline_time(String deadline_time) {
        this.deadline_time = deadline_time;
    }

    /**
     * @return the fine_money
     */
    public int getFine_money() {
        return fine_money;
    }

    /**
     * @param fine_money the fine_money to set
     */
    public void setFine_money(int fine_money) {
        this.fine_money = fine_money;
    }

}
