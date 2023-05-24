package web.dto;

import java.util.Date;

public class InfoFile {
	
	private int infoFileNo;
	private int infoNo;
	private String infoOriginName;
	private String infoStroedName;
	private Date infoFileDate;
	
	public InfoFile() {
	}

	public InfoFile(int infoFileNo, int infoNo, String infoOriginName, String infoStroedName, Date infoFileDate) {
		super();
		this.infoFileNo = infoFileNo;
		this.infoNo = infoNo;
		this.infoOriginName = infoOriginName;
		this.infoStroedName = infoStroedName;
		this.infoFileDate = infoFileDate;
	}

	@Override
	public String toString() {
		return "InfoFile [infoFileNo=" + infoFileNo + ", infoNo=" + infoNo + ", infoOriginName=" + infoOriginName
				+ ", infoStroedName=" + infoStroedName + ", infoFileDate=" + infoFileDate + "]";
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

	public String getInfoStroedName() {
		return infoStroedName;
	}

	public void setInfoStroedName(String infoStroedName) {
		this.infoStroedName = infoStroedName;
	}

	public Date getInfoFileDate() {
		return infoFileDate;
	}

	public void setInfoFileDate(Date infoFileDate) {
		this.infoFileDate = infoFileDate;
	}
	
	

}
