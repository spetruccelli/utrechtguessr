package com.suusrian.dao;

import com.suusrian.dao.mapper.LocationMapper;
import com.suusrian.domain.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

@Component
public class LocationDaoImpl implements LocationDao {
    private int id = 1;

    private final NamedParameterJdbcTemplate jdbcTemplate;
    private final LocationMapper locationMapper;


    @Autowired
    public LocationDaoImpl(final DataSource dataSource, final LocationMapper bookMapper) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        this.locationMapper = bookMapper;
    }

    @Override
    public Optional<Location> getLocation(int id) throws DataAccessException {
        System.out.println("stap 2 = " + id);
        String query = "select * from locations where id = " + id;
        List<Location> locations = this.jdbcTemplate.query(query, locationMapper);
        if ( locations.isEmpty() ){
            return Optional.empty();
        } else  {
            return locations.stream().findFirst();
        }
    }
}

