package kappa.spring4.mvc.controller;

import kappa.spring4.mvc.service.PdsService;
import kappa.spring4.mvc.utils.FileUpDownUtil;
import kappa.spring4.mvc.utils.GoogleCaptchaUtil;
import kappa.spring4.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class PdsController {

    private GoogleCaptchaUtil gcutil;
    private PdsService psrv;
    private FileUpDownUtil fudutil;


    @Autowired
    public PdsController(GoogleCaptchaUtil gcutil, PdsService psrv, FileUpDownUtil fudutil) {
        this.gcutil = gcutil;
        this.psrv = psrv;
        this.fudutil = fudutil;
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
        mv.addObject("pvo", psrv.readOnePds(pno)); // 본문글 조회
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

    // 첨부파일 다운로드
    // 파일다운로드시 보안사항
    // 업로드한 파일들은 웹서버와 동일한 디렉토리에 저장하지 말것!
    // 업로드한 파일을 다운로드할 때 다운로드할 파일이름이 노출되지 않도록 함!
    // 다운로드할 파일이름은 원본 + 식별코드를 이용해서 설정!
    // 컨트롤러 메서드에 ResponseBody 어노테이션을 사용하면
    // view를 이용해서 데이터를 출력하지 않고
    // HTTP 응답으로 직접 데이터를 브라우져로 출력할 수 있음
    @ResponseBody
    @GetMapping("/pds/down")
    public void down(String pno, String order, HttpServletResponse res) {

        try {
            // 다운로드할 원래의 파일명을 알아냄
            PdsVO p = psrv.readOneFname(pno, order);

            // 알아낸 원래의 파일을 클라이언트로 전송
            fudutil.procDownloadV2(p.getFname1(), p.getUuid(), res);

            // 다운로드한 파일명에 대해 다운수 처리
           psrv.countDownPds(pno, order);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
