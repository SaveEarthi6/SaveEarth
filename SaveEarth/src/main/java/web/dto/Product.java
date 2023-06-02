package web.dto;

import java.util.Date;

public class Product {

	
	private int prodNo;
	private int adminNo;
	private String prodName;
	private int prodPrice;
	private String prodDetail;
	private int prodAmount;
	private Date prodEnroll;
	private int prodSell;
	
	public Product() {}

	public Product(int prodNo, int adminNo, String prodName, int prodPrice, String prodDetail, int prodAmount,
			Date prodEnroll, int prodSell) {
		super();
		this.prodNo = prodNo;
		this.adminNo = adminNo;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodDetail = prodDetail;
		this.prodAmount = prodAmount;
		this.prodEnroll = prodEnroll;
		this.prodSell = prodSell;
	}

	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", adminNo=" + adminNo + ", prodName=" + prodName + ", prodPrice="
				+ prodPrice + ", prodDetail=" + prodDetail + ", prodAmount=" + prodAmount + ", prodEnroll=" + prodEnroll
				+ ", prodSell=" + prodSell + "]";
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public int getProdAmount() {
		return prodAmount;
	}

	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}

	public Date getProdEnroll() {
		return prodEnroll;
	}

	public void setProdEnroll(Date prodEnroll) {
		this.prodEnroll = prodEnroll;
	}

	public int getProdSell() {
		return prodSell;
	}

	public void setProdSell(int prodSell) {
		this.prodSell = prodSell;
	}
	
	
}
