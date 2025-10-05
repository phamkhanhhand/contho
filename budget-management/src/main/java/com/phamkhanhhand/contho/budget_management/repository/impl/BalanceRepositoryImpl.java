package com.phamkhanhhand.contho.budget_management.repository.impl;

import com.microsoft.sqlserver.jdbc.SQLServerCallableStatement;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import com.phamkhanhhand.contho.budget_management.dto.*;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import lombok.RequiredArgsConstructor;
import org.hibernate.Internal;
import org.springframework.dao.QueryTimeoutException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.time.Year;
import java.util.List;


import java.sql.CallableStatement;


@RequiredArgsConstructor
@Repository
public class BalanceRepositoryImpl {

    private final JdbcTemplate jdbcTemplate;

    /*
     * hold budget
     * (giữ sotien ngân sách (trừ tiền ngân sách))
     * phamha Oct 05, 2025
     */
    public boolean hold(BudgetRequestDTO budgetRequestDTO)
    {
        boolean hasResults = false;
        var requestDetails = budgetRequestDTO.getDetails();

        jdbcTemplate.execute((Connection con) -> {
            SQLServerConnection sqlCon = con.unwrap(SQLServerConnection.class);

            // Tạo TVP
            SQLServerDataTable tvp = new SQLServerDataTable();


            tvp.addColumnMetadata("source_header_id", Types.BIGINT);
            tvp.addColumnMetadata("source_detail_id", Types.BIGINT);
            tvp.addColumnMetadata("balance_id", Types.BIGINT);
            tvp.addColumnMetadata("amount", java.sql.Types.DECIMAL);

            tvp.addColumnMetadata("segment1", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment2", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment3", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment4", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment5", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment6", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment7", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment8", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment9", java.sql.Types.NVARCHAR);
            tvp.addColumnMetadata("segment10", java.sql.Types.NVARCHAR);

            for (BudgetRequestDetailDTO dto : requestDetails) {
                tvp.addRow(
                        dto.getHeaderID(),
                        dto.getDetailID(),
                        dto.getBalanceID(),
                        dto.getAmount(),

                        dto.getSegment1(),
                        dto.getSegment2(),
                        dto.getSegment3(),
                        dto.getSegment4(),
                        dto.getSegment5(),
                        dto.getSegment6(),
                        dto.getSegment7(),
                        dto.getSegment8(),
                        dto.getSegment9(),
                        dto.getSegment10()
                );
            }

            //todo lock try 3 times after 7 seconds

            try (CallableStatement cs = sqlCon.prepareCall("{call [bud].[proc_hold_balance](?,?,?)}")) {
                cs.setObject(1, "phamha");
                cs.setObject(2, Year.now().getValue());
                ((SQLServerCallableStatement) cs).setStructured(3, "dbo.type_list_bigint", tvp);

                  var re =  cs.execute();

                try (ResultSet rs = cs.getResultSet()) {

//                    while (rs.next()) {
//                        double amount = rs.getDouble("amount");
//                    }
                }

            }
            return hasResults;
        });

        return hasResults;
    }

    /*
     * revert budget
     * (hoàn trả sotien ngân sách (cộng lại tiền ngân sách)). Bước ngược lại của hold
     * phamha Oct 05, 2025
     */
    public boolean revert(List<Integer> listBudgetRequestID) {
        boolean hasResults = false;
        int maxRetries = 3;
        int retryDelayMillis = 3000;

        for (int attempt = 1; attempt <= maxRetries; attempt++) {
            try {

                hasResults = this.CallRevertStoreProcedure(listBudgetRequestID);

            } catch (Exception ex) {
                // Check Is there lock/deadlock, time out
                if ((ex instanceof SQLException && isLockException((SQLException) ex)) || ex instanceof QueryTimeoutException) {
                    if (attempt == maxRetries) throw ex; // Over time retry
                    try {
                        Thread.sleep(retryDelayMillis); // wait 3 seconds
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        throw new RuntimeException("Retry interrupted", ie);
                    }
                } else {
                    throw ex; // not lock
                }
            }

        }

        return hasResults;
    }

    private boolean isLockException(SQLException ex) {
        int errorCode = ex.getErrorCode();

        return errorCode == 1205 ||  // Deadlock
                errorCode == 1222 ||  // Lock timeout
                errorCode == -2;      // JDBC Command timeout
    }

    private boolean CallRevertStoreProcedure(List<Integer> listBudgetRequestID){
        boolean hasResults =false;

        jdbcTemplate.execute((Connection con) -> {
            SQLServerConnection sqlCon = con.unwrap(SQLServerConnection.class);

            // Tạo TVP
            SQLServerDataTable tvp = new SQLServerDataTable();

            tvp.addColumnMetadata("value", Types.BIGINT);

            for (Integer val : listBudgetRequestID) {
                tvp.addRow( val );
            }

            int yearNow = Year.now().getValue();
            sqlCon.setAutoCommit(false);
            try (CallableStatement cs = sqlCon.prepareCall("{call [bud].[proc_revert_balance](?,?,?)}")) {
                cs.setObject(1, "phamha");
                cs.setObject(2, yearNow);
                ((SQLServerCallableStatement) cs).setStructured(3, "dbo.type_list_bigint", tvp);

                cs.setQueryTimeout(5); // 30 seconds

                var re =  cs.execute();

                try (ResultSet rs = cs.getResultSet()) {
//                    while (rs.next()) {
//                        double amount = rs.getDouble("amount");
//                    }
                }

                sqlCon.commit();

            } catch (Exception e) {
                sqlCon.rollback();
                throw e;
            }

            return hasResults;
        });

        return hasResults;
    }


}
