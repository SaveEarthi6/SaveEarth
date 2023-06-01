package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Admin;
import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.Certification;
import web.dto.Free;
import web.dto.FreeFile;
import web.util.Paging;

public interface AdminDao {

	public int selectCntByIdPw(Admin admin);

	public int selectCntAll();

	public List<Map<String, Object>> selectList(Paging paging);

	public void updateHit(Free freeBoard);

   public Map<String, Object> selectFreeBoard(@Param("freeBoard") Free freeBoard);

	public List<FreeFile> selectFreeFile(Free freeBoard);

	public int selectCntAll2();

	/**
	 * 관리자 페이지 - 글작성
	 * 
	 * @param loginId
	 * @return
	 */
	public Admin selectById(String loginId);
	
	/**
	 * 게시글 내용 삽입
	 * 
	 * @param free - 작성한 게시글 내용
	 */
	public void insertFree(Free free);

	/**
	 * 자유 게시판 첨부파일 삽입
	 * 
	 * @param e
	 */
	public void insertFreeFile(FreeFile freeFile);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제한다
	 * 
	 * @param free - 첨부파일을 삭제할 자유게시판 번호 객체
	 */
	public void deleteFile(Free free);
	
	/**
	 * 게시글 정보 삭제
	 * 
	 * @param free - 삭제할 자유게시글의 글번호
	 */
	public void delete(Free free);
	
	public List<Map<String, Object>> selectCamList(Paging paging);
	
	






}