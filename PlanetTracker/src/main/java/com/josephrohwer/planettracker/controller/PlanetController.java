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
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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

        model.addAttribute("planetList", planetList);

        return "planets";
    }

    @RequestMapping(value = "/createPlanet", method = RequestMethod.POST)
    public String createPlanet(HttpServletRequest request) {
        Planet planet = new Planet();
        planet.setName(request.getParameter("name"));
        planet.setAvgTemp(Integer.parseInt(request.getParameter("avgTemp")));
        planet.setRadLevel(Integer.parseInt(request.getParameter("radLevel")));
        planet.setPlanetType(request.getParameter("planetType"));
        planet.setLifeType(request.getParameter("lifeType"));

        dao.addPlanet(planet);

        return "redirect:displayPlanetsPage";
    }

    @RequestMapping(value = "/displayPlanetDetails", method = RequestMethod.GET)
    public String displayPlanetDetails(HttpServletRequest request, Model model) {
        String planetIdParameter = request.getParameter("planetId");
        int planetId = Integer.parseInt(planetIdParameter);

        Planet planet = dao.getPlanetById(planetId);

        model.addAttribute("planet", planet);

        return "planetDetails";
    }

    @RequestMapping(value = "/deletePlanet", method = RequestMethod.GET)
    public String deletePlanet(HttpServletRequest request) {
        String planetIdParameter = request.getParameter("planetId");
        long planetId = Long.parseLong(planetIdParameter);
        dao.removePlanet(planetId);
        return "redirect:displayPlanetsPage";
    }

    @RequestMapping(value = "/displayEditPlanetForm", method = RequestMethod.GET)
    public String displayEditPlanetForm(HttpServletRequest request, Model model) {
        String planetIdParameter = request.getParameter("planetId");
        long planetId = Long.parseLong(planetIdParameter);
        Planet planet = dao.getPlanetById(planetId);
        model.addAttribute("planet", planet);
        return "editPlanetForm";
    }

    @RequestMapping(value = "/editPlanet", method = RequestMethod.POST)
    public String editPlanet(@Valid @ModelAttribute("planet") Planet planet, BindingResult result) {
        if (result.hasErrors()) {
            return "editPlanetForm";
        }
        
        dao.updatePlanet(planet);

        return "redirect:displayPlanetsPage";
    }
}
