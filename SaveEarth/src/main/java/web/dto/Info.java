package web.dto;

import java.util.Date;

public class Info {
	
	private int infoNo;
	private int adminNo;
	private String infoTitle;
	private String infoContent;
	private Date infoUpload;
	private String infoState;
	
	public Info() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Info [infoNo=" + infoNo + ", adminNo=" + adminNo + ", infoTitle=" + infoTitle + ", infoContent="
				+ infoContent + ", infoUpload=" + infoUpload + ", infoState=" + infoState + "]";
	}

	public Info(int infoNo, int adminNo, String infoTitle, String infoContent, Date infoUpload, String infoState) {
		super();
		this.infoNo = infoNo;
		this.adminNo = adminNo;
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
		this.infoUpload = infoUpload;
		this.infoState = infoState;
	}

	public int getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getInfoTitle() {
		return infoTitle;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getInfoContent() {
		return infoContent;
	}

	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}

	public Date getInfoUpload() {
		return infoUpload;
	}

	public void setInfoUpload(Date infoUpload) {
		this.infoUpload = infoUpload;
	}

	public String getInfoState() {
		return infoState;
	}

	public void setInfoState(String infoState) {
		this.infoState = infoState;
	}
	
}
	
	
	