/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.clerk;

import java.util.ArrayList;

/**
 *
 * @author Bear
 */
class ClerkService {

    ClerkDao cd = new ClerkDao();

    void addBook(Book book) {
        cd.addBook(book);
    }

    ArrayList<Fine> getAllFineList() {

        ArrayList<Fine> fine_list = cd.getAllFIneList();
        return fine_list;
    }

    void returnFine(int fine_id, int user_id) {
        cd.returnFine(fine_id);
        cd.findUser_IDInFine(user_id);
    }

}
