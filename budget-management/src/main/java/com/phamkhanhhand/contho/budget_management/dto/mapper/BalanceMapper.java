package com.phamkhanhhand.contho.budget_management.dto.mapper;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.model.Balance;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface BalanceMapper {
    BalanceDTO toDTO(Balance balance);
    Balance toEntity(BalanceDTO dto);
}
