package edu.sm.controller;

//import edu.sm.app.dto.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
public class ItemController {

    String dir = "item/";

    @RequestMapping("")
    public String item(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }

    @RequestMapping("add")
    public String add(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("get")
    public String get(Model model) {
//        List<Item> items = new ArrayList<>();
//        items.add(Item.builder().id(1).name("item01").price(1000).imgname("img01.jpg").regdate(new Date()).build());
//        items.add(Item.builder().id(2).name("item02").price(2000).imgname("img02.jpg").regdate(new Date()).build());
//        items.add(Item.builder().id(3).name("item03").price(3000).imgname("img03.jpg").regdate(new Date()).build());
//        items.add(Item.builder().id(4).name("item04").price(4000).imgname("img04.jpg").regdate(new Date()).build());
//        items.add(Item.builder().id(5).name("item05").price(5000).imgname("img05.jpg").regdate(new Date()).build());

//        model.addAttribute("items", items);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"get");
        return "index";
    }
}
