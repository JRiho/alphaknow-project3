package com.spring.alphaknow.dto;

public class BOMItem {
    private String item_id;
    private String bom_id;
    private int product_seq;
    private int quantity;
    private String unit;
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getBom_id() {
		return bom_id;
	}
	public void setBom_id(String bom_id) {
		this.bom_id = bom_id;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	@Override
	public String toString() {
		return "BOMItem [item_id=" + item_id + ", bom_id=" + bom_id + ", product_seq=" + product_seq + ", quantity="
				+ quantity + ", unit=" + unit + "]";
	}
    
    
  
}
