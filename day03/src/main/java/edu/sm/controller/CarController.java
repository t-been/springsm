package edu.sm.controller;

import edu.sm.app.dto.CarDto;
import edu.sm.app.service.CarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/car")
@RequiredArgsConstructor
public class CarController {

    final CarService carService;

    String dir = "car/";

    @RequestMapping("")
    public String cust(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }

    @RequestMapping("/detail")
    public String add(Model model, @RequestParam("id") String id) throws Exception {
        CarDto carDto = null;
        carDto = carService.get(carDto);
        model.addAttribute("car",carDto);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"detail");
        return "index";
    }

//    @RequestMapping("/updateimpl")
//    public String updateimpl(Model model, CustDto custDto) throws Exception {
//        custService.modify(custDto);
//
//        return "redirect:/cust/detail?id=" + custDto.getCustId();
//    }

//    @RequestMapping("/deleteimpl")
//    public String deleteimpl(Model model, @RequestParam("id") String id) throws Exception {
//        custService.del(id);
//
//        return "redirect:/cust/get";
//    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<CarDto> cars = new ArrayList<>();
        cars = carService.get();

        model.addAttribute("cars",cars);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
}