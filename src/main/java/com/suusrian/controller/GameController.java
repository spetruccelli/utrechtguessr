package com.suusrian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class GameController {
    @RequestMapping("game")
    public ModelAndView game() {
        String message = "<h1>The game starts now!<h1>";
        return new ModelAndView("game", "message", message);
    }



}
