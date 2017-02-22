package com.suusrian.dao;

import com.suusrian.domain.Location;
import org.springframework.dao.DataAccessException;

public class FakeLocationDao implements LocationDao {
    private int id = 1;


    @Override
    public Location getLocation(int id) throws DataAccessException {
        String longitude = "52.09073739999999";
        String latitude = "5.121420100000023";
        Location location = new Location(1, latitude, longitude );
        return location;
    }
}

