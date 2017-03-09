package com.suusrian.dao;

import com.suusrian.dao.mapper.ScoreMapper;
import com.suusrian.domain.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

import static com.suusrian.dao.mapper.ScoreMapper.DISTANCE;
import static com.suusrian.dao.mapper.ScoreMapper.ID;
import static com.suusrian.dao.mapper.ScoreMapper.POINTS;

@Component
public class ScoreDaoImpl implements ScoreDao {
    private int id;

    private final NamedParameterJdbcTemplate jdbcTemplate;
    private final ScoreMapper scoreMapper;


    @Autowired
    public ScoreDaoImpl(final DataSource dataSource, final ScoreMapper scoreMapper) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        this.scoreMapper = scoreMapper;
    }

    @Override
    public Optional<Score> getScoreById(int id) throws DataAccessException {
        String query = "select * from scores where id = " + id;
        List<Score> scores = this.jdbcTemplate.query(query, scoreMapper);
        if ( scores.isEmpty() ){
            return Optional.empty();
        } else  {
            return scores.stream().findFirst();
        }
    }

    @Override
    public Optional<Score> updateScore(Score score) throws DataAccessException {
        final MapSqlParameterSource parameterMap = new MapSqlParameterSource();
        parameterMap.addValue(ID, score.getId());
        parameterMap.addValue(DISTANCE, score.getDistance());
        parameterMap.addValue(POINTS, score.getPoints());
        String query = "update scores set distance = (:" + DISTANCE + "), points = (:" + POINTS + ") where id =:" + ID;
        int numberRows = this.jdbcTemplate.update(query, parameterMap);
        if (numberRows == 1) {
            return Optional.of(score);
        }
        else {
            return Optional.empty();
        }
    }

    @Override
    public Integer CalculateAndUpdateScore(int id, Double distance) throws DataAccessException {
        int points = 0;
        if (distance < 1000) {points = 10;}
        else if (distance < 5000) {points = 5;}
        else if (distance < 10000) {points = 1;}
        final MapSqlParameterSource parameterMap = new MapSqlParameterSource();
        parameterMap.addValue(ID, id);
        parameterMap.addValue(DISTANCE, distance);
        parameterMap.addValue(POINTS, points);
        String query = "update scores set distance = (:" + DISTANCE + "), points = (:" + POINTS + ") where id =:" + ID;
        int numberRows = this.jdbcTemplate.update(query, parameterMap);
        return numberRows;

    }
}

