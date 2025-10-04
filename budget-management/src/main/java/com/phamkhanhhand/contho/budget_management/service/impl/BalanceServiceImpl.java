package com.phamkhanhhand.contho.budget_management.service.impl;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.dto.mapper.BalanceMapper;
import com.phamkhanhhand.contho.budget_management.repository.BalanceReponsitory;
import com.phamkhanhhand.contho.budget_management.service.BalanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
//@RequiredArgsConstructor
public class BalanceServiceImpl implements BalanceService {
    @Autowired
    private   BalanceMapper balanceMapper;
    @Autowired
    private   BalanceReponsitory balanceReponsitory;

    @Override
    public List<BalanceDTO> getAll() {
        var entities = balanceReponsitory.findAll();
        return entities.stream()
                .map(balanceMapper::toDTO)
                .toList();
    }
}
