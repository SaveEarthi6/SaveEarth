package web.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.AdminController;
import web.dao.face.AdminDao;
import web.dto.Admin;
import web.dto.Free;
import web.dto.FreeFile;
import web.service.face.AdminService;
import web.service.face.MemberService;
import web.util.Paging;

@Service
public class AdminServiceimpl implements AdminService {

	
	
   private final Logger logger = LoggerFactory.getLogger(AdminController.class);

   @Autowired
	AdminDao adminDao;
	@Autowired
	ServletContext context;
	@Autowired
	MemberService memberService;
	
	
	//자유게시판
	@Override
	public Paging getPaging(int curPage) {

		int totalCount = adminDao.selectCntAll();
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage);
	
		
		return paging;
	}
	@Override
	public List<Map<String, Object>> list(Paging paging) {
		
		return adminDao.selectList(paging);
	}
	@Override
	public Map<String, Object> getView(Free freeBoard) {
		
		adminDao.updateHit(freeBoard);
		
		return adminDao.selectFreeBoard(freeBoard);
		
	}
	
	
	
	@Override
	public List<FreeFile> getFreeFile(Free freeBoard) {
		
		return adminDao.selectFreeFile(freeBoard);
		
	}
	
	// 관리자로그인
   @Override
   public boolean login(Admin adminParam) {
logger.info("login() - {}", adminParam);
      
      int result = adminDao.selectCntByIdPw(adminParam);
      logger.info("login() - result : {}", result);
      
      if( result > 0 ) {
         return true; //로그인 인증 성공
      }      
      
      
      
      return false; //로그인 인증 실패
   }
}