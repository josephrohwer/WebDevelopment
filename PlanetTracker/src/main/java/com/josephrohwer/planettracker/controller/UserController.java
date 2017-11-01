/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.controller;

import com.josephrohwer.planettracker.dao.UserDao;
import com.josephrohwer.planettracker.model.Planet;
import com.josephrohwer.planettracker.model.User;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author joseph.rohwer
 */
@Controller
public class UserController {

    private UserDao dao;
    private PasswordEncoder encoder;

    @Inject
    public UserController(UserDao dao, PasswordEncoder encoder) {
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
    public User createUser(@Valid @RequestBody User user) {
        String clearPw = user.getPassword();
        String hashPw = encoder.encode(clearPw);
        user.setPassword(hashPw);

        user.addAuthority("ROLE_USER");
        //if (null != user.getParameter("isAdmin")) {
        //    user.addAuthority("ROLE_ADMIN");
        //}

        return dao.addUser(user);
    }

    @RequestMapping(value = "/user/{username}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteUser(@PathVariable("username") String username) {
        dao.deleteUser(username);
    }
//    private UserDao dao;
//    private PasswordEncoder encoder;
//
//    @Inject
//    public UserController(UserDao dao, PasswordEncoder encoder) {
//        this.dao = dao;
//        this.encoder = encoder;
//    }
//
//    @RequestMapping(value = "/displayUserList", method = RequestMethod.GET)
//    public String displayUserList(Map<String, Object> model) {
//        List users = dao.getAllUsers();
//        model.put("users", users);
//        return "displayUserList";
//    }
//
//    @RequestMapping(value = "/displayUserForm", method = RequestMethod.GET)
//    public String displayUserForm(Map<String, Object> model) {
//        return "addUserForm";
//    }
//
//    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
//    public String addUser(HttpServletRequest req) {
//        User newUser = new User();
//
//        newUser.setUsername(req.getParameter("username"));
//        String clearPw = req.getParameter("password");
//        String hashPw = encoder.encode(clearPw);
//        newUser.setPassword(hashPw);
//
//        newUser.addAuthority("ROLE_USER");
//        if (null != req.getParameter("isAdmin")) {
//            newUser.addAuthority("ROLE_ADMIN");
//        }
//
//        dao.addUser(newUser);
//
//        return "redirect:displayUserList";
//    }
//
//    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
//    public String deletUser(@RequestParam("username") String username, Map<String, Object> model) {
//        dao.deleteUser(username);
//        return "redirect:displayUserList";
//    }
}
