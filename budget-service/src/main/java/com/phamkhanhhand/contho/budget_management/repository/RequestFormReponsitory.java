package com.phamkhanhhand.contho.budget_management.repository;

import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RequestFormReponsitory extends JpaRepository<Adjustment, Long> {
    Optional<Adjustment> findByBudgetAdjustmentID(Long budgetAdjustmentID);
}