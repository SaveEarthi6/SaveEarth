package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.Member;
import web.util.Paging;

public interface FreeService {

	/**
	 * 로그인한 닉네임을 가져온다
	 * @param loginid
	 * @return
	 */
	public String getNick(String loginid);

	public void freeWrite(Free free, MultipartFile file, Member memberInfo);

	public Paging getPaging(int curPage);

	public List<Free> list(Paging paging);

	public Free getView(Free freeBoard);




	


	

}
