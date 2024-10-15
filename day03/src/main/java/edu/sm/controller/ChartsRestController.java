package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
@Slf4j
@RequestMapping("/charts")
public class ChartsRestController {
    @RequestMapping("/chart1")
    public Object chart1(){
        JSONArray jsonArray = new JSONArray();
        for(int i=1;i<=5;i++){
            JSONObject obj = new JSONObject();
            obj.put("name","NAME"+i);
            Random r = new Random();
            JSONArray jsonArray1 = new JSONArray();
            for(int j=1;j<=12;j++){
                jsonArray1.add(r.nextInt(40)+1);
            }
            obj.put("data",jsonArray1);
            jsonArray.add(obj);
        }
        return jsonArray;
    }
}