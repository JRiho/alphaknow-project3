package com.spring.alphaknow.dto.productDTO;

public class ProductDTO {
    private int product_seq;
    private String product_code;
    private String product_name;
    private double product_price;
    private String product_type;
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_seq=" + product_seq + ", product_code=" + product_code + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_type=" + product_type + "]";
	}

  
    
}
