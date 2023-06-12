package web.dto;

public class ProdInqAnswer {
	private int inqAnwserNo;
	private int adminNo;
	private int inqNo;
	private String inqAnswerContent;
	
	public ProdInqAnswer() {}

	public ProdInqAnswer(int inqAnwserNo, int adminNo, int inqNo, String inqAnswerContent) {
		super();
		this.inqAnwserNo = inqAnwserNo;
		this.adminNo = adminNo;
		this.inqNo = inqNo;
		this.inqAnswerContent = inqAnswerContent;
	}

	@Override
	public String toString() {
		return "ProdInqAnswer [inqAnwserNo=" + inqAnwserNo + ", adminNo=" + adminNo + ", inqNo=" + inqNo
				+ ", inqAnswerContent=" + inqAnswerContent + "]";
	}

	public int getInqAnwserNo() {
		return inqAnwserNo;
	}

	public void setInqAnwserNo(int inqAnwserNo) {
		this.inqAnwserNo = inqAnwserNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqAnswerContent() {
		return inqAnswerContent;
	}

	public void setInqAnswerContent(String inqAnswerContent) {
		this.inqAnswerContent = inqAnswerContent;
	}
	
	

}
