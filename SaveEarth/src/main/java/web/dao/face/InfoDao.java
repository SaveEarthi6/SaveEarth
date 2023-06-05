package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.FreeFile;
import web.dto.Info;
import web.dto.InfoFile;
import web.util.Paging;

public interface InfoDao {

	int selectCntAll();

	List<Info> selectList(Paging paging);

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


	

}
