package com.phamkhanhhand.contho.budget_management.service;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;

import java.util.List;


public interface AdjustmentService {

    List<AdjustmentDTO> getAll();

    AdjustmentDTO getByID(Long id);




}
