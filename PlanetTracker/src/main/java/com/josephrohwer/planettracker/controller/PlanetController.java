/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.controller;

import com.josephrohwer.planettracker.dao.PlanetTrackerDao;
import com.josephrohwer.planettracker.model.Planet;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author joseph.rohwer
 */
@Controller
public class PlanetController {

    PlanetTrackerDao dao;

    @Inject
    public PlanetController(PlanetTrackerDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/displayPlanetsPage", method = RequestMethod.GET)
    public String displayPlanetsPage(Model model) {
        List<Planet> planetList = dao.getAllPlanets();

        model.addAttribute("contactList", planetList);

        return "planets";
    }

    @RequestMapping(value = "/createPlanet", method = RequestMethod.POST)
    public String createPlanet(HttpServletRequest request) {
        Planet planet = new Planet();
        planet.setName(request.getParameter("name"));
        planet.setAvgTemp(request.getParameter("avgTemp"));
        planet.setRadLevel(request.getParameter("radLevel"));
        planet.setPlanetType(request.getParameter("planetType"));
        planet.setLifeType(request.getParameter("lifeType"));

        dao.addPlanet(planet);

        return "redirect:displayPlanetsPage";
    }
}
