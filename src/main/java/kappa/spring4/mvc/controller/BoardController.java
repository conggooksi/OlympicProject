package kappa.spring4.mvc.controller;

import kappa.spring4.mvc.service.BoardReplyService;
import kappa.spring4.mvc.service.BoardService;
import kappa.spring4.mvc.utils.GoogleCaptchaUtil;
import kappa.spring4.mvc.vo.BoardVO;
import kappa.spring4.mvc.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BoardController {

    private BoardService bsrv;
    private BoardReplyService brsrv;
    private GoogleCaptchaUtil gcutil;


    @Autowired // 생성자를 이용한 스프링 객체 주입
    public BoardController(BoardReplyService brsrv,
                           BoardService bsrv, GoogleCaptchaUtil gcutil) {
        this.bsrv = bsrv;
        this.brsrv = brsrv;
        this.gcutil = gcutil;
    }

    //새글쓰기
    @GetMapping("/board/write")
    public String write() {

        return "board/write.tiles";
    }

    // 새글쓰기 처리하기
    @PostMapping("/board/write")
    public String writeok(BoardVO bvo, HttpServletRequest req, RedirectAttributes rds) {

        String returnPage = "redirect:/board/write";
        String gCaptcha = req.getParameter("g-recaptcha");

        if (gcutil.checkCaptcha(gCaptcha)) {
            if ( bsrv.newBoard(bvo) )
                returnPage = "redirect:/board/list";
            else
                rds.addFlashAttribute("bvo", bvo);
        } else {
            rds.addFlashAttribute("checkCaptcha",
                    "자동가입방지 확인이 실패했어요!!");
            rds.addFlashAttribute("bvo", bvo);
        }

        return returnPage;
    }

    // 목록보기
    @GetMapping("/board/list")
    public ModelAndView list(ModelAndView mv, String cpage,
                             String ftype, String fkey) {
        if (cpage == null) cpage = "1";

        mv.setViewName("board/list.tiles");
        mv.addObject("bd", bsrv.readBoard(cpage,ftype,fkey));
        mv.addObject("bdcnt", bsrv.countBoard(ftype,fkey)); // 검색 후 총게시물 수

        return mv;
    }

    // 본문보기
    @GetMapping("/board/view")
    public ModelAndView view(String bno, ModelAndView mv) {

        mv.setViewName("board/view.tiles");
        bsrv.viewCountBoard(bno); // 본문글 조회수 갱신
        mv.addObject("bvo", bsrv.readOneBoard(bno)); // 본문글 조회
        mv.addObject("rps", brsrv.readReply(bno)); // 댓글들 조회

        return mv;
    }

    // 댓글 쓰기 처리
    @PostMapping("/board/replyok")
    public String replyok(ReplyVO rvo) {
        // 작성한 댓글을 확인하기 위해
        // 현재 보고 있는 본문페이지를 다시 한번 불러옴
        String returnPage = "redirect:/board/view?bno=" + rvo.getBno();

        // 댓글번호 존재 여부에 따라 댓글/대댓글 여부 판단
        if (rvo.getCno() == null) brsrv.newReply(rvo);
        else brsrv.newReReply(rvo);

        return returnPage;
    }

}
