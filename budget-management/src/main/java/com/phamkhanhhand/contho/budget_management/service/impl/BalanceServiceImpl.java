package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.BalanceMapper;
import com.phamkhanhhand.contho.budget_management.repository.BalanceReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.impl.BalanceRepositoryImpl;
import com.phamkhanhhand.contho.budget_management.service.BalanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
//@RequiredArgsConstructor
public class BalanceServiceImpl implements BalanceService {
    @Autowired
    private   BalanceMapper balanceMapper;
    @Autowired
    private   BalanceReponsitory balanceReponsitory;

    @Autowired
    private BalanceRepositoryImpl balanceReponsitoryImpl;

    @Override
    public List<BalanceDTO> getAll() {
        var entities = balanceReponsitory.findAll();
        return entities.stream()
                .map(balanceMapper::toDTO)
                .toList();
    }


    @Override
    public boolean hold(BudgetRequestDTO budgetRequestDTO)
    {
        return balanceReponsitoryImpl.hold(budgetRequestDTO);
    }


    @Override
    public boolean revert(List<Integer> listBudgetRequestID)
    {
        return balanceReponsitoryImpl.revert(listBudgetRequestID);
    }

    public List<BalanceDTO> confirm(BudgetRequestDTO budgetRequestDTO)
    {
        return null;
    }

    public List<BalanceDTO> revert(BudgetRequestDTO budgetRequestDTO)
    {
        return null;
    }

    public List<BalanceDTO> check(BudgetRequestDTO budgetRequestDTO)
    {
        return null;
    }
}
