package edu.sm.car;

import edu.sm.app.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectTest {
    @Autowired
    CarService carService;

    @Test
    void contextLoads() {
        try {
            carService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}