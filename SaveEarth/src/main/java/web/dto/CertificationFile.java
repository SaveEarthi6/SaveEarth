package web.dto;

import java.util.Date;

public class CertificationFile {
	
	private int partFileNo;
	private int partNo;
	private int campNo;
	private String partOriginName;
	private String partStoredName;
	private Date partFileDate;
	
	public CertificationFile() {}

	public CertificationFile(int partFileNo, int partNo, int campNo, String partOriginName, String partStoredName,
			Date partFileDate) {
		super();
		this.partFileNo = partFileNo;
		this.partNo = partNo;
		this.campNo = campNo;
		this.partOriginName = partOriginName;
		this.partStoredName = partStoredName;
		this.partFileDate = partFileDate;
	}

	public int getPartFileNo() {
		return partFileNo;
	}

	public void setPartFileNo(int partFileNo) {
		this.partFileNo = partFileNo;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getPartOriginName() {
		return partOriginName;
	}

	public void setPartOriginName(String partOriginName) {
		this.partOriginName = partOriginName;
	}

	public String getPartStoredName() {
		return partStoredName;
	}

	public void setPartStoredName(String partStoredName) {
		this.partStoredName = partStoredName;
	}

	public Date getPartFileDate() {
		return partFileDate;
	}

	public void setPartFileDate(Date partFileDate) {
		this.partFileDate = partFileDate;
	}

	@Override
	public String toString() {
		return "CertificationFile [partFileNo=" + partFileNo + ", partNo=" + partNo + ", campNo=" + campNo
				+ ", partOriginName=" + partOriginName + ", partStoredName=" + partStoredName + ", partFileDate="
				+ partFileDate + "]";
	}

}
