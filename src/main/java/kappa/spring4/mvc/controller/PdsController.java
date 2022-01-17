package kappa.spring4.mvc.controller;

import kappa.spring4.mvc.service.PdsService;
import kappa.spring4.mvc.utils.FileUpDownUtil;
import kappa.spring4.mvc.utils.GoogleCaptchaUtil;
import kappa.spring4.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PdsController {

    private GoogleCaptchaUtil gcutil;
    private PdsService psrv;


    @Autowired
    public PdsController(GoogleCaptchaUtil gcutil, PdsService psrv) {
        this.gcutil = gcutil;
        this.psrv = psrv;
    }

    // 목록보기
    @GetMapping("/pds/list")
    public ModelAndView list(ModelAndView mv, String cpage,
                             String ftype, String fkey) {
        if (cpage == null) cpage = "1";

        mv.setViewName("pds/list.tiles");
        //mv.addObject("pds", psrv.readPds(cpage,ftype,fkey));
        //mv.addObject("pdcnt", psrv.countPds(ftype,fkey)); // 총게시물 수

        return mv;
    }

    // 본문보기
    @GetMapping("/pds/view")
    public ModelAndView view(String pno, ModelAndView mv) {

        mv.setViewName("pds/view.tiles");
        //psrv.viewCountPds(pno); // 본문글 조회수 갱신
        //mv.addObject("pvo", psrv.readOnePds(pno)); // 본문글 조회
        //mv.addObject("rps", prsrv.readReply(pno)); // 댓글들 조회

        return mv;
    }

    //새글쓰기
    @GetMapping("/pds/write")
    public String write() {

        return "pds/write.tiles";
    }

    // 새글쓰기 처리
    // Servlet 3.x부터 파일업로드 기능 내장 - MultipartFile 사용
    @PostMapping("/pds/write")
    public String writeok(PdsVO pvo, MultipartFile[] file) {
        psrv.newPds(pvo, file);

        return "redirect:/pds/list?cpage=1";
    }

}
