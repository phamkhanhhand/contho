package com.phamkhanhhand.contho.budget_management.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

//@Transactional
public class BaseRepositoryImpl {

    @Autowired
    protected JdbcTemplate jdbcTemplate;

    // ===== QUERY LIST with Class<T> =====
    public <T> List<T> query(String sql, Class<T> clazz, Object... params) {
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(clazz), params);
    }

    // ===== QUERY ONE with Class<T> =====
    public <T> Optional<T> queryOne(String sql, Class<T> clazz, Object... params) {
        List<T> result = query(sql, clazz, params);
        return result.isEmpty() ? Optional.empty() : Optional.of(result.get(0));
    }

    // ===== QUERY PAGE with Class<T> =====
    public <T> Page<T> queryPage(String sql, String countSql, Class<T> clazz, Pageable pageable, Object... params) {
        String pagedSql = sql + " LIMIT ? OFFSET ?";
        Object[] pagedParams = appendParams(params, pageable.getPageSize(), pageable.getOffset());

        List<T> content = query(pagedSql, clazz, pagedParams);
        Long total = jdbcTemplate.queryForObject(countSql, Long.class, params);

        return new PageImpl<>(content, pageable, total);
    }

    // ===== EXECUTE INSERT/UPDATE/DELETE =====
    public int execute(String sql, Object... params) {
        return jdbcTemplate.update(sql, params);
    }

    // ===== BATCH EXECUTE =====
    public int[] batchExecute(String sql, List<Object[]> batchParams) {
        return jdbcTemplate.batchUpdate(sql, batchParams);
    }

    // ===== UTILS =====
    private Object[] appendParams(Object[] original, Object... toAppend) {
        Object[] combined = new Object[original.length + toAppend.length];
        System.arraycopy(original, 0, combined, 0, original.length);
        System.arraycopy(toAppend, 0, combined, original.length, toAppend.length);
        return combined;
    }
}
