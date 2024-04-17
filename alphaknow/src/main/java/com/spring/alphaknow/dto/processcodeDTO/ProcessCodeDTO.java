package com.spring.alphaknow.dto.processcodeDTO;

public class ProcessCodeDTO {
    private int sequenceNo;
    private String code;
    private String errorCode;
    private String processAbbreviation;
    private String processAlias;
    private String processType;
    private String standard;
    private double standardWorkingTime;
    private String fakeFaultWarning;
    private String genuineFaultWarning;

	private int repeatable;

    // Getters and Setters
    public int getSequenceNo() {
        return sequenceNo;
    }

    public void setSequenceNo(int sequenceNo) {
        this.sequenceNo = sequenceNo;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getProcessAbbreviation() {
        return processAbbreviation;
    }

    public void setProcessAbbreviation(String processAbbreviation) {
        this.processAbbreviation = processAbbreviation;
    }

    public String getProcessAlias() {
        return processAlias;
    }

    public void setProcessAlias(String processAlias) {
        this.processAlias = processAlias;
    }

    public String getProcessType() {
        return processType;
    }

    public void setProcessType(String processType) {
        this.processType = processType;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public double getStandardWorkingTime() {
        return standardWorkingTime;
    }

    public void setStandardWorkingTime(double standardWorkingTime) {
        this.standardWorkingTime = standardWorkingTime;
    }

    public String getFakeFaultWarning() {
        return fakeFaultWarning;
    }

    public void setFakeFaultWarning(String fakeFaultWarning) {
        this.fakeFaultWarning = fakeFaultWarning;
    }

    public String getGenuineFaultWarning() {
        return genuineFaultWarning;
    }

    public void setGenuineFaultWarning(String genuineFaultWarning) {
        this.genuineFaultWarning = genuineFaultWarning;
    }

    public int getRepeatable() {
        return repeatable;
    }

    public void setRepeatable(int repeatable) {
        this.repeatable = repeatable;
    }
    @Override
    public String toString() {
    	return "ProcessCodeDTO [sequenceNo=" + sequenceNo + ", code=" + code + ", errorCode=" + errorCode
    			+ ", processAbbreviation=" + processAbbreviation + ", processAlias=" + processAlias + ", processType="
    			+ processType + ", standard=" + standard + ", standardWorkingTime=" + standardWorkingTime
    			+ ", fakeFaultWarning=" + fakeFaultWarning + ", genuineFaultWarning=" + genuineFaultWarning
    			+ ", repeatable=" + repeatable + "]";
    }
}
