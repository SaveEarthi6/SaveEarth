package web.service.impl;

import java.util.List;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.AdminController;
import web.dao.face.AdminDao;
import web.dao.face.MypagDao;
import web.dto.FreeComment;
import web.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	

	@Autowired
	MypagDao mypageDao;
	
	@Override
	public List<FreeComment> commitList(FreeComment freeComment) {
		System.out.println("서비스임플 freeCommit :" + freeComment);
		
		return mypageDao.selectComment(freeComment);
	}

	@Override
	public void deleteComment(FreeComment cammNo) {
		mypageDao.deleteComment(cammNo);
		
	}

}
