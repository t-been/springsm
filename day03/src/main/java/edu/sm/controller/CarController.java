package edu.sm.controller;

import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CarService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.smartcardio.Card;
import java.time.LocalDateTime;
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
    public String car(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }

    @RequestMapping("/get")
    public String info(Model model) throws Exception {
        List<CarDto> cars= carService.get();
        model.addAttribute("cars", cars);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
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
    public String updateimpl(Model model,
                             CarDto carDto) throws Exception {
        carService.modify(carDto);
        return "redirect:/car/detail?id="+carDto.getCarId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model,
                             @RequestParam("id") Integer id) throws Exception {
        carService.del(id);
        return "redirect:/car/get";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, CarDto carDto) throws Exception {
        carService.add(carDto);
        return "redirect:/car/add";
    }
}