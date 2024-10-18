package edu.sm.cart;

import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class InsertTest {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        CartDto cartDto = CartDto.builder()
                .userId("user01")
                .itemId(122)
                .count(30)
                .build();
        try {
            cartService.add(cartDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
