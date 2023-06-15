package web.dto;

import java.util.Date;

public class Free {
	
	private int freeNo;
	private int userNo;
	private int adminNo;
	private String freeHead;
	private String freeTitle;
	private String freeContent;
	private int freeViews;
	private Date freeCreate;
	private Date freeModify;
	private int recommend;
	private int pin;
	
	public Free() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Free [freeNo=" + freeNo + ", userNo=" + userNo + ", adminNo=" + adminNo + ", freeHead=" + freeHead
				+ ", freeTitle=" + freeTitle + ", freeContent=" + freeContent + ", freeViews=" + freeViews
				+ ", freeCreate=" + freeCreate + ", freeModify=" + freeModify + ", recommend=" + recommend + ", pin="
				+ pin + "]";
	}

	public Free(int freeNo, int userNo, int adminNo, String freeHead, String freeTitle, String freeContent,
			int freeViews, Date freeCreate, Date freeModify, int recommend, int pin) {
		super();
		this.freeNo = freeNo;
		this.userNo = userNo;
		this.adminNo = adminNo;
		this.freeHead = freeHead;
		this.freeTitle = freeTitle;
		this.freeContent = freeContent;
		this.freeViews = freeViews;
		this.freeCreate = freeCreate;
		this.freeModify = freeModify;
		this.recommend = recommend;
		this.pin = pin;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getFreeHead() {
		return freeHead;
	}

	public void setFreeHead(String freeHead) {
		this.freeHead = freeHead;
	}

	public String getFreeTitle() {
		return freeTitle;
	}

	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

	public int getFreeViews() {
		return freeViews;
	}

	public void setFreeViews(int freeViews) {
		this.freeViews = freeViews;
	}

	public Date getFreeCreate() {
		return freeCreate;
	}

	public void setFreeCreate(Date freeCreate) {
		this.freeCreate = freeCreate;
	}

	public Date getFreeModify() {
		return freeModify;
	}

	public void setFreeModify(Date freeModify) {
		this.freeModify = freeModify;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}
	
	
	
	

}
