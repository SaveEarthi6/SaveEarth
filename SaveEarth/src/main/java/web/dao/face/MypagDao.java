package web.dao.face;

import java.util.List;

import web.dto.FreeComment;

public interface MypagDao {

	/**
	 * 댓글조회
	 * @param freeComment
	 * @return
	 */
	List<FreeComment> selectComment(FreeComment freeComment);

	/**
	 * 댓글삭제
	 * @param cammNo
	 */
	public void deleteComment(FreeComment cammNo);

}
