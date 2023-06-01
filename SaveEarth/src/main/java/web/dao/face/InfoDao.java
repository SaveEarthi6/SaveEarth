package web.dao.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface InfoDao {

	/**
	 * 페이징 객체
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 정보게시판 글을 리스트로 보여줌
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> selectList(Paging paging);

}
