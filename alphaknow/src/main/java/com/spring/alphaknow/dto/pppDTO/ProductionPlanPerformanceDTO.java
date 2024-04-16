package com.spring.alphaknow.dto.pppDTO;

public class ProductionPlanPerformanceDTO {
	private int workYear;
    private int workMonth;
    private int workWeek;
    private int workDay;
    private String itemName;
    private double productionAmount;
    private double makeAmount;
    private double achievementRate;
    private double defectRate;
    
    
	public int getWorkYear() {
		return workYear;
	}
	public void setWorkYear(int workYear) {
		this.workYear = workYear;
	}
	public int getWorkMonth() {
		return workMonth;
	}
	public void setWorkMonth(int workMonth) {
		this.workMonth = workMonth;
	}
	public int getWorkWeek() {
		return workWeek;
	}
	public void setWorkWeek(int workWeek) {
		this.workWeek = workWeek;
	}
	public int getWorkDay() {
		return workDay;
	}
	public void setWorkDay(int workDay) {
		this.workDay = workDay;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public double getProductionAmount() {
		return productionAmount;
	}
	public void setProductionAmount(double productionAmount) {
		this.productionAmount = productionAmount;
	}
	public double getMakeAmount() {
		return makeAmount;
	}
	public void setMakeAmount(double makeAmount) {
		this.makeAmount = makeAmount;
	}
	public double getAchievementRate() {
		return achievementRate;
	}
	public void setAchievementRate(double achievementRate) {
		this.achievementRate = achievementRate;
	}
	public double getDefectRate() {
		return defectRate;
	}
	public void setDefectRate(double defectRate) {
		this.defectRate = defectRate;
	}
	
	@Override
	public String toString() {
		return "ProductionPlanPerformanceDTO [workYear=" + workYear + ", workMonth=" + workMonth + ", workWeek="
				+ workWeek + ", workDay=" + workDay + ", itemName=" + itemName + ", productionAmount="
				+ productionAmount + ", makeAmount=" + makeAmount + ", achievementRate=" + achievementRate
				+ ", defectRate=" + defectRate + "]";
	}
}
