package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.common.RequestHeaderUtil;
import com.phamkhanhhand.contho.budget_management.common.UserContextUtil;
import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonApprovalResponseDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonRequestDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.AdjustmentMapper;
import com.phamkhanhhand.contho.budget_management.feign.AdminFeign;
import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentDetail;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentHistory;
import com.phamkhanhhand.contho.budget_management.model.Scope;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentDetailReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentHistoryReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.impl.AdjustmentRepositoryImpl;
import com.phamkhanhhand.contho.budget_management.security.DataUserContext;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentHistoryService;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AdjustmentHistoryServiceImpl implements AdjustmentHistoryService {

    private final AdjustmentHistoryReponsitory adjustmentHistoryReponsitory;
    private final AdminFeign adminFeign;


    // </editor-fold>

    public void makeHistory(Long id, String username, String fromStatus, String toStatus, String comment, String budgetAdjustmentNo){
        Date now = new Date(); // Lưu cả giờ phút giây


        //history
        AdjustmentHistory his = AdjustmentHistory.builder()
                .fromStatus(fromStatus)
                .toStatus(toStatus)
                .comment(comment)
                .createdBy(username)
                .createdDate(now)
                .budgetAdjustmentNo(budgetAdjustmentNo)
                .budgetAdjustmentID(id)
                .build();

        adjustmentHistoryReponsitory.save(his);
    }
}
