package com.spring.alphaknow.dto.productDTO;

public class ProductDTO {
    private int productSeq;
    private String productCode;
    private String productName;
    private double productPrice;
    private String productType;

    // Default constructor
    public ProductDTO() {
    }

    // Parameterized constructor
    public ProductDTO(int productSeq, String productCode, String productName, double productPrice, String productType) {
        this.productSeq = productSeq;
        this.productCode = productCode;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productType = productType;
    }

    // Getters and Setters
    public int getProductSeq() {
        return productSeq;
    }

    public void setProductSeq(int productSeq) {
        this.productSeq = productSeq;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    // toString method for easy printing
    @Override
    public String toString() {
        return "ProductDTO{" +
               "productSeq=" + productSeq +
               ", productCode='" + productCode + '\'' +
               ", productName='" + productName + '\'' +
               ", productPrice=" + productPrice +
               ", productType='" + productType + '\'' +
               '}';
    }
}
