package com.spring.alphaknow.dto.rmDTO;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceivingManagementDTO {
	int trade_seq;
	String trade_code;
	String company_name;
	String sign_status;
	Date receiving_date;
	int product_all_price;
	Date request_date;
	String request_person;
	String modify_request_person;
	Date modify_request_date;
	String sign_person;
	String product_code;
	String product_name;
	String LOT;
	String product_amount;
	int after_product_amount;
	int request_amount;
	int product_price;
}
