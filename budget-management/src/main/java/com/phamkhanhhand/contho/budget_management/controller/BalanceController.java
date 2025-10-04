package com.phamkhanhhand.contho.budget_management.controller;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.service.BalanceService;
import com.phamkhanhhand.contho.budget_management.service.impl.BalanceServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/balance")
public class BalanceController {

    private final BalanceService balanceService;

    @GetMapping
    public List<BalanceDTO> getBudgets() {
        var x = balanceService.getAll();

        return x;
    }

}
