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

	/**
	 * 마이페이지 정보 수정
	 * @param loginid
	 * @return
	 */
	public Member update(String loginid);
	
	/**
	 * 마이페이지 회원정보 탈퇴 
	 * @param loginid
	 * @return
	 */
	public Member delete(String loginid);


	




	


	public Member findid(Member member);

	/**
	 * 아이디확인
	 * @param member
	 * @return
	 */
	public boolean checkid(Member member);

	/**
	 * 중복아이디 체크
	 * @param member
	 * @return
	 */
	
	public int overlappedID(Member member);

	/**
	 * 메일보내기
	 * @param mail
	 */
	public void sendSimpleMessage(Mail mail);


	
	
	
	
	























}
