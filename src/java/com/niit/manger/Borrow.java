/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.manger;

import java.sql.Date;

/**
 *
 * @author Acer
 */
public class Borrow {
    private int borrow_id;
    private int book_id;
    private int user_id;
    private String borrow_date;
    private String deadline_time;
    private int deadline;
    private int borrow_state;

    /**
     * @return the borrow_id
     */
    public int getBorrow_id() {
        return borrow_id;
    }

    /**
     * @param borrow_id the borrow_id to set
     */
    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
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
     * @return the borrow_date
     */
    public String getBorrow_date() {
        return borrow_date;
    }

    /**
     * @param borrow_date the borrow_date to set
     */
    public void setBorrow_date(String borrow_date) {
        this.borrow_date = borrow_date;
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
     * @return the deadline
     */
    public int getDeadline() {
        return deadline;
    }

    /**
     * @param deadline the deadline to set
     */
    public void setDeadline(int deadline) {
        this.deadline = deadline;
    }

    /**
     * @return the borrow_state
     */
    public int getBorrow_state() {
        return borrow_state;
    }

    /**
     * @param borrow_state the borrow_state to set
     */
    public void setBorrow_state(int borrow_state) {
        this.borrow_state = borrow_state;
    }
    
    
}
