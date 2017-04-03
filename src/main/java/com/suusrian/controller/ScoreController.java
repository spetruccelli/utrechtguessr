package com.suusrian.controller;

import com.suusrian.dao.ScoreDao;
import com.suusrian.domain.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/score")
public class ScoreController {

    private ScoreDao scoreDao;

    @Autowired
    public ScoreController(ScoreDao scoreDao) {

        this.scoreDao = scoreDao;
    }


    @RequestMapping(value = "/addscore", method = RequestMethod.POST)
    @ResponseBody
    public String addScore(Score score) {
        if (score != null) {
            try {
                Score newScore = scoreDao.addScore(score);
            } catch (Exception e) {
                return "error";
            }
        }
        return "success";
    }
}
