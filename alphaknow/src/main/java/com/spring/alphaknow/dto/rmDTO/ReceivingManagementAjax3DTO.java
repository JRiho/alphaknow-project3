package com.spring.alphaknow.dto.rmDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReceivingManagementAjax3DTO {
    private String tradeCode;
    private int productSeq;
    private String productCode;
    private String productName;
    private String lot;
    private int productAmount;
    private int afterProductAmount;
    private int requestAmount;
    private int productPrice;
    private int productAllPrice;
	
}
