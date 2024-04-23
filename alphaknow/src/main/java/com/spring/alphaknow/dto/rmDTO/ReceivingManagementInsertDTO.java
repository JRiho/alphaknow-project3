package com.spring.alphaknow.dto.rmDTO;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceivingManagementInsertDTO {
	String trade_code;
	Date request_date;
	String request_person;
	String request_addr;
	int company_and_product_temp_seq;
	int request_amount;
	int product_all_price;
}
