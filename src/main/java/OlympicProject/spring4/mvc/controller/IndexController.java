package OlympicProject.spring4.mvc.controller;

import OlympicProject.spring4.mvc.service.MemberService;
import OlympicProject.spring4.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired private MemberService msrv;

    @GetMapping("/")
    public String index(){

        return "index.tiles";
    }

    @PostMapping("/login")
    public String login(MemberVO mvo, HttpSession sess){

        String returnPage = "redirect:/loginfail";

        if(msrv.loginMember(mvo)){
            sess.setAttribute("uid",mvo.getUserid());
            returnPage = "redirect:/";
        }

        return returnPage;
    }

    //로그인 실패
    @GetMapping("/loginfail")
    public String loginfail(Model m){


        return "loginfail.tiles";
    }

    @GetMapping("/logout")
    public String logout(HttpSession sess){

        sess.invalidate();

        return "redirect:/";
    }

}
