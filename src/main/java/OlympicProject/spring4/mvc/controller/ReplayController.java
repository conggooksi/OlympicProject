package OlympicProject.spring4.mvc.controller;


import OlympicProject.spring4.mvc.service.ReplayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class ReplayController {

    private ReplayService rsrv;

    @Autowired
    public ReplayController(ReplayService rsrv) {
        this.rsrv = rsrv;
    }


    // 다시보기 메인 페이지
    @GetMapping("/replay")
    public ModelAndView list(ModelAndView mv, String cpage, String event, String country) {

        if (cpage == null) cpage = "1";

        mv.setViewName("replay/list.tiles");

        mv.addObject("rbd", rsrv.readReplay(cpage, event, country));
        mv.addObject("rmvo", rsrv.readMaxReplay());
        mv.addObject("rrmvo", rsrv.readRecMaxReplay());
        mv.addObject("rbdcnt", rsrv.countReplay(event,country));

        return mv;
    }

    // Ajax를 이용한 더보기 출력 처리
    @ResponseBody
    @GetMapping("/replay/morePlay")
    public void morePlay(String rno, HttpServletResponse res){

        try {
            res.setContentType("application/json; charset=UTF-8");

            res.getWriter().print( rsrv.morePlay(rno) );
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 영상 보기 처리
    @GetMapping("/replay/view")
    public ModelAndView view(String rno, ModelAndView mv) {

        mv.setViewName("replay/view.tiles");
        rsrv.viewCountReplay(rno);
        mv.addObject("rvo", rsrv.readOneReplay(rno));
        mv.addObject("rvoall", rsrv.readAllReplay());

        return mv;
    }
}
