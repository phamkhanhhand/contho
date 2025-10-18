package com.phamkhanhhand.contho.budget_management.service;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonApprovalResponseDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonRequestDTO;

import java.util.List;


public interface RequestFormService {

    List<AdjustmentDTO> getAll();

    AdjustmentDTO getByID(Long id);


    // <editor-fold desc="RequestForm">

    public CommonApprovalResponseDTO submit(CommonRequestDTO requestDTO);

    public CommonApprovalResponseDTO approve(CommonRequestDTO requestDTO);


    public CommonApprovalResponseDTO complete(CommonRequestDTO requestDTO);


    // </editor-fold>




}
