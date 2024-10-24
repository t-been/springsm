package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.dto.Search;
import edu.sm.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
public class ItemController {

    private final ItemService itemService;
    String dir = "item/";

    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    @RequestMapping("")
    public String item(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }

    @RequestMapping("/detail")
    public String add(Model model, @RequestParam("id") Integer id) throws Exception {
        ItemDto itemDto = null;
        itemDto = itemService.get(id);
        model.addAttribute("item",itemDto);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"detail");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<ItemDto> items = null;
        items = itemService.get();

        model.addAttribute("items",items);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }

    @RequestMapping("/getpage")
    public String getpage(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<ItemDto> p;
        p = new PageInfo<>(itemService.getPage(pageNo), 5); // 5:하단 네비게이션 개수

        model.addAttribute("cpage",p);
        model.addAttribute("target","/item");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"page");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model, Search search, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) throws Exception {
        PageInfo<ItemDto> p;
        p = new PageInfo<>(itemService.getFindPage(pageNo, search), 5); // 5:하단 네비게이션 개수
        model.addAttribute("cpage",p);
        model.addAttribute("target","item");
        model.addAttribute("search",search);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }
}
