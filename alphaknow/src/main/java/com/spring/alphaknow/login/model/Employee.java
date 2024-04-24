package com.spring.alphaknow.login.model;

public class Employee {
    private String department_name;
    private String employee_name;
    private String job_grade;
    private String userId;        // 사용자 ID
    private String password;      // 사용자 비밀번호
    private String employee_phone; // 사용자 휴대폰번호
    
    public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getJob_grade() {
		return job_grade;
	}
	public void setJob_grade(String job_grade) {
		this.job_grade = job_grade;
	}

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
    
	public String getEmployee_phone() {
		return employee_phone;
	}
	public void setEmployee_phone(String employee_phone) {
		this.employee_phone = employee_phone;
	}
}
