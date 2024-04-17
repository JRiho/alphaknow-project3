package com.spring.alphaknow.dto.employeeDTO;

import java.sql.Date;

public class EmployeeDTO {
	private int employeeKey;
    private String employeeName;
    private int employeePhone;
    private Date employeeDate;
    private String jobGrade;
    private String employeeId;
    private String employeePw;
    private String employmentStatus;
    private String departmentName;
    
	public int getEmployeeKey() {
		return employeeKey;
	}
	public void setEmployeeKey(int employeeKey) {
		this.employeeKey = employeeKey;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public int getEmployeePhone() {
		return employeePhone;
	}
	public void setEmployeePhone(int employeePhone) {
		this.employeePhone = employeePhone;
	}
	public Date getEmployeeDate() {
		return employeeDate;
	}
	public void setEmployeeDate(Date employeeDate) {
		this.employeeDate = employeeDate;
	}
	public String getJobGrade() {
		return jobGrade;
	}
	public void setJobGrade(String jobGrade) {
		this.jobGrade = jobGrade;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeePw() {
		return employeePw;
	}
	public void setEmployeePw(String employeePw) {
		this.employeePw = employeePw;
	}
	public String getEmploymentStatus() {
		return employmentStatus;
	}
	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	@Override
	public String toString() {
		return "employeeDTO [employeeKey=" + employeeKey + ", employeeName=" + employeeName + ", employeePhone="
				+ employeePhone + ", employeeDate=" + employeeDate + ", jobGrade=" + jobGrade + ", employeeId="
				+ employeeId + ", employeePw=" + employeePw + ", employmentStatus=" + employmentStatus
				+ ", departmentName=" + departmentName + "]";
	}
    
	
}
