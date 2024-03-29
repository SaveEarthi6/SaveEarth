package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.AdminController;
import web.dao.face.AdminDao;
import web.dao.face.MypagDao;
import web.dto.Free;
import web.dto.FreeComment;
import web.dto.Member;
import web.dto.Order;
import web.service.face.MypageService;
import web.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	MypagDao mypageDao;
	

	@Override
	public void deleteComment(FreeComment cammNo) {
		mypageDao.deleteComment(cammNo);
		
	}
	
	@Override
	public List<FreeComment> commitList(int userNo) {
		return mypageDao.commentList(userNo);
	}

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = mypageDao.selectCntAll();
		
		logger.info("totalCount {}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage);
		
		logger.info("paging {}", paging);
		
		return paging;
	}
	
	@Override
	public Paging getPagingUserNo(int curPage, int userNo) {
		
		int totalCount = mypageDao.selectCntAllBoard(userNo);
		
		logger.info("totalCount {}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage);
		
		logger.info("paging {}", paging);
		
		return paging;
		
	}
	

	@Override
	public Member info(String loginId) {
		
		System.out.println("서비스 임플 info :" + loginId);
		
		return mypageDao.selectById(loginId);
	}

	@Override
	public void delete(String loginId) {
		
		mypageDao.delete(loginId);
		
	}

	@Override
	public List<Map<String, Object>> MypageBoardlist(Paging paging, int userNo) {
		
		return mypageDao.selectList(paging,userNo);
	}

	@Override
	public List<Free> mypageList(int userNo) {
		return mypageDao.mypageList(userNo);
	}

	@Override
	public void update(Member member) {
		mypageDao.updateUser(member);
		
	}

	@Override
	public List<Map<String, Object>> orderList(int userNo, Paging paging) {
		return mypageDao.selectOrderList(userNo, paging);
	}
	
	@Override
	public Paging getPagingOrderList(int curPage, int userNo) {
		
		int totalCount = mypageDao.getPagingOrderList(userNo);
		
		logger.info("totalCount {}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage);
		
		logger.info("paging {}", paging);
		
		return paging;
	}

	

	
	
}
