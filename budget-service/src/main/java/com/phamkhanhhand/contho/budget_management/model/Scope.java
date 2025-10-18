package com.phamkhanhhand.contho.budget_management.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table(name = "bud_balances")
public class Scope {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "scope_id")  // Cột trong DB
    private Long scopeID;

    @Column(name = "scope_code")
    private String scopeCode;

    @Column(name = "scope_name")
    private String scopeName;

    @Column(name = "description")
    private String description;


}
