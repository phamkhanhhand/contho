package com.phamkhanhhand.contho.budget_management.common;

public class Enumeration {


    public class Scopes {

        public static final String ADD = "ADD";
        public static final String EDIT = "EDIT";
        public static final String DELETE = "DELETE";
        public static final String VIEW = "VIEW";
        public static final String IMPORT = "IMPORT";
        public static final String APPROVE = "APPROVE";

        // Private constructor để không bị khởi tạo
        private Scopes() {}
    }

    /**
     * SCOPE api
     */

    public enum Scope1 {

        ADD("ADD"),
        EDIT("EDIT"),
        DELETE("DELETE"),
        VIEW("VIEW"),
        IMPORT("IMPORT"),
        APPROVE("APPROVE");

        private final String value;

        Scope1(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        // Nếu cần lấy enum từ giá trị string
        public static Scope1 fromValue(String value) {
            for (Scope1 scope : Scope1.values()) {
                if (scope.value.equalsIgnoreCase(value)) {
                    return scope;
                }
            }
            throw new IllegalArgumentException("Unknown scope value: " + value);
        }

        @Override
        public String toString() {
            return value;
        }
    }

}
