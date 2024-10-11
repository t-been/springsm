package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

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

    @RequestMapping("/getranking")
    public List<Map<String, Object>> getRanking() {
        List<Map<String, Object>> rankings = new ArrayList<>();

        String[] names = {"현무1호", "현무2호", "현무3호", "현무4호", "현무5호"};
        List<Integer> ranks = Arrays.asList(1, 2, 3, 4, 5);

        Collections.shuffle(ranks);

        for (int i = 0; i < names.length; i++) {
            Map<String, Object> obj = new HashMap<>();
            obj.put("rank", ranks.get(i));
            obj.put("name", names[i]);
            rankings.add(obj);
        }
        return rankings;
    }
}
