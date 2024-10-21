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
class UpdateTest {
    @Autowired
    CarService carService;

    @Test
    void contextLoads() {
        CarDto carDto = CarDto.builder().carId("1").carModel("아반뗴").imgName("ass").carPrice("10000000").build();
        try {
            carService.modify(carDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}