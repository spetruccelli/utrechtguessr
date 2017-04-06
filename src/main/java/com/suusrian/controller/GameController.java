package com.suusrian.controller;

import com.suusrian.dao.LocationDao;
import com.suusrian.dao.ScoreDao;
import com.suusrian.domain.Location;
import com.suusrian.domain.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;


@Controller
public class GameController {

    private LocationDao locationDao;
    private ScoreDao scoreDao;

    private static int LIST_LENGTH = 10;

    @Autowired
    public GameController(LocationDao locationDaoImpl, ScoreDao scoreDao) {

        this.locationDao = locationDaoImpl;
        this.scoreDao = scoreDao;
    }

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public ModelAndView game() {
        ModelAndView modelAndView = new ModelAndView("game");

        String message = "<h1>Ok... here we go.. :) The game starts now!<h1>";
        modelAndView.addObject("message", message);

        List<Location> locations = locationDao.getLocations();
        List<Location> shuffled = new ArrayList<>(LIST_LENGTH);
        Collections.shuffle(locations);

        for(int i = 0; i< LIST_LENGTH; i++) {
            shuffled.add(locations.get(i));
        }
        modelAndView.addObject("locationList", shuffled);

        List<Score> scores = new ArrayList<>();
        for(int i = 0; i< LIST_LENGTH; i++) {
            Optional<Score> score = scoreDao.getScoreById(i);
            score.ifPresent(scores::add);
        }
        modelAndView.addObject("scoreList", scores);
        return modelAndView;
    }



}
