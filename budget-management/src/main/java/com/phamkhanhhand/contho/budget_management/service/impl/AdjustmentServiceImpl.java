package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.AdjustmentMapper;
import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.impl.AdjustmentRepositoryImpl;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AdjustmentServiceImpl implements AdjustmentService {

    private final AdjustmentMapper adjustmentMapper;

    private final AdjustmentReponsitory adjustmentReponsitory;


    private final AdjustmentRepositoryImpl adjustmentRepositoryImpl;

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
        Adjustment rs = adjustmentReponsitory.findByBudgetAdjustmentID(id);

        return  adjustmentMapper.toDTO(rs);

    }


}
