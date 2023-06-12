package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.FreeComment;
import web.util.Paging;

public interface MypageService {

	/**
	 * 댓글보기
	 * @param freeComment
	 * @return
	 */
	public List<FreeComment> commitList(FreeComment freeComment);
	
	/**
	 * 댓글 삭제
	 * @param cammNo
	 */
	public void deleteComment(FreeComment cammNo);
	




}
