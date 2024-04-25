package com.spring.alphaknow.dto;

public class BOMItem {
    private String itemId;
    private String bomId;
    private int productSeq;
    private int quantity;
    private String unit;
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getBomId() {
		return bomId;
	}
	public void setBomId(String bomId) {
		this.bomId = bomId;
	}
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
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
		return "BOMItem [itemId=" + itemId + ", bomId=" + bomId + ", productSeq=" + productSeq + ", quantity="
				+ quantity + ", unit=" + unit + "]";
	}
    
    
}
