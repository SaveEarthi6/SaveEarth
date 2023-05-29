package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Campaign;
import web.util.Paging;

public interface AdminService {

 	public boolean login(Admin adminParam);

	public Paging getPaging(int curPage);

	public List<Map<String, Object>> list(Paging paging);

	public Paging getPaging2(int curPage);






}
