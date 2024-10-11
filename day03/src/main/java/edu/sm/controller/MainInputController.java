package edu.sm.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainInputController {
    // 로그아웃 처리 메소드
    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if(session != null) {
            session.invalidate(); // 세션 정보 삭제
        }
        return "redirect:/"; // 로그아웃 후 메인 페이지로 리다이렉트
    }

    // 로그인 처리 메소드
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd,
                            HttpSession session) {
        log.info("id : " + id);
        log.info("pwd : " + pwd);

        // 로그인 성공 여부에 따른 이동 처리
        if(id.equals("aaa") && pwd.equals("111")) {
            session.setAttribute("loginid", id); // 세션에 로그인 정보 저장
            return "redirect:/"; // 로그인 성공 시 메인 페이지로 리다이렉트
        } else {
            model.addAttribute("center", "loginfail"); // 로그인 실패 시 실패 뷰를 center에 추가
            return "index"; // 로그인 실패 시 index 뷰 반환 (로그인 실패 화면)
        }
    }

    // 회원가입 처리 메소드
    @RequestMapping("/signupimpl")
    public String registerimpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd,
                               @RequestParam("name") String name, @RequestParam("email") String email) {
        log.info("id : " + id);
        log.info("pwd : " + pwd);
        log.info("name : " + name);
        log.info("email : " + email);
        return "index"; // 회원가입 후 index 페이지로 이동
    }
}
