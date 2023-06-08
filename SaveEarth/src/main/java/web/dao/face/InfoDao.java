package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Free;
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

	/**
	 * 검색 했을 때 전체 게시글 수 조회
	 * @param keyword - 검색어
	 * @return - 검색어 일치하는 총 게시글 수
	 */
	public int selectCntAllSearch(String keyword);

	/**
	 * 입력한 검색어와 일치하는 게시글 조회
	 * @param map - 검색어, 페이징
	 * @return - 입력한 검색어와 일치하는 게시글
	 */
	public List<Map<String, Object>> selectInfoByKeyword(Map<String, Object> map);

	/**
	 * 게시글 번호가 일치하는 파일(정보)를 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteInfoFile(int infoNo);

	/**
	 * 게시글 번호가 일치하는 게시글 내용을 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteInfo(int infoNo);

	/**
	 * 게시글 번호가 일치하는 썸네일을 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteThumb(int infoNo);



	public List<Free> getTopFreeRecommend(int count);

	/**
	 * 썸네일 삭제 후 리스트 조회
	 * @param infoNo - 게시글 번호
	 * @return - 썸네일 삭제 후 리스트
	 */
	public List<InfoThumbnail> selectThumbByInfoNo(int infoNo);

	/**
	 * 파일 번호가 일치하는 파일 삭제
	 * @param infoFileNo - 파일 번호
	 */
	public void deleteFile(int infoFileNo);

	/**
	 * 파일 삭제 후 리스트 조회
	 * @param infoNo - 게시글 번호
	 * @return - 파일 삭제 후 리스트
	 */
	public List<InfoFile> selectFileByInfoNo(int infoNo);
	

}
