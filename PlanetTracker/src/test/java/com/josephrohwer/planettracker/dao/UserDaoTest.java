/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.User;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author joseph.rohwer
 */
public class UserDaoTest {

    private UserDao dao;
    private BCryptPasswordEncoder encoder;

    public UserDaoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
        dao = ctx.getBean("userDaoDbImpl", UserDao.class);
        //dao = ctx.getBean("userDaoInMemImpl", UserDao.class);
        encoder = new BCryptPasswordEncoder();
        
        List<User> users = dao.getAllUsers();
        for (User currentUser : users) {
            dao.deleteUser(currentUser.getUsername());
        }
    }

    @After
    public void tearDown() {
        List<User> users = dao.getAllUsers();
        for (User currentUser : users) {
            dao.deleteUser(currentUser.getUsername());
        }
    }

    @Test
    public void addGetDeleteUser() {
        User nu = new User();
        nu.setUsername("admin");
        String hashPw = encoder.encode("password");
        nu.setPassword(hashPw);
        nu.addAuthority("ROLE_ADMIN");
        nu.addAuthority("ROLE_USER");
        dao.addUser(nu);

        User nu2 = new User();
        nu2.setUsername("user");
        String hashPw2 = encoder.encode("password");
        nu2.setPassword(hashPw2);
        nu2.addAuthority("ROLE_USER");
        dao.addUser(nu2);

        List<User> uList = dao.getAllUsers();
        assertEquals(uList.size(), 2);
        dao.deleteUser(nu.getUsername());
        dao.deleteUser(nu2.getUsername());
        uList = dao.getAllUsers();
        assertEquals(uList.size(), 0);
    }
}
