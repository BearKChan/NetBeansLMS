/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.user;

import com.niit.login.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bear
 */
public class UserService {

    UserDao ud = new UserDao();

    List<Borrow_View> getallRecords(int user_id) {
        return ud.getAllBorrow_ViewByUser_ID(user_id);
    }

    User update(User u) {
        User user = ud.updateUserInfo(u);
        return user;
    }

    User changePsd(User u) {
        User user = ud.updateUserPsd(u);
        return user;
    }

    ArrayList<ISBN> searchBook(String select, String keyword) {
        ArrayList<ISBN> arrayList=new ArrayList<>();
        arrayList = ud.GetBooksForUser(select,keyword);
        return arrayList;
    }

}
