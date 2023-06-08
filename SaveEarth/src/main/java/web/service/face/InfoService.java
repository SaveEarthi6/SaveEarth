package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Free;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Info;
import web.dto.InfoFile;
import web.dto.InfoThumbnail;
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

		/**
		 * 첨부된 썸네일을 삭제한다
		 * @param thumbNo - 썸네일 번호
		 */
		public void deleteThumb(int thumbNo);

		/**
		 * 썸네일을 삭제한 후 조회
		 * @param infoNo - 게시글 번호
		 * @return - 게시글 번호가 지워진 리스트
		 */
		public List<InfoThumbnail> getInfoThumb(int infoNo);

		/**
		 * 파일 번호와 일치하는 파일을 삭제한다
		 * @param infoFileNo - 파일 번호
		 */
		public void deleteFile(int infoFileNo);

		/**
		 * 삭제한 후 파일 정보 조회
		 * @param infoNo - 게시글 번호
		 * @return - 삭제한 후 파일 정보
		 */
		public List<InfoFile> getInfoFile(int infoNo);

		/**
		 * 정보게시판 게시글 수정
		 * @param info - 게시글 내용
		 * @param infoFiles - 첨부파일(들)
		 * @param thumb - 썸네일
		 */
		public void updateInfo(Info info, List<MultipartFile> infoFiles, MultipartFile thumb);


}
