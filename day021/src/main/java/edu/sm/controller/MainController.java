package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {

    @RequestMapping("/")
    public String main(Model model) {
        log.info("start main");
        // Database 데이터를 가지고 온다.
        model.addAttribute("data", "Hello world");
        model.addAttribute("num", 10000);

        return "index";
    }
}
