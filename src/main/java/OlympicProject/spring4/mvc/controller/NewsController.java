package OlympicProject.spring4.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewsController {

    @GetMapping("/news")
    public String news() {

        return "news/news.tiles";
    }

    @GetMapping("/newspage")
    public String newspage() {

        return "news/newspage.tiles";
    }

    @GetMapping("/newspage_figure_kim")
    public String newspage_figure_kim() {

        return "news/newspage_figure_kim.tiles";
    }


}
