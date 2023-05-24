package web.dto;

import java.util.Date;

public class CampaignFile {
	
	private int campFileNo;
	private int campNo;
	private String campOriginName;
	private String campStoredName;
	private Date campFileDate;
	
	public CampaignFile() {
		// TODO Auto-generated constructor stub
	}

	public CampaignFile(int campFileNo, int campNo, String campOriginName, String campStoredName, Date campFileDate) {
		super();
		this.campFileNo = campFileNo;
		this.campNo = campNo;
		this.campOriginName = campOriginName;
		this.campStoredName = campStoredName;
		this.campFileDate = campFileDate;
	}

	@Override
	public String toString() {
		return "CampaignFile [campFileNo=" + campFileNo + ", campNo=" + campNo + ", campOriginName=" + campOriginName
				+ ", campStoredName=" + campStoredName + ", campFileDate=" + campFileDate + "]";
	}

	public int getCampFileNo() {
		return campFileNo;
	}

	public void setCampFileNo(int campFileNo) {
		this.campFileNo = campFileNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getCampOriginName() {
		return campOriginName;
	}

	public void setCampOriginName(String campOriginName) {
		this.campOriginName = campOriginName;
	}

	public String getCampStoredName() {
		return campStoredName;
	}

	public void setCampStoredName(String campStoredName) {
		this.campStoredName = campStoredName;
	}

	public Date getCampFileDate() {
		return campFileDate;
	}

	public void setCampFileDate(Date campFileDate) {
		this.campFileDate = campFileDate;
	}
	
}
