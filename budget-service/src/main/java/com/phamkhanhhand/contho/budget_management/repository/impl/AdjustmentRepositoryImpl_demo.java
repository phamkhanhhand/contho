//package com.phamkhanhhand.contho.budget_management.repository.impl;
//
//import com.phamkhanhhand.contho.budget_management.model.Adjustment;
//import lombok.RequiredArgsConstructor;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//import java.util.Optional;
//
//@RequiredArgsConstructor
//@Repository
//public class AdjustmentRepositoryImpl_demo extends BaseRepositoryImpl {
//
//    public List<Adjustment> findAll() {
//        String sql = "SELECT id, name, email FROM users";
//        return query(sql, Adjustment.class);
//    }
//
//    public Page<Adjustment> findByNameContaining(String keyword, Pageable pageable) {
//        String sql = "SELECT id, name, email FROM users WHERE name LIKE ?";
//        String countSql = "SELECT COUNT(*) FROM users WHERE name LIKE ?";
//
//        MapSqlParameterSource params = new MapSqlParameterSource();
//        params.addValue("name", "%John%");
//
////        String param = "%" + keyword + "%";
//
//        return queryPage(sql, countSql, Adjustment.class, pageable, params);
//    }
//
//
//    public Optional<Adjustment> findById(Long id) {
//        String sql = "SELECT id, name, email FROM users WHERE id = ?";
//        return queryOne(sql, Adjustment.class, id);
//    }
////
////    public void insert(Adjustment user) {
////        String sql = "INSERT INTO users(name, email) VALUES (?, ?)";
////        execute(sql, user.getName(), user.getEmail());
////    }
////
////    public void update(Adjustment user) {
////        String sql = "UPDATE users SET name = ?, email = ? WHERE id = ?";
////        execute(sql, user.getName(), user.getEmail(), user.getId());
////    }
//
//    public void deleteById(Long id) {
//        String sql = "DELETE FROM users WHERE id = ?";
//        execute(sql, id);
//    }
//
//
//}
