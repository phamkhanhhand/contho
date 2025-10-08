package com.phamkhanhhand.contho.budget_management.repository.impl;

import com.phamkhanhhand.contho.budget_management.model.Adjustment;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@RequiredArgsConstructor
@Repository
public class AdjustmentRepositoryImpl extends BaseRepositoryImpl {

    public List<Adjustment> findAll() {
        String sql = "SELECT * FROM bud_budget_adjustments";
        return query(sql, Adjustment.class);
    }

    public Page<Adjustment> findByNameContaining(String keyword, Pageable pageable) {
        String sql = "SELECT * FROM bud_budget_adjustments WHERE description LIKE :description";
        String countSql = "SELECT COUNT(*) FROM bud_budget_adjustments WHERE description LIKE :description";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("description", "%" + keyword + "%");


        return queryPage(sql, countSql, Adjustment.class, pageable, params);
    }


    public Optional<Adjustment> findById(Long id) {
        String sql = "SELECT * FROM bud_budget_adjustments WHERE budget_adjustment_id = ?";
        return queryOne(sql, Adjustment.class, id);
    }
//
//    public void insert(Adjustment user) {
//        String sql = "INSERT INTO users(name, email) VALUES (?, ?)";
//        execute(sql, user.getName(), user.getEmail());
//    }
//
//    public void update(Adjustment user) {
//        String sql = "UPDATE users SET name = ?, email = ? WHERE id = ?";
//        execute(sql, user.getName(), user.getEmail(), user.getId());
//    }
//
//    public void deleteById(Long id) {
//        String sql = "DELETE FROM users WHERE id = ?";
//        execute(sql, id);
//    }


}
