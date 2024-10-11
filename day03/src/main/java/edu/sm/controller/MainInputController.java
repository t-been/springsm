package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainInputController {
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd) {
        log.info("id : " + id);
        log.info("pwd : " + pwd);
        return "index";
    }

    @RequestMapping("/signupimpl")
    public String registerimpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd, @RequestParam("name") String name, @RequestParam("email") String email) {
        log.info("id : " + id);
        log.info("pwd : " + pwd);

        log.info("name : " + name);
        log.info("email : " + email);
        return "index";
    }
}
