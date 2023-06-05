package web.dto;

public class Cart {

	private int cartNo;
	private int userNo;
	private int prodNo;
	private int prodCount;
	
	public Cart() {}

	public Cart(int cartNo, int userNo, int prodNo, int prodCount) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.prodNo = prodNo;
		this.prodCount = prodCount;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userNo=" + userNo + ", prodNo=" + prodNo + ", prodCount=" + prodCount
				+ "]";
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getProdCount() {
		return prodCount;
	}

	public void setProdCount(int prodCount) {
		this.prodCount = prodCount;
	}


	
}
