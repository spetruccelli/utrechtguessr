package com.suusrian.mapper;


import com.suusrian.domain.Location;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class LocationMapper implements RowMapper<Location> {
    public static final String ID = "ID", LATITUDE = "LATITUDE", LONGITUDE = "LONGITUDE", IMAGE = "IMAGE", REMARK = "REMARK";

    @Override
    public Location mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Location(rs.getInt(ID), rs.getString(LATITUDE), rs.getString(LONGITUDE), rs.getString(IMAGE), rs.getString(REMARK));
    }
}
