package com.suusrian.controller;

import com.suusrian.dao.LocationDao;
import com.suusrian.dao.LocationDaoImpl;
import com.suusrian.dao.ScoreDao;
import com.suusrian.domain.Location;
import com.suusrian.domain.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


@Controller
//@RequestMapping("/game")
public class GameController {

    private LocationDao locationDao;
    private ScoreDao scoreDao;

    private int listLength = 10;

    @Autowired
    public GameController(LocationDao locationDaoImpl, ScoreDao scoreDao) {

        this.locationDao = locationDaoImpl;
        this.scoreDao = scoreDao;
    }

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public ModelAndView game() {
        ModelAndView modelAndView = new ModelAndView("game");

        String message = "<h1>The game starts now!<h1>";
        modelAndView.addObject("message", message);

        List<Location> locations = locationDao.getLocations();
        List<Location> shuffled = new ArrayList<>(listLength);
        Collections.shuffle(locations);

        for(int i=0; i<listLength; i++) {
            shuffled.add(locations.get(i));
        }
        modelAndView.addObject("locationList", shuffled);

        List<Score> scores = new ArrayList<>();
        for(int i=0; i<listLength; i++) {
            Optional<Score> score = scoreDao.getScoreById(i);
            score.ifPresent(scores::add);
        }
        modelAndView.addObject("scoreList", scores);
        return modelAndView;
    }


    //    op te zoeken door: http://localhost:8085/game/locations/1
    @RequestMapping(value = "/game/locations/{id}", method = RequestMethod.GET)
    public ModelAndView getLocationById(@PathVariable int id) {
        ModelAndView modelAndView = new ModelAndView("locations");
        try {
            Optional<Location> location = locationDao.getLocation(id);
            if (location.isPresent()) {
                modelAndView.addObject("location", location.get());
            }
        } catch (Exception e) {
            System.out.println(e.toString());

        }
        return modelAndView;
    }

    @ResponseBody
    private ResponseEntity<Location> handleError(Exception e) {
        return new ResponseEntity<Location>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ResponseBody
    private ResponseEntity<Location> handleNotFound() {
        return new ResponseEntity<Location>(HttpStatus.NOT_FOUND);
    }

}
