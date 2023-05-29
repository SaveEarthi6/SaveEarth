package web.service.face;

import java.util.HashMap;

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

	public int overlappedEmail(Member member);


	
	
	/**
	 * id와email값 받아와서 있는지 없는지 체크
	 * @param member
	 * @return 1 있음  0 없음
	 */
	public int checkIdEmail(Member member);

	/**
	 * 임시비밀번호로 패스워드 변경
	 * @param member
	 * @return
	 */
	public void temPw(Member member);

	/**
	 * 메일발송
	 * @param member
	 */
	public void mailSend(Member member);

	
	/**
	 * 카카오 토큰 가져오기
	 * @param code
	 * @return
	 */
	public String getToken(String code);

	public Member getKaKaoinfo(String access_token);



	


	
	
	


	
	
	
	
	
	
	

}