package com.phamkhanhhand.contho.budget_management.service;

import com.phamkhanhhand.contho.budget_management.dto.BalanceDTO;
import com.phamkhanhhand.contho.budget_management.model.Balance;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BalanceService {

    List<BalanceDTO> getAll();
}
