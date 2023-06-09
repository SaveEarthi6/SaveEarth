package web.dto;

import java.util.Date;

public class Order {

	private String orderNo;
	private int userNo;
	private String orderRec;
	private String orderAddrPostcode;
	private String orderAddr;
	private String orderAddrDetail;
	private String orderPhone;
	private String orderPrice;
	private Date orderDate;
	
	public Order() {}

	public Order(String orderNo, int userNo, String orderRec, String orderAddrPostcode, String orderAddr,
			String orderAddrDetail, String orderPhone, String orderPrice, Date orderDate) {
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

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", orderRec=" + orderRec + ", orderAddrPostcode="
				+ orderAddrPostcode + ", orderAddr=" + orderAddr + ", orderAddrDetail=" + orderAddrDetail
				+ ", orderPhone=" + orderPhone + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + "]";
	}

}
