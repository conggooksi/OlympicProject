package kappa.spring4.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReplayBoardController {

    @GetMapping("/")
    public String replay() {

        return "/replayBoard/index";
    }
}
