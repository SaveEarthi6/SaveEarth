package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Free;
import web.dto.Info;
import web.util.Paging;

public interface InfoService {

	/**
	 * 
	 * @param curPage
	 * @return
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징 객체를 이용하여 해당 페이지에 로드될 목록 얻어오기
	 * 
	 * @param paging - 계산된 페이징 객체
	 * @return - 해당 페이지에 로드될 캠페인 목록
	 */
	public List<Map<String, Object>> getInfoList(Paging paging);
	
	/**
	 * 자유게시판 추천수 TOP
	 * 
	 * @param count
	 * @return
	 */
	public List<Free> getTopRecommend(int count);
	



}
