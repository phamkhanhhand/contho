package com.phamkhanhhand.contho.budget_management.controller;

import com.phamkhanhhand.contho.budget_management.aspect.CheckPermission;
import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.common.UserContextUtil;
import com.phamkhanhhand.contho.budget_management.dto.*;
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

    private final String headMapping = "/api/adjustment";
    private final AdjustmentService adjustmentService;



    /*
     * Send to the leader of department
     * A01-A02
     * phamkhanhhand Oct 11, 2025
     */
    @PostMapping("submit")
    @CheckPermission(uri = headMapping +"/submit", scopes = {Enumeration.Scopes.ADD, Enumeration.Scopes.EDIT})
    public CommonApprovalResponseDTO submit(@RequestBody CommonRequestDTO requestDTO)
    {
        return adjustmentService.submit(requestDTO);
    }


    /*
     * Approve A02-> A04
     * Reject A02-> A03
     * phamkhanhhand Oct 11, 2025
     */
    @PostMapping("approve")
    @CheckPermission(uri = headMapping +"/approve", scopes = {Enumeration.Scopes.APPROVE})
    public CommonApprovalResponseDTO approve(@RequestBody CommonRequestDTO requestDTO)
    {
        return adjustmentService.approve(requestDTO);
    }


    /*
     * complete A04-A06
     * phamkhanhhand Oct 11, 2025
     */
    @PostMapping("complete")
    @CheckPermission(uri = headMapping +"/complete", scopes = {Enumeration.Scopes.APPROVE})
    public CommonApprovalResponseDTO complete(@RequestBody CommonRequestDTO requestDTO)
    {
        return adjustmentService.complete(requestDTO);
    }


}
