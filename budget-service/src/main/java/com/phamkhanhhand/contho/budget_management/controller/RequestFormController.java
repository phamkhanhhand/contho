package com.phamkhanhhand.contho.budget_management.controller;

import com.phamkhanhhand.contho.budget_management.aspect.CheckPermission;
import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonApprovalResponseDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonRequestDTO;
import com.phamkhanhhand.contho.budget_management.intergration.KafkaProducer;
import com.phamkhanhhand.contho.budget_management.service.RequestFormService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/request-form")
public class RequestFormController {
    private final String headMapping = "/api/request-form";

    private final RequestFormService requestFormService;
    private final KafkaProducer kafkaProducer;


    /*
    * Get by id
    * phamkhanhhand Oct 04, 2025
     */
    @GetMapping("get-by-id/{id}")
    public AdjustmentDTO getByID(@PathVariable Long id) {

        kafkaProducer.sendEntity("my-topic","Helo ae");



        return null;

//        return requestFormService.getByID(id);



    }



    /*
     * Send to the leader of department
     * A01-A02
     * phamkhanhhand Oct 11, 2025
     */
    @PostMapping("submit")
    @CheckPermission(uri = headMapping +"/submit", scopes = {Enumeration.Scopes.ADD, Enumeration.Scopes.EDIT})
    public CommonApprovalResponseDTO submit(@RequestBody CommonRequestDTO requestDTO)
    {
        return requestFormService.submit(requestDTO);
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
        return requestFormService.approve(requestDTO);
    }


    /*
     * complete A04-A06
     * phamkhanhhand Oct 11, 2025
     */
    @PostMapping("complete")
    @CheckPermission(uri = headMapping +"/complete", scopes = {Enumeration.Scopes.COMPLETE})
    public CommonApprovalResponseDTO complete(@RequestBody CommonRequestDTO requestDTO)
    {
        return requestFormService.complete(requestDTO);
    }




}
