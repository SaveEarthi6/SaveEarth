package web.dto;

public class ProdOption {
	
	private int ProdOptNo;
	private int ProdNo;
	private String ProdColor;
	private String ProdSize;
	
	public ProdOption() {}

	public ProdOption(int prodOptNo, int prodNo, String prodColor, String prodSize) {
		super();
		ProdOptNo = prodOptNo;
		ProdNo = prodNo;
		ProdColor = prodColor;
		ProdSize = prodSize;
	}

	@Override
	public String toString() {
		return "CartOption [ProdOptNo=" + ProdOptNo + ", ProdNo=" + ProdNo + ", ProdColor=" + ProdColor + ", ProdSize="
				+ ProdSize + "]";
	}

	public int getProdOptNo() {
		return ProdOptNo;
	}

	public void setProdOptNo(int prodOptNo) {
		ProdOptNo = prodOptNo;
	}

	public int getProdNo() {
		return ProdNo;
	}

	public void setProdNo(int prodNo) {
		ProdNo = prodNo;
	}

	public String getProdColor() {
		return ProdColor;
	}

	public void setProdColor(String prodColor) {
		ProdColor = prodColor;
	}

	public String getProdSize() {
		return ProdSize;
	}

	public void setProdSize(String prodSize) {
		ProdSize = prodSize;
	}
	
	
	
}
