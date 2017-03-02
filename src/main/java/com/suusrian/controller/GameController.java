package com.suusrian.controller;

import com.suusrian.dao.LocationDao;
import com.suusrian.dao.LocationDaoImpl;
import com.suusrian.domain.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
public class GameController {

    private LocationDao locationDao;

    @Autowired
    public GameController(LocationDao locationDaoImpl) {
        this.locationDao = locationDaoImpl;
    }

    @RequestMapping("game")
    public ModelAndView game() {
        ModelAndView modelAndView = new ModelAndView("game");

        String message = "<h1>The game starts now!<h1>";
        modelAndView.addObject("message", message);
        List<Location> locations = new ArrayList<>();
        for(int i=1; i<4; i++) {
        Optional<Location> location = locationDao.getLocation(i);
        location.ifPresent(locations::add);
            }
        modelAndView.addObject("locationList", locations);
        return modelAndView;
    }

    //    op te zoeken door: http://localhost:8080/locations/1
    @RequestMapping(value = "locations/{id}", method = RequestMethod.GET)
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
