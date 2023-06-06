package web.service.face;

import java.util.List;
import java.util.Map;

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
	 * 전달받은 현재페이지와 말머리를 이용하여 페이징 객체 얻기
	 * 
	 * @param curPage - 전달받은 현재 페이지 값
	 * @param state - 말머리
	 * @return - 계산된 페이징 객체
	 */
	public Paging getPagingByState(int curPage, String state);
	
	/**
	 * 페이징 객체와 말머리를 이용하여 해당 페이지에 로드될 목록 얻어오기
	 * 
	 * @param paging - 페이징 객체
	 * @param state - 말머리
	 * @return 페이지에 로드될  목록
	 */
	public List<Map<String, Object>> getInfoListState(Paging paging, String state);


}
