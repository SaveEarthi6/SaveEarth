package web.dto;

import java.util.Date;

public class FreeComment {
	
	private int commNo;
	private int freeNo;
	private int userNo;
	private String commContent;
	private Date commCreate;
	private Date commModify;
	
	public FreeComment() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "FreeComment [commNo=" + commNo + ", freeNo=" + freeNo + ", userNo=" + userNo + ", commContent="
				+ commContent + ", commCreate=" + commCreate + ", commModify=" + commModify + "]";
	}

	public FreeComment(int commNo, int freeNo, int userNo, String commContent, Date commCreate, Date commModify) {
		super();
		this.commNo = commNo;
		this.freeNo = freeNo;
		this.userNo = userNo;
		this.commContent = commContent;
		this.commCreate = commCreate;
		this.commModify = commModify;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
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

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommCreate() {
		return commCreate;
	}

	public void setCommCreate(Date commCreate) {
		this.commCreate = commCreate;
	}

	public Date getCommModify() {
		return commModify;
	}

	public void setCommModify(Date commModify) {
		this.commModify = commModify;
	}
	
	
	
	
	
}
