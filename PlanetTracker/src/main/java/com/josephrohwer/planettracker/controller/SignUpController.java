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
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author joseph.rohwer
 */
@Controller
public class SignUpController {

    private UserDao dao;
    private BCryptPasswordEncoder encoder;

    @Inject
    public SignUpController(UserDao dao, BCryptPasswordEncoder encoder) {
        this.dao = dao;
        this.encoder = encoder;
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public String showSignUpForm() {
        return "signUp";
    }

    @RequestMapping(value = "/userSignUp", method = RequestMethod.POST)
    public String userSignUp(HttpServletRequest request) throws UpdateIntegrityException {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password-confirm"));

        List<User> users = dao.getAllUsers();
        String username = user.getUsername();
        boolean userNameTaken = users.stream().anyMatch(u -> u.getUsername().equalsIgnoreCase(username));
        if (userNameTaken) {
            throw new UpdateIntegrityException("Username already taken.");
        }

        String clearPw = user.getPassword();
        String hashPw = encoder.encode(clearPw);
        user.setPassword(hashPw);

        // Don't want the user trying to manually create an admin account.
        user.getAuthorities().clear();
        user.addAuthority("ROLE_USER");

        dao.addUser(user);

        return "redirect:signIn";
    }
}
