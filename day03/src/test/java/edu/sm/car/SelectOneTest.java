package edu.sm.car;

import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CarService;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectOneTest {
    @Autowired
    CarService carService;

    @Test
    void contextLoads() {
        CarDto carDto = CarDto.builder().carId("1").carModel("K5").build();
        try {
            carService.get(carDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}