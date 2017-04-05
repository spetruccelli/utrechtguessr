package com.suusrian.controller;

import com.suusrian.dao.LocationDao;
import com.suusrian.dao.ScoreDao;
import com.suusrian.domain.Location;
import com.suusrian.domain.Score;
import mockit.Expectations;
import mockit.Injectable;
import mockit.Tested;
import mockit.integration.junit4.JMockit;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(JMockit.class)
public class GameControllerTest {

    @Tested
    private GameController controller;

    @Injectable
    private LocationDao locationDao;

    @Injectable
    private ScoreDao scoreDao;

    @Test
    public void shouldDisplayGame() {
        Location location = new Location(111, "1.222", "1.333", "1.444", "testRemark");
        List<Location> locations = Arrays.asList(location, location, location, location, location, location, location, location, location, location);
        Optional<Score> score = Optional.of(new Score(1, 1.0, 1));

        new Expectations() {{
            locationDao.getLocations();
            result = locations;

            scoreDao.getScoreById(anyInt);
            result = score;
        }};


        ModelAndView result = controller.game();

        String message = (String) result.getModel().get("message"); //Ok... here we go.. :) The game starts now!
        List<Location> locationList = ( List<Location>) result.getModel().get("locationList"); //10
        List<Score> scoreList = ( List<Score>) result.getModel().get("scoreList"); //10

        assertNotNull(result.getModel());
        assertTrue(message.contains("The game starts now"));
        assertEquals(locationList.size(), 10);
        assertEquals(scoreList.size(), 10);
    }

}