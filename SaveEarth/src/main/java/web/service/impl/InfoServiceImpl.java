package web.service.impl;

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
	public List<Info> getInfoList(Paging paging) {
		
		logger.info("infolist{}", paging);
		
		return infoDao.selectList(paging);
		
		
	}
	

}
