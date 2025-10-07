package com.phamkhanhhand.contho.budget_management.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdjustmentDTO {

    private Long balanceID;

    private String segment1;

    private String segment2;

    private String segment3;

    private String segment4;

    private String segment5;

    private String segment6;

    private String segment7;

    private String segment8;

    private String segment9;

    private String segment10;

    private BigDecimal amount;

    private BigDecimal approvedAmount;

    private String period;
    
}
