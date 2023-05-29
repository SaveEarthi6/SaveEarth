package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.util.Paging;

public interface FreeService {

	/**
	 * 로그인한 닉네임을 가져온다
	 * @param loginid
	 * @return
	 */
	public String getNick(String loginid);

	/**
	 * 게시글 작성
	 * @param free - 작성한 게시글 정보
	 * @param file - 파일 정보
	 * @param memberInfo - 로그인한 회원의 정보
	 */
	public void freeWrite(Free free, MultipartFile file, Member memberInfo);

	/**
	 * 게시글에 페이징을 적용한다
	 * @param curPage - 현재 페이지 번호
	 * @return - 페이징 객체
	 */
	public Paging getPaging(int curPage);

	public List<Map<String, Object>> list(Paging paging, String freeHead);

	public Free getView(Free freeBoard);
	
	/**
	 * 게시글 삭제
	 * @param free
	 * @param freeFile
	 */
	public void delete(Free free, FreeFile freeFile);

	/**
	 * 파일 정보 가져오기
	 * @param freeBoard
	 * @return 
	 */
	public FreeFile getFreeFile(Free freeBoard);

	/**
	 * 게시글 정보 수정하기
	 * @param freeBoard - 입력한 게시글 정보
	 */
	public void update(Free freeBoard);

	/**
	 * 마이페이지 - 내가 쓴 게시글 보기
	 * @param userno
	 * @return
	 */
	public List<Free> getList(int userno);





	


	

}
