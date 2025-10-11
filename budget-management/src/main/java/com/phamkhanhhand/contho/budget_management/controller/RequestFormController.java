package com.phamkhanhhand.contho.budget_management.controller;

import com.phamkhanhhand.contho.budget_management.aspect.CheckPermission;
import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.common.UserContextUtil;
import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonApprovalResponseDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonRequestDTO;
import com.phamkhanhhand.contho.budget_management.security.DataUserContext;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentService;
import com.phamkhanhhand.contho.budget_management.service.impl.AdjustmentServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/request-form")
public class RequestFormController {
    private final String headMapping = "/api/request-form";

    private final AdjustmentService adjustmentService;
    private final AdjustmentServiceImpl adjustmentServiceImpl;


    /*
    * Get by id
    * phamkhanhhand Oct 04, 2025
     */
    @PostMapping("get-by-id/{id}")
    public AdjustmentDTO getByID(@RequestPart Long id) {
        return adjustmentService.getByID(id);
    }



    /*
     * Send to the leader of department
     * phamkhanhhand Oct 11, 2025
     */
    @PostMapping("submit")
    @CheckPermission(uri = headMapping +"/submit", scopes = {Enumeration.Scopes.ADD, Enumeration.Scopes.EDIT})
    public CommonApprovalResponseDTO submit(@RequestBody CommonRequestDTO requestDTO)
    {
        return adjustmentService.submitRequestForm(requestDTO);
    }




}
