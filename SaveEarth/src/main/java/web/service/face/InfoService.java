package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Info;
import web.dto.InfoFile;
import web.util.Paging;

public interface InfoService {

	/**
	 * 
	 * @param curPage
	 * @return
	 */
	Paging getPaging(int curPage);

	/**
	 * 정보게시판 게시글 내용 조회(게시글 내용 + 파일 정보)
	 * @param paging - 페이징 객체
	 * @return - 게시글 + 파일 정보
	 */
	public List<Map<String, Object>> getInfoList(Paging paging);
	
   /**
    * 정보게시판 게시글을 작성한다
    * @param adminNo - 관리자 번호
    * @param info - 게시글 내용(제목, 내용)
    * @param files - 파일
    * @param thumb - 썸네일
    */
	public void infoWrite(int adminNo, Info info, List<MultipartFile> files, MultipartFile thumb);
	
	/**
	 * 게시글 번호와 일치하는 게시글 내용 가져오기
	 * @param infoNo - 게시글 번호
	 * @return - 게시글 번호 일치하는 게시글 내용
	 */
	public List<Map<String, Object>> getInfo(int infoNo);

	/**
	 * 검색했을 때 페이징
	 * @param curPage - 현재 페이지
	 * @param keyword - 검색어
	 * @return - 페이징 객체
	 */
	public Paging getPagingByKeyword(int curPage, String keyword);

	/**
	 * 입력한 검색어와 일치하는 게시글을 조회한다
	 * @param paging - 페이징
	 * @param keyword - 검색어
	 * @return - 검색어와 일치하는 게시글
	 */
	public List<Map<String, Object>> search(Paging paging, String keyword);

	/**
	 * 게시글 번호가 일치하는 게시글을 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteInfo(int infoNo);


}
