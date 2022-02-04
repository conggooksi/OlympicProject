package OlympicProject.spring4.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ScheduleController {

    @GetMapping("/schedule/schedule")
    public String schedule() {

        return "schedule/schedule.tiles";
    }

    @GetMapping("/schedule_curling")
    public String schedule_curling() {

        return "schedule/schedule_curling.tiles";
    }

    @GetMapping("/schedule_short_track")
    public String schedule_short_track() {

        return "schedule/schedule_short_track.tiles";
    }

    @GetMapping("/schedule_ski_jump")
    public String schedule_ski_jump() {

        return "schedule/schedule_ski_jump.tiles";
    }

    @GetMapping("/schedule_skeleton")
    public String schedule_skeleton() {

        return "schedule/schedule_skeleton.tiles";
    }

    @GetMapping("/schedule_figure_skating")
    public String schedule_figure_skating() {

        return "schedule/schedule_figure_skating.tiles";
    }
}
