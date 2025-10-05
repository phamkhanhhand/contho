package com.phamkhanhhand.contho.budget_management.controller;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDetailDTO;
import com.phamkhanhhand.contho.budget_management.service.BalanceService;
import com.phamkhanhhand.contho.budget_management.service.impl.BalanceServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/balance")
public class BalanceController {

    private final BalanceService balanceService;


    /*
    * hold budget from balances
    * phamkhanhhand Oct 04, 2025
     */
    @PostMapping("hold")
    public boolean hold(@RequestBody BudgetRequestDTO budgetRequestDTO) {
        return balanceService.hold(budgetRequestDTO);
    }

    /*
     * hold budget from balances
     * phamkhanhhand Oct 04, 2025
     */
    @PostMapping("revert")
    public boolean revert(@RequestBody List<Integer> listBudgetRequestID) {
        return balanceService.revert(listBudgetRequestID);
    }

    @GetMapping
    public List<BalanceDTO> getBudgets() {
        var x = balanceService.getAll();

        return x;
    }

}
