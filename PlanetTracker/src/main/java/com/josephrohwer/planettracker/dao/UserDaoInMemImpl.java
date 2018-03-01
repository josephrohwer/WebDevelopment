/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author joseph.rohwer
 */
public class UserDaoInMemImpl implements UserDao {

    private final Map<Long, User> userMap = new HashMap<>();
    private static long userIdCounter = 0;

    @Override
    public User addUser(User user) {
        user.setUserId(userIdCounter);
        userIdCounter++;
        userMap.put(user.getUserId(), user);
        return user;
    }

    @Override
    public void deleteUser(String username) {
        userMap.entrySet().removeIf(entry -> entry.getValue().getUsername().equals(username));
    }

    @Override
    public List<User> getAllUsers() {
        Collection<User> c = userMap.values();
        return new ArrayList(c);
    }
}
