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

    public User addUser(User newUser);

    public void deleteUser(String username);

    public List<User> getAllUsers();
}
