package web.dto;

import java.util.Date;

public class Campaign {
	
	private int campNo;
	private int adminNo;
	private String campTitle;
	private Date campEnroll;
	private String campState;
	
	public Campaign() {
		// TODO Auto-generated constructor stub
	}

	public Campaign(int campNo, int adminNo, String campTitle, Date campEnroll, String campState) {
		super();
		this.campNo = campNo;
		this.adminNo = adminNo;
		this.campTitle = campTitle;
		this.campEnroll = campEnroll;
		this.campState = campState;
	}

	@Override
	public String toString() {
		return "Campaign [campNo=" + campNo + ", adminNo=" + adminNo + ", campTitle=" + campTitle + ", campEnroll="
				+ campEnroll + ", campState=" + campState + "]";
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getCampTitle() {
		return campTitle;
	}

	public void setCampTitle(String campTitle) {
		this.campTitle = campTitle;
	}

	public Date getCampEnroll() {
		return campEnroll;
	}

	public void setCampEnroll(Date campEnroll) {
		this.campEnroll = campEnroll;
	}

	public String getCampState() {
		return campState;
	}

	public void setCampState(String campState) {
		this.campState = campState;
	}
	
}
