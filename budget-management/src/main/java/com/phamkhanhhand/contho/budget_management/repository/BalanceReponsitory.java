package com.phamkhanhhand.contho.budget_management.repository;

import com.phamkhanhhand.contho.budget_management.model.Balance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

public interface BalanceReponsitory extends JpaRepository<Balance, Long> {
    Optional<Balance> findByBalancingID(int balancingID);
}