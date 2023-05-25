package web.dao.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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

	public List<Free> selectList(Paging paging);

	public Free selectFreeBoard(Free freeBoard);

	public void updateHit(Free freeBoard);

	

	
	
}
