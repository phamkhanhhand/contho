package com.phamkhanhhand.contho.budget_management.repository.impl;

import com.phamkhanhhand.contho.budget_management.common.Constant;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
//import org.springframework.r2dbc.core.DatabaseClient;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
//import org.springframework.data.r2dbc.core.DatabaseClient;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

//@Transactional
public class BaseRepositoryImpl {

    @Autowired
    protected JdbcTemplate jdbcTemplate;
    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

//
//    @Autowired
//    private DatabaseClient jdbcClient;


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



    public <T> Page<T> queryPage(
            String sql,
            String countSql,
            Class<T> clazz,
            Pageable pageable,
            Map<String, Object> params
    ) {

        StringBuilder orderByClause = new StringBuilder();
        if (pageable.getSort().isSorted()) {
            orderByClause.append(" ORDER BY ");
            List<String> orders = new ArrayList<>();
            for (Sort.Order order : pageable.getSort()) {
                orders.add(order.getProperty() + " " + order.getDirection().name());
            }
            orderByClause.append(String.join(", ", orders));
        } else {
            // Nếu không sort, mặc định ORDER BY id (tránh lỗi OFFSET)
            orderByClause.append(" ORDER BY 1");
        }

        // Thêm OFFSET và FETCH
        sql += orderByClause +" OFFSET :offset ROWS FETCH NEXT :limit ROWS ONLY";
        params.put("offset", pageable.getOffset());
        params.put("limit", pageable.getPageSize());

        // Query nội dung trang
        List<T> content = namedParameterJdbcTemplate.query(
                sql,
                params,
                BeanPropertyRowMapper.newInstance(clazz)
        );

        // Query tổng số bản ghi
        Long total = namedParameterJdbcTemplate.queryForObject(countSql, params, Long.class);

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
