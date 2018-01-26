/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.clerk;

/**
 *
 * @author Bear
 */
public class Fine {
    private int fine_id;
    private int book_id;
    private int user_id;
    private String deadline_time;
    private double fine_money;
    private double single_fine;

    /**
     * @return the fine_id
     */
    public int getFine_id() {
        return fine_id;
    }

    /**
     * @param fine_id the fine_id to set
     */
    public void setFine_id(int fine_id) {
        this.fine_id = fine_id;
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
    public double getFine_money() {
        return fine_money;
    }

    /**
     * @param fine_money the fine_money to set
     */
    public void setFine_money(double fine_money) {
        this.fine_money = fine_money;
    }

    /**
     * @return the single_fine
     */
    public double getSingle_fine() {
        return single_fine;
    }

    /**
     * @param single_fine the single_fine to set
     */
    public void setSingle_fine(double single_fine) {
        this.single_fine = single_fine;
    }
    
}
