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
		
		Paging paging = new Paging(totalCount, curPage);
		
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
	public List<Map<String, Object>> MypageBoardlist(Paging paging, String freeHead) {
		
		return mypageDao.selectList(paging, freeHead);
	}

	@Override
	public List<Free> mypageList(int userNo) {
		return mypageDao.mypageList(userNo);
	}
	
	
}
