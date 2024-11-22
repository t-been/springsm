package edu.sm.chatbot;

import edu.sm.util.ChatBotUtil;
import edu.sm.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
@Slf4j
public class ChatbotTests {

    @Value("${app.url.chatbot}")
    String url;
    @Value("${app.key.chatbot}")
    String key;

    @Test
    void contextLoads() throws Exception {
        String sendMsg = "채팅";
        String result = ChatBotUtil.getMsg(url, key, sendMsg);
        log.info(result);
    }

}
