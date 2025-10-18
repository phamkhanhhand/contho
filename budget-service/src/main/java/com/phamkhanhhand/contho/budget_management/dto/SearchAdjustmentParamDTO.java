package com.phamkhanhhand.contho.budget_management.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SearchAdjustmentParamDTO {

    private String searchValue;
    private Integer pageIndex;
    private Integer pageSize;

    private String budgetAdjustmentNo;
    private String budgetGroup;
    private String budgetGroupName;
    private String status;
    private String description;
    private String comment;
}
