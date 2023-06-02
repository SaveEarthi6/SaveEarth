package web.dto;

public class Naver {

	private String naverId;
	private String naverName;
	private String naverEmail;
	
	public Naver() {}

	public Naver(String naverId, String naverName, String naverEmail) {
		super();
		this.naverId = naverId;
		this.naverName = naverName;
		this.naverEmail = naverEmail;
	}

	@Override
	public String toString() {
		return "Naver [naverId=" + naverId + ", naverName=" + naverName + ", naverEmail=" + naverEmail + "]";
	}

	public String getNaverId() {
		return naverId;
	}

	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}

	public String getNaverName() {
		return naverName;
	}

	public void setNaverName(String naverName) {
		this.naverName = naverName;
	}

	public String getNaverEmail() {
		return naverEmail;
	}

	public void setNaverEmail(String naverEmail) {
		this.naverEmail = naverEmail;
	}
	
	
}
