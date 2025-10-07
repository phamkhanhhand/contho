package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.dto.AdjustmentDTO;
import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.AdjustmentMapper;
import com.phamkhanhhand.contho.budget_management.dto.mapper.BalanceMapper;
import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import com.phamkhanhhand.contho.budget_management.repository.AdjustmentReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.BalanceReponsitory;
import com.phamkhanhhand.contho.budget_management.repository.impl.AdjustmentRepositoryImpl;
import com.phamkhanhhand.contho.budget_management.repository.impl.BalanceRepositoryImpl;
import com.phamkhanhhand.contho.budget_management.service.AdjustmentService;
import com.phamkhanhhand.contho.budget_management.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.QueryTimeoutException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Service
//@RequiredArgsConstructor
public class AdjustmentServiceImpl implements AdjustmentService {
    @Autowired
    private AdjustmentMapper adjustmentMapper;
    @Autowired
    private AdjustmentReponsitory adjustmentReponsitory;

    @Autowired
    private AdjustmentRepositoryImpl adjustmentRepositoryImpl;

    @Override
    public List<AdjustmentDTO> getAll() {
        var entities = adjustmentReponsitory.findAll();
        return entities.stream()
                .map(adjustmentMapper::toDTO)
                .toList();
    }


    @Override
    public AdjustmentDTO getByID(Long id)
    {
        Adjustment rs = adjustmentReponsitory.findByBudgetAdjustmentID(id);

        return  adjustmentMapper.toDTO(rs);

    }


}
