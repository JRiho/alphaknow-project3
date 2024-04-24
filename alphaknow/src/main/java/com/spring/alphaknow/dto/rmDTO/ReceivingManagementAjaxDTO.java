package com.spring.alphaknow.dto.rmDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceivingManagementAjaxDTO {
	String product_code;
	String product_name;
	int company_seq;
	String company_name;
	int product_price;
	int product_amount;
}
