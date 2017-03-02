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
        String message = "<h1>The game starts now!<h1>";
        return new ModelAndView("game", "message", message);
    }

    //    op te zoeken door: http://localhost:8080/locations/1
    @RequestMapping(value = "locations/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Location> getLocationById(@PathVariable int id) {
        System.out.println("stap 0 = " + id);
        try {
            System.out.println("stap 1 = " + id);
            Optional<Location> location = locationDao.getLocation(id);
            if (location.isPresent()) {
                return new ResponseEntity<>(location.get(), HttpStatus.OK);
            }
            else {
                return handleNotFound();
            }
        }
        catch (Exception e){
            return handleError(e);

        }
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
