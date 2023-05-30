package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.util.Paging;

public interface FreeService {

	/**
	 * 로그인한 닉네임을 가져온다
	 * @param loginid
	 * @return
	 */
	public String getNick(String loginId);

	/**
	 * 게시글 작성
	 * @param free - 작성한 게시글 정보
	 * @param file - 파일 정보(여러 개)
	 * @param memberInfo - 로그인한 회원의 정보
	 */
	public void freeWrite(Free free, List<MultipartFile> files, Member memberInfo);

	/**
	 * 게시글에 페이징을 적용한다
	 * @param curPage - 현재 페이지 번호
	 * @return - 페이징 객체
	 */
	public Paging getPaging(int curPage);

	public List<Map<String, Object>> list(Paging paging, String freeHead);

	public Map<String, Object> getView(Free freeBoard);
	
	/**
	 * 게시글 삭제
	 * @param free
	 */
	public void delete(Free free);

	/**
	 * 파일 정보 가져오기
	 * @param freeBoard - 게시글 번호
	 * @return - 게시글 번호가 일치하는 파일 정보(들)
	 */
	public List<FreeFile> getFreeFile(Free freeBoard);

	/**
	 * 게시글 정보 수정하기
	 * @param freeBoard - 입력한 게시글 정보
	 * @param files - 수정한 파일
	 */
	public void updateFree(Free freeBoard, List<MultipartFile> files);

	/**
	 * 입력한 검색어와 일치하는 게시글을 조회한다
	 * @param paging - 페이징 객체
	 * @param keyword - 입력한 검색어
	 * @param freeHead - 말머리글
	 * @return - 입력한 검색어와 일치하는 게시글
	 */
	public List<Map<String, Object>> search(Paging paging, String keyword, String freeHead);

	
	/**
	 * 마이페이지 - 내가작성한 게시글 보기
	 * @param userno
	 * @return
	 */
	public List<Free> mypageList(int userno);
	
	
	









	


	

}