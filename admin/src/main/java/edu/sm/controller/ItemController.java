package edu.sm.controller;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
@Slf4j
public class ItemController {

    private final ItemService itemService;
    String dir = "item/";


    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, ItemDto itemDto) throws Exception {
        // 데이터 입력
        itemDto.setImgName(itemDto.getImage().getOriginalFilename());
        itemService.add(itemDto);

        return "redirect:/item/get";
    }

    @RequestMapping("/update")
    public String update(Model model, ItemDto itemDto) throws Exception {
        // id, name, price, imgname, or newimg
        itemService.modify(itemDto);
        return "redirect:/item/detail?id="+itemDto.getItemId();
    }

    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("id") int id) throws Exception {
        // id, name, price, imgname, or newimg
        itemService.del(id);
        return "redirect:/item/get";
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<ItemDto> list = new ArrayList<>();
        list = itemService.get();
        model.addAttribute("itemlist",list);
        model.addAttribute("center",dir+"get");


        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        ItemDto itemDto = null;

        itemDto = itemService.get(id);
        model.addAttribute("item",itemDto);
        model.addAttribute("center",dir+"detail");


        return "index";
    }
}
