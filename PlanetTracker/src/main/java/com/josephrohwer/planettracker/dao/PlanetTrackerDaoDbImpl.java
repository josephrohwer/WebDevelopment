/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.josephrohwer.planettracker.dao;

import com.josephrohwer.planettracker.model.Planet;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author joseph.rohwer
 */
public class PlanetTrackerDaoDbImpl implements PlanetTrackerDao {

    private static final String SQL_INSERT_PLANET
            = "insert into planets "
            + "(image_url, name, avg_temp, rad_level, planet_type, life_type) "
            + "values (?, ?, ?, ?, ?, ?)";
    private static final String SQL_DELETE_PLANET
            = "delete from planets where planet_id = ?";
    private static final String SQL_SELECT_PLANET
            = "select * from planets where planet_id = ?";
    private static final String SQL_UPDATE_PLANET
            = "update planets set "
            + "image_url = ?, name = ?, avg_temp = ?, rad_level = ?, "
            + "planet_type = ?, life_type = ? where planet_id = ?";
    private static final String SQL_SELECT_ALL_PLANETS
            = "select * from planets";
    private static final String SQL_SELECT_RECENT_PLANETS
            = "select * from planets order by planet_id desc limit 6;";
    private static final String SQL_SELECT_PLANETS_BY_NAME
            = "select * from planets where name = ?";
    private static final String SQL_SELECT_PLANETS_BY_PLANET_TYPE
            = "select * from contacts where planet_type = ?";

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Planet addPlanet(Planet planet) {
        jdbcTemplate.update(SQL_INSERT_PLANET,
                planet.getImageURL(),
                planet.getName(),
                planet.getAvgTemp(),
                planet.getRadLevel(),
                planet.getPlanetType(),
                planet.getLifeType());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        planet.setPlanetId(newId);
        return planet;
    }

    @Override
    public void removePlanet(long planetId) {
        jdbcTemplate.update(SQL_DELETE_PLANET, planetId);
    }

    @Override
    public void updatePlanet(Planet planet) {
        jdbcTemplate.update(SQL_UPDATE_PLANET,
                planet.getImageURL(),
                planet.getName(),
                planet.getAvgTemp(),
                planet.getRadLevel(),
                planet.getPlanetType(),
                planet.getLifeType(),
                planet.getPlanetId());
    }

    @Override
    public List<Planet> getAllPlanets() {
        return jdbcTemplate.query(SQL_SELECT_ALL_PLANETS, new PlanetMapper());
    }

    @Override
    public List<Planet> getRecentPlanets() {
        return jdbcTemplate.query(SQL_SELECT_RECENT_PLANETS, new PlanetMapper());
    }
    
    @Override
    public Planet getPlanetById(long planetId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_PLANET, new PlanetMapper(), planetId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Planet> searchPlanets(Map<SearchTerm, String> criteria) {
        if (criteria.isEmpty()) {
            return getAllPlanets();
        } else {
            StringBuilder sQuery = new StringBuilder("select * from planets where ");

            int numParams = criteria.size();
            int paramPosition = 0;

            String[] paramVals = new String[numParams];
            Set<SearchTerm> keySet = criteria.keySet();
            Iterator<SearchTerm> iter = keySet.iterator();

            while (iter.hasNext()) {
                SearchTerm currentKey = iter.next();
                
                if (paramPosition > 0) {
                    sQuery.append(" and ");
                }

                sQuery.append(currentKey);
                sQuery.append(" = ? ");

                paramVals[paramPosition] = criteria.get(currentKey);
                paramPosition++;
            }

            return jdbcTemplate.query(sQuery.toString(), new PlanetMapper(), paramVals);
        }
    }

    private static final class PlanetMapper implements RowMapper<Planet> {

        public Planet mapRow(ResultSet rs, int rowNum) throws SQLException {
            Planet planet = new Planet();
            planet.setPlanetId(rs.getLong("planet_id"));
            planet.setImageURL(rs.getString("image_url"));
            planet.setName(rs.getString("name"));
            planet.setAvgTemp(rs.getInt("avg_temp"));
            planet.setRadLevel(rs.getInt("rad_level"));
            planet.setPlanetType(rs.getString("planet_type"));
            planet.setLifeType(rs.getString("life_type"));
            return planet;
        }
    }
}
