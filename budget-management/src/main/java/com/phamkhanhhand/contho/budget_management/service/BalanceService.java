package com.phamkhanhhand.contho.budget_management.service;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import com.phamkhanhhand.contho.budget_management.model.Balance;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BalanceService {

    List<BalanceDTO> getAll();

    boolean hold(BudgetRequestDTO budgetRequestDTO);



    boolean revert(List<Integer> listBudgetRequestID);


}
