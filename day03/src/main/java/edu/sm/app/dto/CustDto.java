package edu.sm.app.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CustDto {
    private String custId;
    private String custPwd;
    private String custName;
}