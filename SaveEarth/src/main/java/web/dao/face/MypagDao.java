package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Free;
import web.dto.FreeComment;
import web.dto.Member;
import web.dto.Order;
import web.util.Paging;

public interface MypagDao {

	/**
	 * 댓글삭제
	 * @param cammNo
	 */
	public void deleteComment(FreeComment cammNo);

	/**
	 * 내가 쓴 댓글 조회
	 * @param userNo
	 * @return
	 */
	public List<FreeComment> commentList(int userNo);

	/**
	 * totalCount 가져오기 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * totalCount 가져오기 
	 * @return - 총 게시글 수
	 */
	public int selectCntAllBoard(int userNo);

	/**
	 * 회원정보 조회
	 * @param loginId - 세션 로그인 정보
	 * @return
	 */
	public Member selectById(String loginId);

	/**
	 * 회원정보 삭제
	 * @param loginId - 세션 로그인 정보
	 */
	public void delete(String loginId);
	
	/**
	 * 내가 작성한글 리스트로 불러오기
	 * @param userNo - 사용자
	 * @return
	 */
	public List<Free> mypageList(int userNo);
	
	/**
	 * 내가 작성한 글 리스트로 불러오기
	 * @param paging - 페이징 객체
	 * @param freeHead - 말머리글
	 * @return
	 */
	public List<Map<String, Object>> selectList(Paging paging);
	
	/**
	 * 마이페이지 - 회원정보 변경
	 * @param member
	 */
	public void updateUser(Member member);
	
//	/**
//	 * 마이페이지 - 주문상품 불러오기 
//	 * @param userNo
//	 * @return
//	 */
//	public List<Order> selectOrderList(int userNo);
	
//	/**
//	 * 마이페이지 - 주문상품 불러오기
//	 * @param userNo
//	 * @param paging
//	 * @return
//	 */
	public List<Map<String, Object>> selectOrderList(@Param ("userNo") int userNo, @Param("paging") Paging paging );

	/**
	 * 주문내역 페이징
	 * @return
	 */
	public int selectOrderCntAll();


	
	


}
