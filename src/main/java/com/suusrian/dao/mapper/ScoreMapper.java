package com.suusrian.dao.mapper;


import com.suusrian.domain.Location;
import com.suusrian.domain.Score;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ScoreMapper implements RowMapper<Score> {
    public static final String ID = "ID", DISTANCE = "DISTANCE", POINTS = "POINTS";

    @Override
    public Score mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Score(rs.getInt(ID), rs.getDouble(DISTANCE), rs.getInt(POINTS));
    }
}

