package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Admin;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.util.Paging;

public interface AdminService {

    public boolean login(Admin adminParam);

	public Paging getPaging(int curPage);

	public List<Map<String, Object>> list(Paging paging);

	public Map<String, Object> getView(Free freeBoard);

	public List<FreeFile> getFreeFile(Free freeBoard);

	public String getNick(String loginId);




	public Paging getPaging2(int curPage);

	public void freeWrite(Free free, List<MultipartFile> files, Member memberInfo);
	
	




}