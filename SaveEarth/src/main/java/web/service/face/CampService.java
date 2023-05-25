package web.service.face;

import java.util.List;

import web.dto.Campaign;
import web.util.Paging;

public interface CampService {

	/**
	 * 전달받은 현재페이지를 이용하여 페이징 객체 얻기
	 * 
	 * @param curPage - 전달받은 현재페이지값
	 * @return 계산된 페이징객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징 객체를 이용하여 해당 페이지에 로드될 캠페인 목록 얻어오기
	 * 
	 * @param paging - 계산된 페이징 객체
	 * @return 해당 페이지에 로드될 캠페인 목록
	 */
	public List<Campaign> getList(Paging paging);

	/**
	 * 전달파라미터로 전달된 캠페인 번호와 일치하는 캠페인 정보 얻기
	 * 
	 * @param campno - 캠페인 번호
	 * @return 일치하는 캠페인 정보
	 */
	public Campaign getCampDetail(int campno);


}
