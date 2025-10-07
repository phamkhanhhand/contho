package com.phamkhanhhand.contho.budget_management.repository.impl;

import com.microsoft.sqlserver.jdbc.SQLServerCallableStatement;
import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDTO;
import com.phamkhanhhand.contho.budget_management.dto.BudgetRequestDetailDTO;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.time.Year;
import java.util.List;


@RequiredArgsConstructor
@Repository
public class AdjustmentRepositoryImpl {

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
            tvp.addColumnMetadata("amount", Types.DECIMAL);

            tvp.addColumnMetadata("segment1", Types.NVARCHAR);
            tvp.addColumnMetadata("segment2", Types.NVARCHAR);
            tvp.addColumnMetadata("segment3", Types.NVARCHAR);
            tvp.addColumnMetadata("segment4", Types.NVARCHAR);
            tvp.addColumnMetadata("segment5", Types.NVARCHAR);
            tvp.addColumnMetadata("segment6", Types.NVARCHAR);
            tvp.addColumnMetadata("segment7", Types.NVARCHAR);
            tvp.addColumnMetadata("segment8", Types.NVARCHAR);
            tvp.addColumnMetadata("segment9", Types.NVARCHAR);
            tvp.addColumnMetadata("segment10", Types.NVARCHAR);

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

    @Transactional
    public boolean revert(List<Integer> listBudgetRequestID){
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
//            con.setAutoCommit(false);
            try (CallableStatement cs = sqlCon.prepareCall("{call [bud].[proc_revert_balance](?,?,?)}")) {
                cs.setObject(1, "phamha");
                cs.setObject(2, yearNow);
                ((SQLServerCallableStatement) cs).setStructured(3, "dbo.type_list_bigint", tvp);
//
                cs.setQueryTimeout(120); // 30 seconds

                var re =  cs.execute();

                try (ResultSet rs = cs.getResultSet()) {
//                    while (rs.next()) {
//                        double amount = rs.getDouble("amount");
//                    }
                }

//                con.commit();

            } catch (Exception e) {
//                con.rollback();
                throw e;
            }

            return hasResults;
        });

        return hasResults;
    }


}
