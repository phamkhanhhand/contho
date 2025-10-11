package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.common.Enumeration;
import com.phamkhanhhand.contho.budget_management.common.UserContextUtil;
import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonApprovalResponseDTO;
import com.phamkhanhhand.contho.budget_management.dto.CommonRequestDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.AdjustmentMapper;
import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentDetail;
import com.phamkhanhhand.contho.budget_management.model.AdjustmentHistory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentDetailReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentHistoryReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.impl.AdjustmentRepositoryImpl;
import com.phamkhanhhand.contho.budget_management.security.DataUserContext;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AdjustmentServiceImpl implements AdjustmentService {

    private final AdjustmentMapper adjustmentMapper;
    private final AdjustmentReponsitory adjustmentReponsitory;
    private final AdjustmentRepositoryImpl adjustmentRepositoryImpl;
    private final AdjustmentDetailReponsitory adjustmentDetailReponsitory;
    private final AdjustmentHistoryReponsitory adjustmentHistoryReponsitory;



    @Override
    public List<AdjustmentDTO> getAll() {
        var entities = adjustmentRepositoryImpl.findAll();
        return entities.stream()
                .map(adjustmentMapper::toDTO)
                .toList();
    }


    @Override
    public AdjustmentDTO getByID(Long id)
    {
//
        Optional<Adjustment> rs = adjustmentReponsitory.findByBudgetAdjustmentID(id);

        return  adjustmentMapper.toDTO(rs.get());

    }


    // <editor-fold desc="RequestForm">

    private  boolean validateSubmit(Adjustment adjustment, List<AdjustmentDetail> details){
        var rs = false;

        //todo
        rs = true;

        return rs;

    }

    @Transactional
    @Override
    public CommonApprovalResponseDTO submitRequestForm(CommonRequestDTO requestDTO)
    {
        DataUserContext currentUserContext = UserContextUtil.getCurrentUserContext();

        var requestForm = adjustmentReponsitory
                .findByBudgetAdjustmentID(requestDTO.getId())
                .orElseThrow(() -> new RuntimeException ("Không tìm thấy adjustment"));


        var requestFormDetails= adjustmentDetailReponsitory.findByBudgetAdjustmentID(requestDTO.getId());

        var isValid = validateSubmit(requestForm, requestFormDetails);


        if(isValid){
            requestForm.setStatus(Enumeration.RequestFormStatus.SUBMIT);
            for (var item : requestFormDetails) {

                item.setApprovedAmount(item.getAmount());
                if(StringUtils.equalsIgnoreCase(item.getAdjustmentType(), Enumeration.AdjustmentTabType.ADDITION))
                {
                    var changeType = (item.getAmount().compareTo(BigDecimal.ZERO) >=0) ? Enumeration.ChangeType.UP :Enumeration.ChangeType.DOWN;
                    item.setChangeType(changeType);
                }
                if(StringUtils.equalsIgnoreCase(item.getAdjustmentType(), Enumeration.AdjustmentTabType.TRANSFER))
                {
                    var changeType = StringUtils.equalsIgnoreCase(item.getParentFlag(), Enumeration.Flag.Y)? Enumeration.ChangeType.DOWN: Enumeration.ChangeType.UP;
                    item.setChangeType(changeType);
                }
            }

//var now = LocalDateTime.now();
            Date now = new Date(); // Lưu cả giờ phút giây


            //history
            AdjustmentHistory his = AdjustmentHistory.builder()
                    .fromStatus(Enumeration.RequestFormStatus.CREATE)
                    .toStatus(Enumeration.RequestFormStatus.SUBMIT)
                    .comment(requestDTO.getComment())
                    .createdBy(currentUserContext.getUsername())
                    .createdDate(now)
                    .budgetAdjustmentNo(requestForm.getBudgetAdjustmentNo())
                    .budgetAdjustmentID(requestDTO.getId())
                    .build();

            adjustmentHistoryReponsitory.save(his);

        }

        return CommonApprovalResponseDTO.builder()
                .id(requestForm.getBudgetAdjustmentID())
                .status("SUCCESS")
                .build();
    }

    // </editor-fold>

}
