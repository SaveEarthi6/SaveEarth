package web.dto;

import java.util.Date;

public class OrderInfo {
	
	private String orderNo;
	private int userNo;
	private String orderRec;
	private String orderAddrPostcode;
	private String orderAddr;
	private String orderAddrDetail;
	private String orderPhone;
	private String orderPrice;
	private Date orderDate;
	private int prodAmount;
	private String prodName;
	private int prodPrice;
	private String prodColor;
	private String prodSize;
	private String prodOriginName;
	private String prodStoredName;
	
	public OrderInfo() {}

	public OrderInfo(String orderNo, int userNo, String orderRec, String orderAddrPostcode, String orderAddr,
			String orderAddrDetail, String orderPhone, String orderPrice, Date orderDate, int prodAmount,
			String prodName, int prodPrice, String prodColor, String prodSize, String prodOriginName,
			String prodStoredName) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderRec = orderRec;
		this.orderAddrPostcode = orderAddrPostcode;
		this.orderAddr = orderAddr;
		this.orderAddrDetail = orderAddrDetail;
		this.orderPhone = orderPhone;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.prodAmount = prodAmount;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodColor = prodColor;
		this.prodSize = prodSize;
		this.prodOriginName = prodOriginName;
		this.prodStoredName = prodStoredName;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getOrderRec() {
		return orderRec;
	}

	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}

	public String getOrderAddrPostcode() {
		return orderAddrPostcode;
	}

	public void setOrderAddrPostcode(String orderAddrPostcode) {
		this.orderAddrPostcode = orderAddrPostcode;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public String getOrderAddrDetail() {
		return orderAddrDetail;
	}

	public void setOrderAddrDetail(String orderAddrDetail) {
		this.orderAddrDetail = orderAddrDetail;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getProdAmount() {
		return prodAmount;
	}

	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
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

	public String getProdColor() {
		return prodColor;
	}

	public void setProdColor(String prodColor) {
		this.prodColor = prodColor;
	}

	public String getProdSize() {
		return prodSize;
	}

	public void setProdSize(String prodSize) {
		this.prodSize = prodSize;
	}

	public String getProdOriginName() {
		return prodOriginName;
	}

	public void setProdOriginName(String prodOriginName) {
		this.prodOriginName = prodOriginName;
	}

	public String getProdStoredName() {
		return prodStoredName;
	}

	public void setProdStoredName(String prodStoredName) {
		this.prodStoredName = prodStoredName;
	}

	@Override
	public String toString() {
		return "OrderInfo [orderNo=" + orderNo + ", userNo=" + userNo + ", orderRec=" + orderRec
				+ ", orderAddrPostcode=" + orderAddrPostcode + ", orderAddr=" + orderAddr + ", orderAddrDetail="
				+ orderAddrDetail + ", orderPhone=" + orderPhone + ", orderPrice=" + orderPrice + ", orderDate="
				+ orderDate + ", prodAmount=" + prodAmount + ", prodName=" + prodName + ", prodPrice=" + prodPrice
				+ ", prodColor=" + prodColor + ", prodSize=" + prodSize + ", prodOriginName=" + prodOriginName
				+ ", prodStoredName=" + prodStoredName + "]";
	}

}
