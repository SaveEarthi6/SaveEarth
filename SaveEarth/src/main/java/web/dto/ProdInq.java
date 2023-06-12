package web.dto;

import java.util.Date;

public class ProdInq {
	private int inqNo;
	private int userNo;
	private int prodNo;
	private String inqTitle;
	private String inqContent;
	private Date inqDate;
	private String inq_proc;
	
	public ProdInq() {}

	public ProdInq(int inqNo, int userNo, int prodNo, String inqTitle, String inqContent, Date inqDate,
			String inq_proc) {
		super();
		this.inqNo = inqNo;
		this.userNo = userNo;
		this.prodNo = prodNo;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqDate = inqDate;
		this.inq_proc = inq_proc;
	}

	@Override
	public String toString() {
		return "ProdInq [inqNo=" + inqNo + ", userNo=" + userNo + ", prodNo=" + prodNo + ", inqTitle=" + inqTitle
				+ ", inqContent=" + inqContent + ", inqDate=" + inqDate + ", inq_proc=" + inq_proc + "]";
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
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

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public Date getInqDate() {
		return inqDate;
	}

	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}

	public String getInq_proc() {
		return inq_proc;
	}

	public void setInq_proc(String inq_proc) {
		this.inq_proc = inq_proc;
	}
	
	
}
