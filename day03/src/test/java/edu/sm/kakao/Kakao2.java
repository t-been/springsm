package edu.sm.kakao;

import edu.sm.util.KakaoLocal;
import edu.sm.util.KoGPTUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class Kakao2 {

    @Value("${app.key.kakao_rest_key}")
    String key;

    @Test
    void contextLoads() throws Exception {
        String result = (String) KoGPTUtil.getMsg(key, "안녕하세요");
        System.out.println(result);
    }
}
