package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.FreeComment;
import web.dto.FreeFile;
import web.dto.Recommend;
import web.util.Paging;

public interface FreeDao {

	/**
	 * 닉네임을 가져온다
	 * @param loginid
	 * @return
	 */
	public String selectNickById(String loginId);

	/**
	 * 게시글 내용 삽입
	 * @param free - 작성한 게시글 내용
	 */
	public void insertFree(Free free);


	/**
	 * 자유게시판에 첨부한 파일(들)을 삽입한다
	 * @param freeFiles - 첨부파일들
	 */
	public void insertFreeFile(FreeFile freeFiles);

	/**
	 * totalcount가져오기
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 페이징 처리가 들어간 리스트 조회하기
	 * @param paging - 페이징 객체
	 * @param freeHead - 말머리글
	 * @return - 페이징 처리가 된 리스트
	 */
	public List<Map<String, Object>> selectList(@Param("paging") Paging paging, @Param("freeHead") String freeHead);

	/**
	 * 게시글 번호가 일치하는 게시글 정보를 조회한다 
	 * @param freeBoard - 게시글 번호
	 * @return 게시글 번호가 일치하는 게시글 정보
	 */
	public Map<String, Object> selectFreeBoard(@Param("freeBoard") Free freeBoard);

	public void updateHit(Free freeBoard);

	public Free selectAll(int userno);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제
	 * 
	 * @param free - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(Free free);
	
	/**
	 * 게시글 정보 삭제
	 * 
	 * @param free - 삭제할 게시글의 글 번호
	 */
	public void delete(Free free);

	/**
	 * 파일 정보를 조회한다
	 * @param freeBoard - 게시글 번호
	 * @return - 게시글 번호가 일치하는 파일 정보
	 */
	public List<FreeFile> selectFreeFile(Free freeBoard);

	/**
	 * 게시글 정보 수정
	 * @param freeBoard - 수정할 게시글 정보
	 */
	public void updateBoard(Free freeBoard);

	/**
	 * 검색어와 일치하는 게시글을 조회한다
	 * @param paging - 페이징 객체
	 * @param keyword - 입력한 검색어
	 * @param freeHead 
	 * @return - 검색어와 일치하는 게시글
	 */
//	public List<Map<String, Object>> selectFreeByKeyword(@Param("paging") Paging paging, @Param("keyword") String keyword, @Param("freeHead") String freeHead);
	public List<Map<String, Object>> selectFreeByKeyword(Map<String, Object> map);


	/**
	 * 내가 쓴 게시글 불러오기
	 * @param userno
	 * @return
	 */
	public List<Free> mypageList(int userno);

	
	/**
	 * 로그인한 회원이 게시글을 추천 했는지 확인... 
	 * 
	 * @param free
	 * @return
	 */
	public int cntRecommend(Free free);

	

	public void insertRecommend(Free free);

	public void deleteRecommend(Free free);



	/**
	 * 댓글 작성(작성한 댓글을 삽입한다)
	 * @param freeComment - 작성한 댓글 내용(정보)
	 * @return - 삽입 결과 - 성공:1, 실패:0
	 */
	public int insertComment(FreeComment freeComment);

	/**
	 * 댓글 정보를 조회한다
	 * @param freeBoard - 게시글 번호
	 * @return - 게시글 번호와 일치하는 댓글 정보
	 */
	public List<Map<String, Object>> selectComment(Free freeBoard);

	/**
	 * 선택한 파일을 삭제한다
	 * @param freeFile - 파일 번호
	 * @return - 결과 성공:1, 실패:0
	 */
	public int deleteFileByFreeFileNo(FreeFile freeFile);
	
	/**
	 * 추천수 조회
	 * @param recommend
	 * @return
	 */
	public int selectByUserno(Recommend recommend);

	/**
	 * 댓글 삭제
	 * @param commNo - 댓글 번호
	 * @return - 수행 결과 성공:1, 실패:0
	 */
	public int deleteComm(int commNo);

	/**
	 * 댓글 정보를 조회한다
	 * @param freeNo - 게시글 번호
	 * @return - 게시글 번호와 일치하는 댓글 정보
	 */
	public List<Map<String, Object>> selectCommentByFreeNo(int freeNo);

	public void updateRecommend(Free free);
	
	/**
	 * 추천이 1이면 추천을 한 것
	 * 추천이 0이면 추천을 안한 것 
	 *
	 * @param freeBoard
	 * @return
	 */
	public int selectRecommendedByloginId(Free freeBoard);

	/**
	 * userid를 이용하여 userno를 가져오는 메소드
	 * 
	 * @param loginId
	 */
	public int selectUserNoByLoginId(String loginId);
	
	





	
	
	
	
	
	
	


	

	
}
