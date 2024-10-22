package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CarDto {
    private Integer carId;
    private String carModel;
    private Integer carPrice;
    private String imgName;
    private LocalDateTime carRegDate;

    public String getFormattedCarRegDate() {
        if (carRegDate != null) {
            return carRegDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        }
        return "";
    }
}