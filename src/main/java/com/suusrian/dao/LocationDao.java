package com.suusrian.dao;

import org.springframework.dao.DataAccessException;
import com.suusrian.domain.Location;

import java.util.List;
import java.util.Optional;


public interface LocationDao {

//    Location addLocation(Location location) throws DataAccessException;

    Optional<Location> getLocation(final int id) throws DataAccessException;

    List<Location> getLocations() throws DataAccessException;

//    Optional<Location> updateLocation(Location location) throws DataAccessException;
//
//    Optional<Location> deleteLocation(final int id) throws DataAccessException;
}


