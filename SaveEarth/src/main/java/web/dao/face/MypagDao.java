package web.dao.face;

import java.util.List;

import web.dto.FreeComment;

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

}
