package com.phamkhanhhand.contho.budget_management.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class PageParamDTO {
    private Integer pageIndex;
    private Integer pageSize;
}
