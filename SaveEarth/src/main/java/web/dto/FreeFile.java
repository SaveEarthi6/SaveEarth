package web.dto;

import java.util.Date;

public class FreeFile {
	
	private int freeFileNo;
	private int freeNo;
	private String freeOriginName;
	private String freeStoredName;
	private Date freeFileDate;
	
	public FreeFile() {
	}

	public FreeFile(int freeFileNo, int freeNo, String freeOriginName, String freeStoredName, Date freeFileDate) {
		super();
		this.freeFileNo = freeFileNo;
		this.freeNo = freeNo;
		this.freeOriginName = freeOriginName;
		this.freeStoredName = freeStoredName;
		this.freeFileDate = freeFileDate;
	}

	@Override
	public String toString() {
		return "FreeFile [freeFileNo=" + freeFileNo + ", freeNo=" + freeNo + ", freeOriginName=" + freeOriginName
				+ ", freeStoredName=" + freeStoredName + ", freeFileDate=" + freeFileDate + "]";
	}

	public int getFreeFileNo() {
		return freeFileNo;
	}

	public void setFreeFileNo(int freeFileNo) {
		this.freeFileNo = freeFileNo;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeOriginName() {
		return freeOriginName;
	}

	public void setFreeOriginName(String freeOriginName) {
		this.freeOriginName = freeOriginName;
	}

	public String getFreeStoredName() {
		return freeStoredName;
	}

	public void setFreeStoredName(String freeStoredName) {
		this.freeStoredName = freeStoredName;
	}

	public Date getFreeFileDate() {
		return freeFileDate;
	}

	public void setFreeFileDate(Date freeFileDate) {
		this.freeFileDate = freeFileDate;
	}
	
	

}
