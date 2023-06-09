package web.dto;

public class OrderDetail {
	
	private int orderDetailNo;
	private String orderNo;
	private String orderAddrPostcode;
	private int prodNo;
	private int cartNo;
	
	public OrderDetail() {}

	public OrderDetail(int orderDetailNo, String orderNo, String orderAddrPostcode, int prodNo, int cartNo) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderNo = orderNo;
		this.orderAddrPostcode = orderAddrPostcode;
		this.prodNo = prodNo;
		this.cartNo = cartNo;
	}

	public int getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderAddrPostcode() {
		return orderAddrPostcode;
	}

	public void setOrderAddrPostcode(String orderAddrPostcode) {
		this.orderAddrPostcode = orderAddrPostcode;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderDetailNo=" + orderDetailNo + ", orderNo=" + orderNo + ", orderAddrPostcode="
				+ orderAddrPostcode + ", prodNo=" + prodNo + ", cartNo=" + cartNo + "]";
	}

}
