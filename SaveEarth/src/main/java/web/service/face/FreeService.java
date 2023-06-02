package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.FreeComment;
import web.dto.FreeFile;
import web.dto.Member;
import web.dto.Recommend;
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
	 * 파일 정보 가져오기
	 * @param freeBoard - 게시글 번호
	 * @return - 게시글 번호가 일치하는 파일 정보(들)
	 */
	public List<FreeFile> getFreeFile(Free freeBoard);

	/**
	 * 게시글 정보 수정하기
	 * @param freeBoard - 입력한 게시글 정보
	 * @param files - 수정한 파일
	 * @param freeFile - 수정할 파일 번호
	 */
	public void updateFree(Free freeBoard, List<MultipartFile> files, List<FreeFile> freeFile);

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


	
	/**
	 * 추천수
	 * 
	 * @param free
	 * @return 
	 */
	public boolean checkRecommend(Free free);

	/**
	 * 자유게시판 게시글 삭제
	 * @param free - 게시글 번호
	 */
	public void deleteFree(Free free);

	/**
	 * 자유게시판 파일 삭제 
	 * @param free - 게시글 번호
	 */
	public void deleteFreeFile(Free free);

	/**
	 * 댓글을 작성한다
	 * @param commContent  - 입력한 댓글 내용
	 * @param userNo - 댓글을 작성한 회원의 회원 번호
	 * @param freeNo - 댓글을 작성한 게시글 번호
	 * @return - 삽입 결과 성공 : 1, 실패 : 0
	 */
	public int writeComment(String commContent, int freeNo, int userNo);

	/**
	 * 게시글번호를 가지고 댓글 정보를 조회한다
	 * @param freeBoard - 작성한 게시글 번호
	 * @return - 조회한 댓글 정보
	 */
	public List<Map<String, Object>> getComment(Free freeBoard);

	/**
	 * 파일 번호가 일치하는 파일을 삭제한다
	 * @param freeFile - 파일 번호
	 * @return - 결과 성공:1, 실패:0
	 */
	public int deleteFile(FreeFile freeFile);

	/**
	 * 댓글 삭제
	 * @param commNo - 댓글 번호
	 * @return - 실행 결과 / 성공:1, 실패:0
	 */
	public int deleteComm(int commNo);

	/**
	 * 게시글번호를 가지고 댓글 정보를 조회한다
	 * @param freeNo - 작성한 게시글 번호
	 * @return - 조회한 댓글 정보
	 */
	public List<Map<String, Object>> getCommentByFreeNo(int freeNo);


	
	/**
	 * 추천수 조회
	 * @param recommend
	 * @return
	 */
	public int selectRecommend(Recommend recommend);
	
	/**
	 * 추천수 업데이트
	 * @param free
	 */
	public void updateRecommend(Free free);


	
	
	









	


	

}