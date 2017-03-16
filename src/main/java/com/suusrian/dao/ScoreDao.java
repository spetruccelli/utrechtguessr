package com.suusrian.dao;

import com.suusrian.domain.Location;
import com.suusrian.domain.Score;
import org.springframework.dao.DataAccessException;

import java.util.Optional;


public interface ScoreDao {

    Score addScore(Score score) throws DataAccessException;

    Optional<Score> getScoreById(final int id) throws DataAccessException;

    Optional<Score> updateScore(Score score) throws DataAccessException;

    Integer CalculateAndUpdateScore(int id, Double distance) throws DataAccessException;

//
//    Optional<Score> deleteScore(final int id) throws DataAccessException;
}


