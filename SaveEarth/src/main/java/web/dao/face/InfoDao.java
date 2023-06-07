package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.FreeFile;
import web.dto.Info;
import web.dto.InfoFile;
import web.dto.InfoThumbnail;
import web.util.Paging;

public interface InfoDao {

	/**
	 * 총 게시글 수를 조회한다
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 정보게시판 모든 게시글 정보를 조회한다
	 * @param paging - 페이징 객체
	 * @return - 모든 정보게시판 게시글 정보
	 */
	public List<Map<String, Object>> selectList(Paging paging);

	/**
	 * 정보게시판에 입력한 게시글 정보를 삽입한다
	 * @param info - 게시글 제목, 내용
	 */
	public void insertInfo(Info info);
	
	/**
	 * 정보게시판에 첨부한 파일 정보를 삽입한다
	 * @param infoFiles - 첨부한 파일 정보
	 */
	public void insertInfoFile(InfoFile infoFiles);

	/**
	 * 썸네일 파일 정보를 삽입한다
	 * @param thumbnail - 첨부한 썸네일 정보
	 */
	public void insertinfoThumb(InfoThumbnail thumbnail);

	/**
	 * 게시글 번호와 일치하는 게시글 내용을 조회한다
	 * @param infoNo - 게시글 번호
	 * @return - 게시글 번호가 일치하는 게시글 내용
	 */
	public List<Map<String, Object>> selectInfoByInfoNo(int infoNo);


	

}
