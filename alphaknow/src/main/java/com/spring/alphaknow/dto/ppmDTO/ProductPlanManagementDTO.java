package ppmDTO;

import java.sql.Date;

public class ProductPlanManagementDTO {
	String ppc;
	int itemCode;
	String itemName;
	String deliveryPlace;
	int deliveryAmount;
	int productionAmount;
	int remainAmount;
	Date startdate;
	Date enddate;

	public String getPpc() {
		return ppc;
	}

	public void setPpc(String ppc) {
		this.ppc = ppc;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDeliveryPlace() {
		return deliveryPlace;
	}

	public void setDeliveryPlace(String deliveryPlace) {
		this.deliveryPlace = deliveryPlace;
	}

	public int getDeliveryAmount() {
		return deliveryAmount;
	}

	public void setDeliveryAmount(int deliveryAmount) {
		this.deliveryAmount = deliveryAmount;
	}

	public int getProductionAmount() {
		return productionAmount;
	}

	public void setProductionAmount(int productionAmount) {
		this.productionAmount = productionAmount;
	}

	public int getRemainAmount() {
		return remainAmount;
	}

	public void setRemainAmount(int remainAmount) {
		this.remainAmount = remainAmount;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	@Override
	public String toString() {
		return "ProductPlanManagementDTO [ppc=" + ppc + ", itemCode=" + itemCode + ", itemName=" + itemName + ", deliveryPlace="
				+ deliveryPlace + ", deliveryAmount=" + deliveryAmount + ", productionAmount=" + productionAmount
				+ ", remainAmount=" + remainAmount + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
}
