package com.spring.alphaknow.dto.rmDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceivingManagementAjaxDTO {
	int company_seq;
	int product_seq;
	String product_code;
	String product_name;
	String company_name;
	int product_amount;
}
