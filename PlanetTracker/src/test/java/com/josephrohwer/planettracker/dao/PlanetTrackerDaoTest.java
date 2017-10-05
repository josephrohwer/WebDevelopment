/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.Planet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Before;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author joseph.rohwer
 */
public class PlanetTrackerDaoTest {

    private PlanetTrackerDao dao;

    public PlanetTrackerDaoTest() {
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
        dao = ctx.getBean("planetTrackerDao", PlanetTrackerDao.class);

        List<Planet> planets = dao.getAllPlanets();
        for (Planet currentPlanet : planets) {
            dao.removePlanet(currentPlanet.getPlanetId());
        }
    }

    @After
    public void tearDown() {
    }

    @Test
    public void addGetDeletePlanet() {
        Planet np = new Planet();
        np.setName("Earth");
        np.setAvgTemp(72);
        np.setRadLevel(12);
        np.setPlanetType("Habitable");
        np.setLifeType("Advanced");
        dao.addPlanet(np);
        Planet fromDb = dao.getPlanetById(np.getPlanetId());
        assertEquals(fromDb, np);
        dao.removePlanet(np.getPlanetId());
        assertNull(dao.getPlanetById(np.getPlanetId()));
    }

    @Test
    public void addUpdatePlanet() {
        Planet np = new Planet();
        np.setName("Mars");
        np.setAvgTemp(45);
        np.setRadLevel(54);
        np.setPlanetType("Rocky");
        np.setLifeType("Uninhabitable");
        dao.addPlanet(np);
        np.setLifeType("Microbial");
        dao.updatePlanet(np);
        Planet fromDb = dao.getPlanetById(np.getPlanetId());
        assertEquals(fromDb, np);
    }

    @Test
    public void getAllPlanets() {
        Planet np = new Planet();
        np.setName("Mars");
        np.setAvgTemp(-45);
        np.setRadLevel(54);
        np.setPlanetType("Rocky");
        np.setLifeType("Microbial");
        dao.addPlanet(np);

        Planet np2 = new Planet();
        np2.setName("Earth");
        np2.setAvgTemp(72);
        np2.setRadLevel(12);
        np2.setPlanetType("Habitable");
        np2.setLifeType("Advanced");
        dao.addPlanet(np2);
        List<Planet> pList = dao.getAllPlanets();
        assertEquals(pList.size(), 2);
    }

    @Test
    public void searchPlanets() {
        Planet np = new Planet();
        np.setName("Mars");
        np.setAvgTemp(-45);
        np.setRadLevel(54);
        np.setPlanetType("Rocky");
        np.setLifeType("Microbial");
        dao.addPlanet(np);

        Planet np2 = new Planet();
        np2.setName("Earth");
        np2.setAvgTemp(72);
        np2.setRadLevel(12);
        np2.setPlanetType("Habitable");
        np2.setLifeType("Advanced");
        dao.addPlanet(np2);

        Planet np3 = new Planet();
        np3.setName("Jupiter");
        np3.setAvgTemp(-45);
        np3.setRadLevel(267);
        np3.setPlanetType("Gas Giant");
        np3.setLifeType("Uninhabitable");
        dao.addPlanet(np3);

        Map<SearchTerm, String> criteria = new HashMap<>();
        criteria.put(SearchTerm.AVG_TEMP, "72");
        List<Planet> pList = dao.searchPlanets(criteria);
        assertEquals(1, pList.size());
        assertEquals(np2, pList.get(0));

        criteria.put(SearchTerm.AVG_TEMP, "-45");
        pList = dao.searchPlanets(criteria);
        assertEquals(2, pList.size());

        criteria.put(SearchTerm.RAD_LEVEL, "54");
        pList = dao.searchPlanets(criteria);
        assertEquals(1, pList.size());
        assertEquals(np, pList.get(0));

        criteria.put(SearchTerm.RAD_LEVEL, "267");
        pList = dao.searchPlanets(criteria);
        assertEquals(1, pList.size());
        assertEquals(np3, pList.get(0));

        criteria.put(SearchTerm.RAD_LEVEL, "12");
        pList = dao.searchPlanets(criteria);
        assertEquals(0, pList.size());
    }
}
