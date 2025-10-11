package com.phamkhanhhand.contho.budget_management.service;

import com.phamkhanhhand.contho.budget_management.dto.*;
import org.apache.coyote.Response;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


public interface AdjustmentService {

    List<AdjustmentDTO> getAll();

    AdjustmentDTO getByID(Long id);


    // <editor-fold desc="RequestForm">

    public CommonApprovalResponseDTO submitRequestForm(CommonRequestDTO requestDTO);

    // </editor-fold>




}
