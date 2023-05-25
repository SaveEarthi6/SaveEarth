package web.dto;

public class Recommend {
	
	private int recommNo;
	private int freeNo;
	private int userNo;
	
	public Recommend() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Recommend [recommNo=" + recommNo + ", freeNo=" + freeNo + ", userNo=" + userNo + "]";
	}

	public Recommend(int recommNo, int freeNo, int userNo) {
		super();
		this.recommNo = recommNo;
		this.freeNo = freeNo;
		this.userNo = userNo;
	}

	public int getRecommNo() {
		return recommNo;
	}

	public void setRecommNo(int recommNo) {
		this.recommNo = recommNo;
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
	
	

}
