package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class CustController {
    String dir = "cust/";

    @RequestMapping("/custList")
    public String custList(Model model){
        model.addAttribute("center",dir + "custList");
        return "index";
    }

    @RequestMapping("/custReg")
    public String custReg(Model model){
        model.addAttribute("center",dir + "custReg");
        return "index";
    }
}