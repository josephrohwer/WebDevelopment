/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.User;
import java.util.List;

/**
 *
 * @author joseph.rohwer
 */
public interface UserDao {

    // add the given user to the data store
    public User addUser(User newUser);

    // remove the user with the given username from the data store
    public void deleteUser(String username);

    // retrieve all users from the data store
    public List<User> getAllUsers();
}
