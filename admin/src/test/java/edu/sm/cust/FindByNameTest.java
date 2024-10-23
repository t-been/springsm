package edu.sm.cust;

import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class FindByNameTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        try {
            custService.findByName("말");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
