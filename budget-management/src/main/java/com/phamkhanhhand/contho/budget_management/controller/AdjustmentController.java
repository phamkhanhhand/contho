package com.phamkhanhhand.contho.budget_management.controller;

import com.phamkhanhhand.contho.budget_management.common.UserContextUtil;
import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import com.phamkhanhhand.contho.budget_management.security.DataUserContext;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentService;
import com.phamkhanhhand.contho.budget_management.service.BalanceService;
import com.phamkhanhhand.contho.budget_management.service.impl.AdjustmentServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/adjustment")
public class AdjustmentController {

    private final AdjustmentService adjustmentService;
    private final AdjustmentServiceImpl adjustmentServiceImpl;

    /*
    * hold budget from balances
    * phamkhanhhand Oct 04, 2025
     */
    @PostMapping("get-by-id/{id}")
    public boolean getByID(@RequestPart Long id) {
        return adjustmentService.getByID(id);
    }

    /*
     * hold budget from balances
     * phamkhanhhand Oct 04, 2025
     */
    @PostMapping("revert")
    public boolean revert(@RequestBody List<Integer> listBudgetRequestID) {
        return adjustmentService.revert(listBudgetRequestID);
    }

    @GetMapping
    public List<BalanceDTO> getBudgets() {

        DataUserContext ctx = UserContextUtil.getCurrentUserContext();
        if (ctx == null) {
            throw new RuntimeException("User not authenticated");
        }


        var x = adjustmentService.getAll();

        return x;
    }

}
