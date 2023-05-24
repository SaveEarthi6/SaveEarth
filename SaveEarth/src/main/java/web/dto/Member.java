package web.dto;

import java.util.Date;

public class Member {

	public String id;
	public String pw;
	public String name;
	public String nick;
	public String birth;
	public String email;
	public int post;
	public String addr1;
	public String addr2;
	public String phone;
	
	public Member() {}

	public Member(String id, String pw, String name, String nick, String birth, String email, int post, String addr1,
			String addr2, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.email = email;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", birth=" + birth + ", email="
				+ email + ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
