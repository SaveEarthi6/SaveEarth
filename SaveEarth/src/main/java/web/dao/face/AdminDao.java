package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Admin;
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

	


}