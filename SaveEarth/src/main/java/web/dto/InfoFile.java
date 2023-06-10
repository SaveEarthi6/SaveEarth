package web.dto;

import java.util.Date;

public class InfoFile {
	
	private int infoFileNo;
	private int infoNo;
	private String infoOriginName;
	private String infoStoredName;
	private Date infoFileDate;
	
	public InfoFile() {
		// TODO Auto-generated constructor stub
	}

	public InfoFile(int infoFileNo, int infoNo, String infoOriginName, String infoStoredName, Date infoFileDate) {
		super();
		this.infoFileNo = infoFileNo;
		this.infoNo = infoNo;
		this.infoOriginName = infoOriginName;
		this.infoStoredName = infoStoredName;
		this.infoFileDate = infoFileDate;
	}

	@Override
	public String toString() {
		return "InfoFile [infoFileNo=" + infoFileNo + ", infoNo=" + infoNo + ", infoOriginName=" + infoOriginName
				+ ", infoStoredName=" + infoStoredName + ", infoFileDate=" + infoFileDate + "]";
	}

	public int getInfoFileNo() {
		return infoFileNo;
	}

	public void setInfoFileNo(int infoFileNo) {
		this.infoFileNo = infoFileNo;
	}

	public int getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}

	public String getInfoOriginName() {
		return infoOriginName;
	}

	public void setInfoOriginName(String infoOriginName) {
		this.infoOriginName = infoOriginName;
	}

	public String getInfoStoredName() {
		return infoStoredName;
	}

	public void setInfoStoredName(String infoStoredName) {
		this.infoStoredName = infoStoredName;
	}

	public Date getInfoFileDate() {
		return infoFileDate;
	}

	public void setInfoFileDate(Date infoFileDate) {
		this.infoFileDate = infoFileDate;
	}
	
	
	
}