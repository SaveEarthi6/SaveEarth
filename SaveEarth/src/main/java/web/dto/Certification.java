package web.dto;

import java.util.Date;

public class Certification {
	
	private int partNo;
	private int userNo;
	private int campNo;
	private String partTitle;
	private String partContent;
	private Date partDate;
	
	public Certification() {}

	public Certification(int partNo, int userNo, int campNo, String partTitle, String partContent, Date partDate) {
		super();
		this.partNo = partNo;
		this.userNo = userNo;
		this.campNo = campNo;
		this.partTitle = partTitle;
		this.partContent = partContent;
		this.partDate = partDate;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getPartTitle() {
		return partTitle;
	}

	public void setPartTitle(String partTitle) {
		this.partTitle = partTitle;
	}

	public String getPartContent() {
		return partContent;
	}

	public void setPartContent(String partContent) {
		this.partContent = partContent;
	}

	public Date getPartDate() {
		return partDate;
	}

	public void setPartDate(Date partDate) {
		this.partDate = partDate;
	}

	@Override
	public String toString() {
		return "Certification [partNo=" + partNo + ", userNo=" + userNo + ", campNo=" + campNo + ", partTitle="
				+ partTitle + ", partContent=" + partContent + ", partDate=" + partDate + "]";
	}

}
