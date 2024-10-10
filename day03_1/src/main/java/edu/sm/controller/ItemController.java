package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class ItemController {
    String dir = "item/";

    @RequestMapping("/itemList")
    public String itemList(Model model){
        model.addAttribute("center",dir + "itemList");
        return "index";
    }

    @RequestMapping("/itemReg")
    public String itemReg(Model model){
        model.addAttribute("center",dir + "itemReg");
        return "index";
    }
}