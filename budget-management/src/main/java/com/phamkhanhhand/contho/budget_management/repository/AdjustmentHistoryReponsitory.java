package com.phamkhanhhand.contho.budget_management.repository;

import com.phamkhanhhand.contho.budget_management.model.AdjustmentDetail;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdjustmentHistoryReponsitory extends JpaRepository<AdjustmentHistory, Long> {

}