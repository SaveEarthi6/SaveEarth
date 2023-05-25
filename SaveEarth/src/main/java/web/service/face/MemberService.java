package web.service.face;

import web.dto.Mail;
import web.dto.Member;

public interface MemberService {

	public void join(Member memberParam);

	public boolean login(Member member);
	
	/**
	 * 마이페이지 회원 정보조회
	 * @param loginid
	 * @return
	 */
	public Member info(String loginid);

	public Member findid(Member member);

	/**
	 * 아이디확인
	 * @param member
	 * @return
	 */
	public boolean checkid(Member member);

	/**
	 * 회원정보 삭제
	 * @param loginid
	 */
	public void delete(String loginid);

	/**
	 * 회원정보 수정
	 * @param member
	 */
	public void update(Member member);

	/**
	 * 중복아이디 체크
	 * @param member
	 * @return
	 */
	
	public Member getUserInfo(String loginid);

	
	public int overlappedID(Member member);

	/**
	 * 메일보내기
	 * @param mail
	 */
	public void sendSimpleMessage(Mail mail);


	
	
	
	
	
	
	

}