package com.phamkhanhhand.contho.budget_management.service;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonApprovalResponseDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonRequestDTO;

import java.util.List;


public interface AdjustmentHistoryService {
    public void makeHistory(Long id, String username, String fromStatus, String toStatus, String comment, String budgetAdjustmentNo);

    }
