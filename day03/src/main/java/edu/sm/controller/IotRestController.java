package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@Slf4j
@RequestMapping("/iot")
public class IotRestController {

    // IoT 데이터를 임시로 저장할 리스트 (실제 구현에서는 데이터베이스 사용 가능)
    private List<Float> powerData = new ArrayList<>();

    // IoT 데이터를 수신하는 기존 메서드
    @RequestMapping("/power")
    public Object receiveData(@RequestBody String data) {
        log.info(data);
        try {
            powerData.add(Float.parseFloat(data));  // 수신된 데이터를 리스트에 저장
        } catch (NumberFormatException e) {
            log.error("Invalid data format: " + data);
        }
        return 1;
    }

    // 실시간 차트 데이터를 반환하는 새로운 엔드포인트
    @RequestMapping("/chartData")
    public List<Float> getChartData() {
        // 최근 10개의 데이터만 반환
        log.info("Returning chart data" + powerData);
        int start = Math.max(0, powerData.size() - 10);
        return powerData.subList(start, powerData.size());
    }
}
