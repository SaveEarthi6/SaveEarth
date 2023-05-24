package web.service.face;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Free;
import web.dto.Member;

public interface FreeService {

	/**
	 * 로그인한 닉네임을 가져온다
	 * @param loginid
	 * @return
	 */
	public String getNick(String loginid);

	public void freeWrite(Free free, MultipartFile file, Member memberInfo);

	


	

}
