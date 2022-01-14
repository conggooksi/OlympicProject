package kappa.spring4.mvc.controller;

import kappa.spring4.mvc.service.MemberService;
import kappa.spring4.mvc.utils.GoogleCaptchaUtil;
import kappa.spring4.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class JoinController {

    @Autowired private MemberService msrv;
    @Autowired private GoogleCaptchaUtil gcutil;

    // 이용약관
    @GetMapping("join/agree")
    public String agree() {

        return "join/agree.tiles";
    }

    // 실명확인
    @GetMapping("/join/checkme")
    public String checkme() {

        return "join/checkme.tiles";
    }

    // 회원정보 입력
    @GetMapping("/join/joinme")
    public String joinme() {

        return "join/joinme.tiles";
    }


    // 회원가입시 입력한 정보는 MemberVO객체 저장됨
    // 하지만, 클라이언트에서 회원정보와 상관없는 데이터를 보낸 경우
    // HttpServletRequest 객체를 이용해서 처리함 (추천!)
    // 물론, MemberVO 객체에 같이 정의해서 사용해도 됨

    // joinme -> controller -> joinok (정보입력완료, captcha 체크ok)
    // joinme -> controller -> joinme (정보입력완료, captcha 체크no)

    // Model/ModelAttribute/ModelAndView
    // 뷰에 사용자 데이터를 보내고 싶을때 사용하는 객체들
    // 단, 데이터는 request 객체에 1회성으로 저장됨

    // RedirectAttribute
    // 리다이렉트된 뷰에 사용자 데이터를 보내고 싶을때 사용하는 객체
    // 단, 데이터는 session 객체에 1회성으로 저장됨

    // 회원정보 입력처리
    @PostMapping("/join/joinme")
    public String joinmeok(HttpServletRequest req, RedirectAttributes rds, MemberVO mvo) throws UnsupportedEncodingException {

        // 질의문자열에 한글을 포함시키려면
        // 반드시 URLEncoder를 이용해서 한글에 대한 적절한 인코딩이 필요!
        String params = "?nm=" + URLEncoder.encode(mvo.getName(), "UTF-8");
        params += "&jm1=" + mvo.getJumin1();
        params += "&jm2=" + mvo.getJumin2();

        String returnPage = "redirect:/join/joinme" + params;
        String gCaptcha = req.getParameter("g-recaptcha");

        // captcha코드의 유효성을 확인함
        // 결과 : true  => 테이블에 회원정보 저장, /join/joinok 이동
        // 결과 : false => /join/joinme 이동
        if (gcutil.checkCaptcha(gCaptcha)) {
            if ( msrv.newMember(mvo) )
                returnPage = "redirect:/join/joinok";
            else
                rds.addFlashAttribute("mvo", mvo);
        } else {
            System.out.println("captcha 확인 실패!!");
            rds.addFlashAttribute("checkCaptcha", "자동가입방지 확인이 실패했어요!!");
            rds.addFlashAttribute("mvo", mvo);
        }

        return returnPage;
    }

    // 가입완료
    @GetMapping("/join/joinok")
    public String joinok() {

        return "join/joinok.tiles";
    }

    // 아이디 중복체크
    // /join/checkuid?uid=아이디
    // 검색된 결과를 뷰페이지 없이 바로 응답으로 출력 : REST
    // 서블릿에서 제공하는 HttpServletResponse 객체를 이용하면
    // 스프링의 뷰리졸버 없이 응답을 출력할 수 있음
    // 결과는 자바스크립트 ajax로 적절히 가공해서 폼에 출력
    @ResponseBody
    @GetMapping("/join/checkuid")
    public void checkuid(String uid, HttpServletResponse res) {

        // 아이디 중복체크 여부 결과(0:사용가능, 1:사용불가)를
        // 뷰리졸버 없이 HttpServletResponse를 통해 바로 출력
        try {
            res.getWriter().print( msrv.checkUserid(uid) );
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    // 우편번호 검색
    // /join/findZipcode?dong=구로1동
    @ResponseBody
    @GetMapping("/join/findZipcode")
    public void findZipcode(String dong, HttpServletResponse res){

        try {
            // 응답결과를 JSON으로 설정하고 한글 인코딩은 UTF-8로 MIME type지정
            res.setContentType("application/json; charset=UTF-8");

            res.getWriter().print( msrv.findZipcode(dong) );
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
