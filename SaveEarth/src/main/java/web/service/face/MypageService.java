package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Free;
import web.dto.FreeComment;
import web.dto.Member;
import web.dto.Order;
import web.util.Paging;

public interface MypageService {

	/**
	 * 댓글 삭제
	 * @param cammNo
	 */
	public void deleteComment(FreeComment cammNo);
	
	/**
	 * 내 댓글 보기 
	 * @param userNo
	 * @return
	 */
	public List<FreeComment> commitList(int userNo);
	
	/**
	 * 마이페이지 - 페이징수행
	 * @param curPage - 페이징객체
	 * @return
	 */
	public Paging getPaging(int curPage);

	/**
	 * 마이페이지 - 회원정보 조회
	 * @param loginId - 세션 로그인 정보
	 * @return
	 */
	public Member info(String loginId);

	/**
	 * 마이페이지 - 회원정보 탈퇴
	 * @param loginId - 세션 로그인정보
	 */
	public void delete(String loginId);
	
	/**
	 * 마이페이지 - 내가 쓴글 확인 리스트
	 * @param paging - 페이징처리
	 * @param freeHead - 말머리글
	 * @return
	 */
	public List<Map<String, Object>> MypageBoardlist(Paging paging);

	/**
	 * 마이페이지 - 작성한글 확인
	 * @param userNo - 유저번호
	 * @return
	 */
	public List<Free> mypageList(int userNo);
	
	/**
	 * 개인정보 수정 
	 * @param member
	 */
	public void update(Member member);
	
	/**
	 * 세션정보와 userNo
	 * @param attribute
	 * @return
	 */
	public List<Map<String, Object>> orderList(int userNo, Paging paging);
	
	/**
	 * 마이페이지 - 주문내역 페이징
	 * @param curPage - 페이징객체
	 * @return
	 */
	public Paging orderPaging(int curPage);







}
