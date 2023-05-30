package web.dto;


public class Member {
	
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userEmail;
	private String userPostcode;
	private String userAddr;
	private String userDetailaddr;
	private String userPhone;
	
public Member() {}

public Member(int userNo, String userId, String userPw, String userName, String userNick, String userEmail,
		String userPostcode, String userAddr, String userDetailaddr, String userPhone) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userPw = userPw;
	this.userName = userName;
	this.userNick = userNick;
	this.userEmail = userEmail;
	this.userPostcode = userPostcode;
	this.userAddr = userAddr;
	this.userDetailaddr = userDetailaddr;
	this.userPhone = userPhone;
}

@Override
public String toString() {
	return "Member [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
			+ ", userNick=" + userNick + ", userEmail=" + userEmail + ", userPostcode=" + userPostcode + ", userAddr="
			+ userAddr + ", userDetailaddr=" + userDetailaddr + ", userPhone=" + userPhone + "]";
}

public int getUserNo() {
	return userNo;
}

public void setUserNo(int userNo) {
	this.userNo = userNo;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getUserPw() {
	return userPw;
}

public void setUserPw(String userPw) {
	this.userPw = userPw;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getUserNick() {
	return userNick;
}

public void setUserNick(String userNick) {
	this.userNick = userNick;
}

public String getUserEmail() {
	return userEmail;
}

public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}

public String getUserPostcode() {
	return userPostcode;
}

public void setUserPostcode(String userPostcode) {
	this.userPostcode = userPostcode;
}

public String getUserAddr() {
	return userAddr;
}

public void setUserAddr(String userAddr) {
	this.userAddr = userAddr;
}

public String getUserDetailaddr() {
	return userDetailaddr;
}

public void setUserDetailaddr(String userDetailaddr) {
	this.userDetailaddr = userDetailaddr;
}

public String getUserPhone() {
	return userPhone;
}

public void setUserPhone(String userPhone) {
	this.userPhone = userPhone;
}



}
