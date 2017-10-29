/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.controller;

import com.josephrohwer.planettracker.dao.PlanetTrackerDao;
import com.josephrohwer.planettracker.dao.SearchTerm;
import com.josephrohwer.planettracker.model.Planet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author joseph.rohwer
 */
@Controller
public class SearchController {

    private PlanetTrackerDao dao;

    @Inject
    public SearchController(PlanetTrackerDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/search/planets", method = RequestMethod.POST)
    @ResponseBody
    public List<Planet> searchPlanets(@RequestBody Map<String, String> searchMap) {
        Map<SearchTerm, String> criteriaMap = new HashMap<>();

        String currentTerm = searchMap.get("name");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.NAME, currentTerm);
        }
        currentTerm = searchMap.get("avgTemp");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.AVG_TEMP, currentTerm);
        }
        currentTerm = searchMap.get("radLevel");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.RAD_LEVEL, currentTerm);
        }
        currentTerm = searchMap.get("planetType");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.PLANET_TYPE, currentTerm);
        }
        currentTerm = searchMap.get("lifeType");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.LIFE_TYPE, currentTerm);
        }

        return dao.searchPlanets(criteriaMap);
    }
}
