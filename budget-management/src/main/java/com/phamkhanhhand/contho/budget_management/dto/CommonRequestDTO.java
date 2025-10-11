package com.phamkhanhhand.contho.budget_management.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommonRequestDTO {

    private Long id;
    private String comment;
    private String toUsername;

    private List<String> toListUsername;
    private String specialArg;
    private Map<String, Object> specialArgList;
}
