package com.suusrian.dao;

import org.springframework.dao.DataAccessException;
import com.suusrian.domain.Location;

import java.util.List;
import java.util.Optional;


public interface LocationDao {

    Optional<Location> getLocation(final int id) throws DataAccessException;

    List<Location> getLocations() throws DataAccessException;

}


