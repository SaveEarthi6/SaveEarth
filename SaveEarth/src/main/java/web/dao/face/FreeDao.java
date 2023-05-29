package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Free;
import web.dto.FreeFile;
import web.util.Paging;

public interface FreeDao {

	/**
	 * 닉네임을 가져온다
	 * @param loginid
	 * @return
	 */
	public String selectNickById(String loginid);

	/**
	 * 게시글 내용 삽입
	 * @param free - 작성한 게시글 내용
	 */
	public void insertFree(Free free);


	/**
	 * 자유게시판에 첨부한 파일 정보를 삽입한다
	 * @param file - 파일 정보
	 */
	public void insertFreeFile(FreeFile freeFile);

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

	public Free selectFreeBoard(Free freeBoard);

	public void updateHit(Free freeBoard);

	public Free selectAll(int userno);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제
	 * 
	 * @param free - 첨부파일을 삭제할 게시글 번호 객체
	 */
	public void deleteFile(FreeFile freeFile);
	
	/**
	 * 게시글 정보 삭제
	 * 
	 * @param free - 삭제할 게시글의 글 번호
	 */
	public void delete(Free free);

	/**
	 * 파일 정보를 조회한다
	 * @param freeBoard
	 */
	public FreeFile selectFreeFile(Free freeBoard);

	/**
	 * 게시글 내용 수정
	 * @param freeBoard - 수정한 내용
	 */
	public void updateFree(Free freeBoard);

	/**
	 * 마이페이지 - 게시글 수정
	 * @param userno
	 * @param free
	 * @return
	 */
//	public List<Free> mypageGetlist(int userno, Free free);

	/**
	 * 내가 쓴 게시글 불러오기
	 * @param userno
	 * @return
	 */
	public List<Free> mypageList(int userno);

	
	
	
	
	
	
	


	
	
}
