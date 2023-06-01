package web.service.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface InfoService {

	/**
	 * 정보 게시판 페이징 
	 * @param curPage
	 * @return
	 */
	Paging getPaging(int curPage);

	/**
	 * 정보 게시판 글 리스트로 보여주기
	 * @param paging
	 * @return
	 */
	List<Map<String, Object>> list(Paging paging);

}
