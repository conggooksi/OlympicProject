package OlympicProject.spring4.mvc.controller;

import OlympicProject.spring4.mvc.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {

    private EventService esrv;

    @Autowired
    public EventController(EventService esrv) {
        this.esrv = esrv;
    }

    @GetMapping("/event")
    public String event() {

        return "event/list.tiles";
    }

    // 종목별 페이지
    @GetMapping("/event/view")
    public ModelAndView eventView(String event, ModelAndView mv) {

        mv.setViewName("event/view.tiles");
        mv.addObject("evo", esrv.readOneEvent(event));

        return mv;
    }

}
