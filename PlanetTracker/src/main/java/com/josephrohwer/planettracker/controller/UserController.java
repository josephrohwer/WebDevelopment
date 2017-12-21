/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.controller;

import com.josephrohwer.planettracker.dao.UserDao;
import com.josephrohwer.planettracker.model.User;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author joseph.rohwer
 */
@Controller
public class UserController {

    private UserDao dao;
    private BCryptPasswordEncoder encoder;

    @Inject
    public UserController(UserDao dao, BCryptPasswordEncoder encoder) {
        this.dao = dao;
        this.encoder = encoder;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    @ResponseBody
    public List<User> getAllUsers() {
        return dao.getAllUsers();
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public User createUser(@Valid @RequestBody User user) throws UpdateIntegrityException {
        for (User u : dao.getAllUsers()) {
            if (u.getUsername().equals(user.getUsername())) {
                throw new UpdateIntegrityException("Planet Id on URL must match Planet Id in submitted data.");
            }
        }
        
        String clearPw = user.getPassword();
        String hashPw = encoder.encode(clearPw);
        user.setPassword(hashPw);

        if (user.getAuthorities().contains("ROLE_ADMIN") || user.getAuthorities().isEmpty()) {
            user.addAuthority("ROLE_USER");
        }

        return dao.addUser(user);
    }

    @RequestMapping(value = "/user/{username}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteUser(@PathVariable("username") String username) {
        dao.deleteUser(username);
    }
}
