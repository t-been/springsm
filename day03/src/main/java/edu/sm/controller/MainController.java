package edu.sm.controller;

import edu.sm.app.dto.OcrDto;
import edu.sm.util.FileUploadUtil;
import edu.sm.util.OCRUtil;
import edu.sm.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Controller
@Slf4j
public class MainController {

    @Value("${app.key.wkey}")
    String wkey;
    @Value("${app.key.skey}")
    String sKey;
    @Value("${app.url.server-url}")
    String serverurl;
    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;


    @RequestMapping("/")
    public String main(Model model) {
        log.info("Start Main");
        return "index";
    }

    @RequestMapping("/websocket")
    public String webocket(Model model) {
        model.addAttribute("serverurl", serverurl);
        model.addAttribute("center", "websocket");
        return "index";
    }

    @RequestMapping("/chat")
    public String chat(Model model) {
        model.addAttribute("serverurl", serverurl);
        model.addAttribute("center", "chat");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        model.addAttribute("center", "about");
        return "index";
    }

    @RequestMapping("/webcam")
    public String webcam(Model model) {
        model.addAttribute("center", "webcam");
        return "index";
    }

    @RequestMapping("/wh")
    @ResponseBody
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("108",wkey);
    }

    @RequestMapping("/sh")
    @ResponseBody
    public Object sh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather2("1835848",sKey);
    }

    @RequestMapping("/ocr")
    public String ocr(Model model){
        model.addAttribute("center","ocr");
        return "index";
    }

    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, OcrDto ocrDto) throws IOException {
        String imgname = ocrDto.getImage().getOriginalFilename();

        FileUploadUtil.saveFile(ocrDto.getImage(), uploadImgDir);
        JSONObject jsonObject = OCRUtil.getResult(uploadImgDir, imgname);
        Map<String, String> map = OCRUtil.getData(jsonObject);

        model.addAttribute("result",map);
        model.addAttribute("imgname",imgname);
        model.addAttribute("center","ocr");
        return "index";
    }
}