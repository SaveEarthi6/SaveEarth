package web.dto;

import java.util.Date;

public class ProductFile {

	private int prodFileNo;
	private int prodNo;
	private String prodOriginName;
	private String prodStroedName;
	private Date prodFileDate;
	
	public ProductFile() {}

	public ProductFile(int prodFileNo, int prodNo, String prodOriginName, String prodStroedName, Date prodFileDate) {
		super();
		this.prodFileNo = prodFileNo;
		this.prodNo = prodNo;
		this.prodOriginName = prodOriginName;
		this.prodStroedName = prodStroedName;
		this.prodFileDate = prodFileDate;
	}

	@Override
	public String toString() {
		return "ProductFile [prodFileNo=" + prodFileNo + ", prodNo=" + prodNo + ", prodOriginName=" + prodOriginName
				+ ", prodStroedName=" + prodStroedName + ", prodFileDate=" + prodFileDate + "]";
	}

	public int getProdFileNo() {
		return prodFileNo;
	}

	public void setProdFileNo(int prodFileNo) {
		this.prodFileNo = prodFileNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdOriginName() {
		return prodOriginName;
	}

	public void setProdOriginName(String prodOriginName) {
		this.prodOriginName = prodOriginName;
	}

	public String getProdStroedName() {
		return prodStroedName;
	}

	public void setProdStroedName(String prodStroedName) {
		this.prodStroedName = prodStroedName;
	}

	public Date getProdFileDate() {
		return prodFileDate;
	}

	public void setProdFileDate(Date prodFileDate) {
		this.prodFileDate = prodFileDate;
	}
	
	
	
	
	
}
