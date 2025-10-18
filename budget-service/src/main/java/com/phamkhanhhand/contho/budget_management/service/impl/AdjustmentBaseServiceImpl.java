package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.AdjustmentMapper;
import com.phamkhanhhand.contho.budget_management.feign.AdminFeign;
import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentHistory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentDetailReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentHistoryReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.impl.AdjustmentRepositoryImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AdjustmentBaseServiceImpl {

    private final AdjustmentHistoryReponsitory adjustmentHistoryReponsitory;


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
