package com.spring.alphaknow.dto.equipmentDTO;

public class Equipment {
    private int equipmentCode;
    private String equipmentName;
    private String managementNumber;
    private String manufacturer;
    private String purchasingCompanyName;
    private String repairCompanyName;
    private String manager;
    private String location;
    private String usage;
    private String usageStatus;
    private String purchaseDate;
    private String historyRegistrationDate;

    public Equipment() {
    	
    }
    
    public Equipment(int equipmentCode, String equipmentName, String managementNumber, String manufacturer, 
                     String purchasingCompanyName, String repairCompanyName, String manager, String location, 
                     String usage, String usageStatus, String purchaseDate, String historyRegistrationDate) {
        this.equipmentCode = equipmentCode;
        this.equipmentName = equipmentName;
        this.managementNumber = managementNumber;
        this.manufacturer = manufacturer;
        this.purchasingCompanyName = purchasingCompanyName;
        this.repairCompanyName = repairCompanyName;
        this.manager = manager;
        this.location = location;
        this.usage = usage;
        this.usageStatus = usageStatus;
        this.purchaseDate = purchaseDate;
        this.historyRegistrationDate = historyRegistrationDate;
    }

    // Getters and Setters
    public int getEquipmentCode() {
        return equipmentCode;
    }

    public void setEquipmentCode(int equipmentCode) {
        this.equipmentCode = equipmentCode;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getManagementNumber() {
        return managementNumber;
    }

    public void setManagementNumber(String managementNumber) {
        this.managementNumber = managementNumber;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getPurchasingCompanyName() {
        return purchasingCompanyName;
    }

    public void setPurchasingCompanyName(String purchasingCompanyName) {
        this.purchasingCompanyName = purchasingCompanyName;
    }

    public String getRepairCompanyName() {
        return repairCompanyName;
    }

    public void setRepairCompanyName(String repairCompanyName) {
        this.repairCompanyName = repairCompanyName;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUsage() {
        return usage;
    }

    public void setUsage(String usage) {
        this.usage = usage;
    }

    public String getUsageStatus() {
        return usageStatus;
    }

    public void setUsageStatus(String usageStatus) {
        this.usageStatus = usageStatus;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getHistoryRegistrationDate() {
        return historyRegistrationDate;
    }

    public void setHistoryRegistrationDate(String historyRegistrationDate) {
        this.historyRegistrationDate = historyRegistrationDate;
    }
}
