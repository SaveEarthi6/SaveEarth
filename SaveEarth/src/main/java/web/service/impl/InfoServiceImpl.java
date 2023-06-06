package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.AdminController;
import web.dao.face.InfoDao;
import web.dto.Info;
import web.service.face.InfoService;
import web.util.Paging;

@Service
public class InfoServiceImpl implements InfoService {
	
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	InfoDao infoDao;

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = infoDao.selectCntAll();
		logger.info("totalCount{}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage, 3);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> getInfoList(Paging paging) {
		
		logger.info("infolist{}", paging);
		
		return infoDao.selectList(paging);
		
		
	}

	@Override
	public Paging getPagingByState(int curPage, String state) {
		
		//총 게시글 수 조회하기
		int totalCount = infoDao.selctCntAllByState(state);
		logger.info("totalCount : {}", totalCount);
		
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage , 3);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> getInfoListState(Paging paging, String state) {
		
		Map <String, Object >param = new HashMap<>();
		param.put("paging", paging);
		param.put("state", state);
		
		return infoDao.selectInfoListByState(paging,state);
	}
	

}
