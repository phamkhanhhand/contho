package com.phamkhanhhand.contho.budget_management.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table(name = "bud_budget_adjustment_histories")
public class AdjustmentHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "budget_adjustment_history_id")  // Cột trong DB
    private Long budgetAdjustmentHistoryID;

    @Column(name = "budget_adjustment_id")  // Cột trong DB
    private Long budgetAdjustmentID;

    @Column(name = "status")
    private String status;
 

}
