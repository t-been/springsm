package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainInputController {

    final CustService custService;

    // 로그아웃 처리 메소드
    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if (session != null) {
            session.invalidate(); // 세션 정보 삭제
        }
        return "redirect:/"; // 로그아웃 후 메인 페이지로 리다이렉트
    }

    // 로그인 처리 메소드
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("ID:" + id);
        log.info("PWD:" + pwd);
        // aaa, 111
        String next = "index";
        CustDto custDto = custService.get(id);
        if(custDto == null) {
            // fail
            model.addAttribute("center", "loginfail");
        } else {
            // ok
            if(custDto.getCustPwd().equals(pwd)) {
                session.setAttribute("loginid", custDto);
                next = "redirect:/";
            } else {
                model.addAttribute("center", "loginfail");
            }
        }
        return next;
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

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto,
                               HttpSession session) throws Exception {
        log.info("Cust Info : " + custDto.toString());
        custService.add(custDto);
        session.setAttribute("loginid", custDto);
        model.addAttribute("center", "registerok");

        return "index";
    }
}

