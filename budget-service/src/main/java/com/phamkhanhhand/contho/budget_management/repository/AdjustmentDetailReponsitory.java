package com.phamkhanhhand.contho.budget_management.repository;

import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdjustmentDetailReponsitory extends JpaRepository<AdjustmentDetail, Long> {
    List<AdjustmentDetail> findByBudgetAdjustmentID(Long budgetAdjustmentID);
}