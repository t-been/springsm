package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private String cartUserId;
    private int cartItemId;
    private int cartCount;
    private LocalDateTime cartRegDate;
    private String formattedRegDate; // 문자열로 변환된 날짜
    private String itemName;
    private String itemPrice;
    private String imgName;

//    private ItemDto itemdto;
}