package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.FreeComment;
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
	




}
