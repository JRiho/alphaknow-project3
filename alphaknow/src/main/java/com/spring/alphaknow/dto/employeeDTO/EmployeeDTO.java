package com.spring.alphaknow.dto.employeeDTO;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmployeeDTO {
	private int employeeKey;
    private String employeeName;
    private String employeePhone;
    private Date employeeDate;
    private String jobGrade;
    private String employeeId;
    private String employeePw;
    private String employeeStatus;
    private String departmentName;
}
