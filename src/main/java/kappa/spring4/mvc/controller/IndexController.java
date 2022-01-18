package kappa.spring4.mvc.controller;

import kappa.spring4.mvc.service.MemberService;
import kappa.spring4.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired private MemberService msrv;

//    @GetMapping("/")
//    public String index(Model m){
//        m.addAttribute("msg", "Hello, World!!");
//
//        return "index";
//    }

    @GetMapping("/")
    public String index(Model m){

        return "index.tiles";
    }

    // 로그인 처리
    // 로그인 성공 -> 초기화면으로 이동
    // 로그인 실패 -> 로그인 실패 화면으로 이동
    @PostMapping("/login")
    public String login(MemberVO mvo, HttpSession sess) {
        String returnPage = "redirect:/loginfail";

        if (msrv.loginMember(mvo)) {
            sess.setAttribute("uid", mvo.getUserid());
            returnPage = "redirect:/";
        }

        return returnPage;
    }

    // 로그인 실패
    @GetMapping("/loginfail")
    public String loginfail(Model m){

        return "loginfail.tiles";
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession sess) {
        sess.invalidate();

        return "redirect:/";
    }

    // 다운로드 테스트
    @GetMapping("/pdstest")
    public String pdstest() {

        return "pdstest";
    }

}
