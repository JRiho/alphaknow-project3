package com.spring.alphaknow.dto.inventoryDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryDTO {
	int inventory_seq;
	int product_seq;
	int product_amount;
	String lot;
	String product_type;
	String product_code;
	String product_name;	
}
