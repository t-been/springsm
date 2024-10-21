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
public class CarDto {
    private String carId;
    private String carModel;
    private String carPrice;
    private String imgName;
    private LocalDateTime carRegDate;
}