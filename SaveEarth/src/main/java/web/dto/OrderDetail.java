package web.dto;

public class OrderDetail {
	
	private int orderDetailNo;
	private String orderNo;
	private int prodNo;
	private int cartNo;
	private int prodOptNo;
	private int prodAmount;
	
	public OrderDetail() {}

	public OrderDetail(int orderDetailNo, String orderNo, int prodNo, int cartNo, int prodOptNo, int prodAmount) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderNo = orderNo;
		this.prodNo = prodNo;
		this.cartNo = cartNo;
		this.prodOptNo = prodOptNo;
		this.prodAmount = prodAmount;
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

	public int getProdOptNo() {
		return prodOptNo;
	}

	public void setProdOptNo(int prodOptNo) {
		this.prodOptNo = prodOptNo;
	}

	public int getProdAmount() {
		return prodAmount;
	}

	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderDetailNo=" + orderDetailNo + ", orderNo=" + orderNo + ", prodNo=" + prodNo
				+ ", cartNo=" + cartNo + ", prodOptNo=" + prodOptNo + ", prodAmount=" + prodAmount + "]";
	}


}
