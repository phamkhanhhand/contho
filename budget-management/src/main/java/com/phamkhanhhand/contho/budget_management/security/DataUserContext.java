package com.phamkhanhhand.contho.budget_management.security;

public class DataUserContext {
    private String username;
    private String fullName;
    private String department;

    public DataUserContext(String username, String fullName, String department) {
        this.username = username;
        this.fullName = fullName;
        this.department = department;
    }

    // getters
    public String getUsername() { return username; }
    public String getFullName() { return fullName; }
    public String getDepartment() { return department; }
}
