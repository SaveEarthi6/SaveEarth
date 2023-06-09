package web.dto;

public class Quiz {
	
	private int quizNo;
	private int adminNo;
	private String quizQuestion;
	private String quizOpt1;
	private String quizOpt2;
	private String quizOpt3;
	private String quizOpt4;
	private String quizAnswer;
	
	public Quiz() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Quiz [quizNo=" + quizNo + ", adminNo=" + adminNo + ", quizQuestion=" + quizQuestion + ", quizOpt1="
				+ quizOpt1 + ", quizOpt2=" + quizOpt2 + ", quizOpt3=" + quizOpt3 + ", quizOpt4=" + quizOpt4
				+ ", quizAnswer=" + quizAnswer + "]";
	}

	public Quiz(int quizNo, int adminNo, String quizQuestion, String quizOpt1, String quizOpt2, String quizOpt3,
			String quizOpt4, String quizAnswer) {
		super();
		this.quizNo = quizNo;
		this.adminNo = adminNo;
		this.quizQuestion = quizQuestion;
		this.quizOpt1 = quizOpt1;
		this.quizOpt2 = quizOpt2;
		this.quizOpt3 = quizOpt3;
		this.quizOpt4 = quizOpt4;
		this.quizAnswer = quizAnswer;
	}

	public int getQuizNo() {
		return quizNo;
	}

	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getQuizQuestion() {
		return quizQuestion;
	}

	public void setQuizQuestion(String quizQuestion) {
		this.quizQuestion = quizQuestion;
	}

	public String getQuizOpt1() {
		return quizOpt1;
	}

	public void setQuizOpt1(String quizOpt1) {
		this.quizOpt1 = quizOpt1;
	}

	public String getQuizOpt2() {
		return quizOpt2;
	}

	public void setQuizOpt2(String quizOpt2) {
		this.quizOpt2 = quizOpt2;
	}

	public String getQuizOpt3() {
		return quizOpt3;
	}

	public void setQuizOpt3(String quizOpt3) {
		this.quizOpt3 = quizOpt3;
	}

	public String getQuizOpt4() {
		return quizOpt4;
	}

	public void setQuizOpt4(String quizOpt4) {
		this.quizOpt4 = quizOpt4;
	}

	public String getQuizAnswer() {
		return quizAnswer;
	}

	public void setQuizAnswer(String quizAnswer) {
		this.quizAnswer = quizAnswer;
	}
	
	

}
