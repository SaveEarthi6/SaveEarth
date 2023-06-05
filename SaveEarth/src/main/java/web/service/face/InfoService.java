package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Info;
import web.util.Paging;

public interface InfoService {

	/**
	 * 
	 * @param curPage
	 * @return
	 */
	Paging getPaging(int curPage);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	List<Info> getInfoList(Paging paging);
	
   /**
    * 정보게시판 게시글을 작성한다
    * @param adminNo - 관리자 번호
    * @param info - 게시글 내용(제목, 내용)
    * @param files - 파일
    */
	public void infoWrite(int adminNo, Info info, List<MultipartFile> files);


}
