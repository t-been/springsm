package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
//@RequestMapping("/charts")
public class ChartsController {
    String dir = "charts/";

//    @RequestMapping("/charts")
//    public String charts(Model model){
//        log.info("Start Charts");
//        model.addAttribute("center",dir+"center");
//        return "index";
//    }

    @RequestMapping("/charts1")
    public String charts1(Model model){
        log.info("Start Charts1");
        model.addAttribute("center",dir+"charts1");
        return "index";
    }

    @RequestMapping("/charts2")
    public String charts2(Model model){
        log.info("Start Charts2");
        model.addAttribute("center",dir+"charts2");
        return "index";
    }

    @RequestMapping("/charts3")
    public String charts3(Model model){
        log.info("Start Charts1");
        model.addAttribute("center",dir+"charts3");
        return "index";
    }
}