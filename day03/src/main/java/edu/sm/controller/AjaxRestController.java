package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Marker;
import edu.sm.app.service.CustService;
import edu.sm.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@RestController
@Slf4j
@RequiredArgsConstructor
public class AjaxRestController {

    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;

    final CustService custService;

    @RequestMapping("/getmarkers")
    public Object getmarkers(@RequestParam("target") int target){
        log.info("Tager"+target);
        List<Marker> markers = new ArrayList<Marker>();
        if(target == 100){
            markers.add(new Marker(37.581312, 126.968242,"순대국1","ss1.jpg", 101));
            markers.add(new Marker(37.521312, 126.928242,"순대국2","ss2.jpg", 102));
            markers.add(new Marker(37.551312, 126.958242,"순대국3","ss3.jpg", 103));
        }else if(target == 200){

        }else{

        }
        log.info("Size"+markers.size());

        return markers;
    }

    @RequestMapping("/getbike")
    public Object getbike(){
        JSONObject obj = new JSONObject();
        double lat = 36.789165;
        double lng = 127.064981;
        Random r = new Random();
        float num = r.nextFloat(1);
        lat += num/10;
        lng += num/10;
        obj.put("lat", lat);
        obj.put("lng", lng);
        return obj;
    }

    @RequestMapping("/getctime")
    public Object getctime() {
        JSONObject obj = new JSONObject();
        // {'ctime': '2023-12-12'}
        LocalDateTime now = LocalDateTime.now();
        obj.put("ctime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now));

        return obj;
    }

    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("rid") String id) throws Exception {
        JSONObject obj = new JSONObject();
        CustDto custDto = null;
        custDto = custService.get(id);
        obj.put("result", "0");
        if(custDto != null) {
            obj.put("result", "1");
        }
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

    @RequestMapping("/saveimg")
    public String saveimg(@RequestParam("file") MultipartFile file) throws IOException {
        String imgname = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, uploadImgDir);
        return imgname;
    }
}
