package OlympicProject.spring4.mvc.controller;

import OlympicProject.spring4.mvc.service.MemberService;
import OlympicProject.spring4.mvc.utils.GoogleCaptchaUtil;
import OlympicProject.spring4.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class MemberController {

    @Autowired private MemberService msrv;
    @Autowired private GoogleCaptchaUtil gcutil;

    @GetMapping("/member/magree")
    public String magree(){
        return "member/magree.tiles";
    }

    //실명확인
    @GetMapping("/member/mcheckme")
    public String mcheckme(){

        return "member/mcheckme.tiles";
    }

    //회원정보입력
    @GetMapping("/member/mjoinme")
    public String mjoinme(){

        return "member/mjoinme.tiles";
    }

    @PostMapping("/member/mjoinme")
    public String mjoinmeok(HttpServletRequest req, RedirectAttributes rds, MemberVO mvo) throws UnsupportedEncodingException {

        // 질의문자열에 한글을 포함시키려면
        // 반드시 URLEncoder를 이용해서 한글에 대한 적절한 인코딩이 필요!
        String params = "?nm=" + URLEncoder.encode(mvo.getName(),"UTF-8");
        params += "&jm1=" + mvo.getJumin1();
        params += "&jm2=" + mvo.getJumin2();

        String returnPage = "redirect:/member/mjoinme" + params;
        String gCaptcha = req.getParameter("g-recaptcha");

        if(gcutil.checkCaptcha(gCaptcha)){
            if(msrv.newMember(mvo))
                returnPage = "redirect:/member/mjoinok";
            else
                rds.addFlashAttribute("mvo",mvo);
        }else {
            System.out.println("captcha 확인 실패!!");
            rds.addFlashAttribute("checkCaptcha","자동가입방지 확인이 실패했어요!!");

            rds.addFlashAttribute("mvo",mvo);
        }

        return returnPage;
    }

    //회원가입완료
    @GetMapping("/member/mjoinok")
    public String mjoinok(){

        return "member/mjoinok.tiles";
    }

    @ResponseBody
    @GetMapping("/member/checkuid")
    public void checkuid(String uid, HttpServletResponse res){
        //아이디 중복체크 여부 결과(0:사용가능, 1:사용불가)를
        //뷰리졸버 없이 HttpServletResponse를 통해 바로 출력
        try {
            res.getWriter().println(msrv.checkUserid(uid));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
