package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.AdminController;
import web.dao.face.AdminDao;
import web.dto.Admin;
import web.dto.Campaign;
import web.service.face.AdminService;
import web.util.Paging;

@Service
public class AdminServiceimpl implements AdminService {

	private final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminDao adminDao;

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
	public boolean login(Admin adminParam) {
		logger.info("login() - {}", adminParam);

		int result = adminDao.selectCntByIdPw(adminParam);
		logger.info("login() - result : {}", result);

		if (result > 0) {
			return true; // 로그인 인증 성공
		}

		return false; // 로그인 인증 실패
	}
	//켐페인
	@Override
	public Paging getPaging2(int curPage) {
		logger.info("getPaging() - curPage : {}", curPage);
		
		//총 게시글 수 조회하기
		int totalCount = adminDao.selectCntAll2();
		logger.info("totalCount : {}", totalCount);
		
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage, 6);
		
		return paging;
	}
}
