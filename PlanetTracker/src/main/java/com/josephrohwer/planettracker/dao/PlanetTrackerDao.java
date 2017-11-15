/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.Planet;
import java.util.List;
import java.util.Map;

/**
 *
 * @author joseph.rohwer
 */
public interface PlanetTrackerDao {
    // add the given Planet to the data store
    public Planet addPlanet(Planet planet);

    // remove the Planet with the given id from the data store
    public void removePlanet(long planetId);

    // update the given Planet in the data store
    public void updatePlanet(Planet planet);

    // retrieve all Planets from the data store
    public List<Planet> getAllPlanets();

    // retrieve the six most recently added Planets from the data store
    public List<Planet> getRecentPlanets();
    
    // retrieve the Planet with the given id from the data store
    public Planet getPlanetById(long planetId);

    // search for Planets by the given search criteria values
    public List<Planet> searchPlanets(Map<SearchTerm, String> criteria);
}
