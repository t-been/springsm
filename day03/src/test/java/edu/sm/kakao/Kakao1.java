package edu.sm.kakao;

import edu.sm.util.KakaoLocal;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class Kakao1 {

    @Value("${app.key.kakao_rest_key}")
    String key;

    @Test
    void contextLoads() throws Exception {
        String lat = "36.801572";
        String lng = "127.074947";
        String type = "병원";
        String result = (String) KakaoLocal.getContent(key, lat, lng, type);
        System.out.println(result);
    }
}
