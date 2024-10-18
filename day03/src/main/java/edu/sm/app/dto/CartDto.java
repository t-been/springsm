package edu.sm.app.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class CartDto {
    private int cartId;
    private String userId;
    private int itemId;
    private int count;
    private LocalDateTime regDate;
    private Item item;
}