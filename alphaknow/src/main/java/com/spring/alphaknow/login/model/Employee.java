package com.spring.alphaknow.login.model;

public class Employee {
    private String department_name;
    private String employee_name;
    private String userId;        // 사용자 ID
    private String password;      // 사용자 비밀번호

    // departmentName의 getter와 setter
    public String getDepartmentName() {
        return department_name;
    }
    public void setDepartmentName(String departmentName) {
        this.department_name = departmentName;
    }

    // employeeName의 getter와 setter
    public String getEmployeeName() {
        return employee_name;
    }
    public void setEmployeeName(String employeeName) {
        this.employee_name = employeeName;
    }

    // userId의 getter와 setter
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }

    // password의 getter와 setter
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
