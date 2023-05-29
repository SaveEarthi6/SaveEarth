package web.dto;

import java.util.Date;

public class Calendar {

	private int calNo;
	private int adminNo;
	private String calName;
	private Date calDate;
	
	public Calendar() {}

	public Calendar(int calNo, int adminNo, String calName, Date calDate) {
		super();
		this.calNo = calNo;
		this.adminNo = adminNo;
		this.calName = calName;
		this.calDate = calDate;
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getCalName() {
		return calName;
	}

	public void setCalName(String calName) {
		this.calName = calName;
	}

	public Date getCalDate() {
		return calDate;
	}

	public void setCalDate(Date calDate) {
		this.calDate = calDate;
	}

	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", adminNo=" + adminNo + ", calName=" + calName + ", calDate=" + calDate
				+ "]";
	}
	
}
