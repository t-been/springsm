package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.Search;
import edu.sm.app.service.CarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

@Controller
@Slf4j
@RequestMapping("/car")
@RequiredArgsConstructor
public class CarController {

    final CarService carService;

    String dir = "car/";

    @RequestMapping("")
    public String car(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }

    @RequestMapping("/get")
    public String info(Model model) throws Exception {
        List<CarDto> cars = null;
        cars = carService.get();
        model.addAttribute("cars", cars);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }

    @RequestMapping("/getpage")
    public String getpage(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<CarDto> p;
        p = new PageInfo<>(carService.getPage(pageNo), 5); // 5:하단 네비게이션 개수

        model.addAttribute("cpage",p);
        model.addAttribute("target","/car");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"page");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") Integer id) throws Exception {
        CarDto carDto = null;
        carDto = carService.get(id);
        model.addAttribute("car", carDto);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, CarDto carDto) throws Exception {
        carService.modify(carDto);
        return "redirect:/car/detail?id="+carDto.getCarId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, @RequestParam("id") Integer id) throws Exception {
        carService.del(id);

        return "redirect:/car/get";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, CarDto carDto) throws Exception {
        carService.add(carDto);
        return "redirect:/car/add";
    }

    @RequestMapping("/search")
    public String search(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model, Search search, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) throws Exception {
        PageInfo<CarDto> p;
        p = new PageInfo<>(carService.getFindPage(pageNo, search), 5); // 5:하단 네비게이션 개수
        model.addAttribute("cpage",p);
        model.addAttribute("target","car");
        model.addAttribute("search",search);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }
}