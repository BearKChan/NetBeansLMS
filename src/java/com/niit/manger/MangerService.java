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
public class MangerService {
    MangerDao md=new MangerDao();
    
    Rules Update(Rules r)
    {
        System.out.println("=========update==========");
        Rules rules=md.updateRules(r);
        return rules;
    }
    
    Book ReturnBook(int id)
    {
        Book books=md.ReturnUpdateBook(id);
        return books;
    }
    
    ISBN ReturnISBN(String book_name)
    {
        
       ISBN isbns= md.ReturnUpdateISBN(book_name);
       return isbns;
    }
    
    Borrow ReturnBorrow(int id)
    {
       Borrow borrows= md.ReturnUpdateBorrow(id);
       return borrows;
    }
    
    Book OutputBook(int id)
    {
       Book books=md.findBookByID(id);
       return books;
    }
}
