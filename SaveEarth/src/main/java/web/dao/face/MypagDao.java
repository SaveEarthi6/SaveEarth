package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Free;
import web.dto.FreeComment;
import web.dto.Member;
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
	 * @return
	 */
	public int selectCntAll();

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
	 * 내가 작성한 글 리스트로 불러오기
	 * @param paging - 페이징 객체
	 * @param freeHead - 말머리글
	 * @return
	 */
	public List<Map<String, Object>> selectList(@Param("paging") Paging paging, @Param("freeHead") String freeHead);
	
	/**
	 * 내가 작성한글 리스트로 불러오기
	 * @param userNo - 사용자
	 * @return
	 */
	public List<Free> mypageList(int userNo);


	
	


}
