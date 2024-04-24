package com.spring.alphaknow.dto.rmDTO;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceivingManagementUpdateDTO {
	private int product_seq;
	private Date modify_request_date;
    private String modify_request_person;
    private String request_addr;
    private int request_amount;
    private int product_all_price;
}
