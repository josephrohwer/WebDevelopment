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
import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
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
@CrossOrigin
@Controller
public class PlanetController {

    private PlanetTrackerDao dao;

    @Inject
    public PlanetController(PlanetTrackerDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/planet/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Planet getPlanet(@PathVariable("id") long id) {
        return dao.getPlanetById(id);
    }

    @RequestMapping(value = "/planet", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public Planet createPlanet(@Valid @RequestBody Planet planet) {
        return dao.addPlanet(planet);
    }

    @RequestMapping(value = "/deletePlanet/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePlanet(@PathVariable("id") long id) {
        dao.removePlanet(id);
    }

    @RequestMapping(value = "/editPlanet/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updatePlanet(@PathVariable("id") long id, @Valid @RequestBody Planet planet) throws UpdateIntegrityException {
        if (id != planet.getPlanetId()) {
            throw new UpdateIntegrityException("Planet Id on URL must match Planet Id in submitted data.");
        }
        dao.updatePlanet(planet);
    }

    @RequestMapping(value = "/planets", method = RequestMethod.GET)
    @ResponseBody
    public List<Planet> getAllPlanets() {
        return dao.getAllPlanets();
    }

    @RequestMapping(value = "/planets/recent", method = RequestMethod.GET)
    @ResponseBody
    public List<Planet> getRecentPlanets() {
        int recentPlanetLimit = 6;
        return dao.getRecentPlanets(recentPlanetLimit);
    }
}
