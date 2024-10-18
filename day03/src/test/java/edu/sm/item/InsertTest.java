package edu.sm.item;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.service.CustService;
import edu.sm.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class InsertTest {
    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        ItemDto itemDto = ItemDto.builder().itemName("나이키").itemPrice(50000).imgName("nike.jpg").build();
        try {
            itemService.add(itemDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}