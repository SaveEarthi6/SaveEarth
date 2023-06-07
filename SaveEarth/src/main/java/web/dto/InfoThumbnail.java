package web.dto;

public class InfoThumbnail {
	
	private int thumbNo;
	private int infoNo;
	private String thumbOriginName;
	private String thumbStoredName;
	
	public InfoThumbnail() {
		// TODO Auto-generated constructor stub
	}

	public InfoThumbnail(int thumbNo, int infoNo, String thumbOriginName, String thumbStoredName) {
		super();
		this.thumbNo = thumbNo;
		this.infoNo = infoNo;
		this.thumbOriginName = thumbOriginName;
		this.thumbStoredName = thumbStoredName;
	}

	@Override
	public String toString() {
		return "InfoThumbnail [thumbNo=" + thumbNo + ", infoNo=" + infoNo + ", thumbOriginName=" + thumbOriginName
				+ ", thumbStoredName=" + thumbStoredName + "]";
	}

	public int getThumbNo() {
		return thumbNo;
	}

	public void setThumbNo(int thumbNo) {
		this.thumbNo = thumbNo;
	}

	public int getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}

	public String getThumbOriginName() {
		return thumbOriginName;
	}

	public void setThumbOriginName(String thumbOriginName) {
		this.thumbOriginName = thumbOriginName;
	}

	public String getThumbStoredName() {
		return thumbStoredName;
	}

	public void setThumbStoredName(String thumbStoredName) {
		this.thumbStoredName = thumbStoredName;
	}
	
	

}
