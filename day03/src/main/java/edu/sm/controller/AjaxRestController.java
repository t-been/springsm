package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime() {
        JSONObject obj = new JSONObject();
        // {'ctime': '2023-12-12'}
        LocalDateTime now = LocalDateTime.now();
        obj.put("ctime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now));

        return obj;
    }
}
