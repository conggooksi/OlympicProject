package kappa.spring4.mvc.controller;

import kappa.spring4.mvc.dao.ReplayBoardDAO;
import kappa.spring4.mvc.service.ReplayBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReplayBoardController {

    private ReplayBoardService rsrv;

    @Autowired
    public ReplayBoardController(ReplayBoardService rsrv) {
        this.rsrv = rsrv;
    }

    @GetMapping("/")
    public ModelAndView list(ModelAndView mv, String event, String country) {

        mv.setViewName("replayBoard.tiles");

        mv.addObject("rbd", rsrv.readReplay(event, country));

        return mv;
    }


}
