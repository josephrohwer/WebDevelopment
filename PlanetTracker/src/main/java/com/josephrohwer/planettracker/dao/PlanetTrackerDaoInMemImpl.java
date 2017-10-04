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

    private Map<Long, Planet> planetMap = new HashMap<>();
    private static long planetIdCounter = 0;

    @Override
    public Planet addPlanet(Planet planet) {
        planet.setPlanetId(planetIdCounter);
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

        Predicate<Planet> nameMatchPredicate;
        Predicate<Planet> avgTempMatchPredicate;
        Predicate<Planet> radLevelMatchPredicate;
        Predicate<Planet> planetTypeMatchPredicate;
        Predicate<Planet> lifeTypeMatchPredicate;

        Predicate<Planet> truePredicate = (c) -> {
            return true;
        };

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
                    = (c) -> Integer.toString(c.getAvgTemp()).equals(avgTempSearchCriteria);
        }

        if (radLevelSearchCriteria == null
                || radLevelSearchCriteria.isEmpty()) {
            radLevelMatchPredicate = truePredicate;
        } else {
            radLevelMatchPredicate
                    = (c) -> Integer.toString(c.getRadLevel()).equals(radLevelSearchCriteria);
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

        return planetMap.values().stream()
                .filter(nameMatchPredicate
                        .and(avgTempMatchPredicate)
                        .and(radLevelMatchPredicate)
                        .and(planetTypeMatchPredicate)
                        .and(lifeTypeMatchPredicate))
                .collect(Collectors.toList());
    }
}
