/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.Planet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 *
 * @author joseph.rohwer
 */
public class PlanetTrackerDaoInMemImpl implements PlanetTrackerDao {

    // holds all of our Planet objects - simulates the database
    private Map<Long, Planet> planetMap = new HashMap<>();
    // used to assign ids to Planets - simulates the auto increment
    // primary key for Planets in a database
    private static long planetIdCounter = 0;

    @Override
    public Planet addPlanet(Planet planet) {
        // assign the current counter values as the planetid
        planet.setPlanetId(planetIdCounter);
        // increment the counter so it is ready for use for the 
        // next planet
        planetIdCounter++;
        planetMap.put(planet.getPlanetId(), planet);
        return planet;
    }

    @Override
    public void removePlanet(long planetId) {
        planetMap.remove(planetId);
    }

    @Override
    public void updatePlanet(Planet planet) {
        planetMap.put(planet.getPlanetId(), planet);
    }

    @Override
    public List<Planet> getAllPlanets() {
        Collection<Planet> c = planetMap.values();
        return new ArrayList(c);
    }

    @Override
    public Planet getPlanetById(long planetId) {
        return planetMap.get(planetId);
    }

    @Override
    public List<Planet> searchPlanets(Map<SearchTerm, String> criteria) {
        // Get all the search term values from the map
        String nameSearchCriteria
                = criteria.get(SearchTerm.NAME);
        String avgTempSearchCriteria
                = criteria.get(SearchTerm.AVG_TEMP);
        String radLevelSearchCriteria
                = criteria.get(SearchTerm.RAD_LEVEL);
        String planetTypeSearchCriteria
                = criteria.get(SearchTerm.PLANET_TYPE);
        String lifeTypeSearchCriteria
                = criteria.get(SearchTerm.LIFE_TYPE);

        // Declare all the predicate conditions - remember that
        // Predicate is a functional interface with one method
        // called test(T t) that returns a boolean.  Since
        // Predicate is generic, we get to specify the type of
        // object we want T to be - in our case, we want T to be
        // of type Planet.  That means the Predicates declared 
        // here will have one method: boolean test(Planet c)
        Predicate<Planet> nameMatchPredicate;
        Predicate<Planet> avgTempMatchPredicate;
        Predicate<Planet> radLevelMatchPredicate;
        Predicate<Planet> planetTypeMatchPredicate;
        Predicate<Planet> lifeTypeMatchPredicate;

        // Placeholder predicate - always returns true. Used for 
        // search terms that are empty - if the user didn't specify 
        // a value for one of the search terms, we must return true
        // because we are ANDing all the search terms together and 
        // our spec says that we return everything in the DAO when
        // the user leaves all the search terms blank.
        Predicate<Planet> truePredicate = (c) -> {
            return true;
        };

        // Assign values to predicates. If a given search term is empty, 
        // just assign the default truePredicate, otherwise assign the 
        // predicate that only returns true when it finds a match for the 
        // given term.
        if (nameSearchCriteria == null
                || nameSearchCriteria.isEmpty()) {
            nameMatchPredicate = truePredicate;
        } else {
            nameMatchPredicate
                    = (c) -> c.getName().equals(nameSearchCriteria);
        }

        if (avgTempSearchCriteria == null
                || avgTempSearchCriteria.isEmpty()) {
            avgTempMatchPredicate = truePredicate;
        } else {
            avgTempMatchPredicate
                    = (c) -> c.getAvgTemp().equals(avgTempSearchCriteria);
        }

        if (radLevelSearchCriteria == null
                || radLevelSearchCriteria.isEmpty()) {
            radLevelMatchPredicate = truePredicate;
        } else {
            radLevelMatchPredicate
                    = (c) -> c.getRadLevel().equals(radLevelSearchCriteria);
        }

        if (planetTypeSearchCriteria == null
                || planetTypeSearchCriteria.isEmpty()) {
            planetTypeMatchPredicate = truePredicate;
        } else {
            planetTypeMatchPredicate
                    = (c) -> c.getPlanetType().equals(planetTypeSearchCriteria);
        }

        if (lifeTypeSearchCriteria == null
                || lifeTypeSearchCriteria.isEmpty()) {
            lifeTypeMatchPredicate = truePredicate;
        } else {
            lifeTypeMatchPredicate
                    = (c) -> c.getLifeType().equals(lifeTypeSearchCriteria);
        }

        // Return the list of Planets that match the given criteria. 
        // To do this we just AND all the predicates together in a 
        // filter operation.
        return planetMap.values().stream()
                .filter(nameMatchPredicate
                        .and(avgTempMatchPredicate)
                        .and(radLevelMatchPredicate)
                        .and(planetTypeMatchPredicate)
                        .and(lifeTypeMatchPredicate))
                .collect(Collectors.toList());
    }
}
