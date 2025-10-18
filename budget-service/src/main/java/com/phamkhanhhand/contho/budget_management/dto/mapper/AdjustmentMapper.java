package com.phamkhanhhand.contho.budget_management.dto.mapper;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface AdjustmentMapper {
    AdjustmentDTO toDTO(Adjustment balance);
    Adjustment toEntity(AdjustmentDTO dto);
}
