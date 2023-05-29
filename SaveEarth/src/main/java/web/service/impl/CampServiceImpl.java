package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CampDao;
import web.dto.Campaign;
import web.service.face.CampService;
import web.util.Paging;

@Service
public class CampServiceImpl implements CampService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CampDao campDao;
	
	@Override
	public Paging getPaging(int curPage) {
		logger.info("getPaging() - curPage : {}", curPage);
		
		//총 게시글 수 조회하기
		int totalCount = campDao.selectCntAll();
		logger.info("totalCount : {}", totalCount);
		
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage, 6);
		
		return paging;
	}
	
	@Override
	public List<Campaign> getList(Paging paging) {

		logger.info("getList() - paging : {}", paging);
		
		return campDao.selectCampList(paging);
	}
	
	@Override
	public Map<String, Object> getCampDetail(int campno) {

		logger.info("getCampDetail() - campno : {}", campno);
		
		return campDao.selectCamp(campno);
	}
	
	@Override
	public Paging getPagingByState(int curPage, String state) {
		logger.info("getPagingByState() - curPage : {}", curPage);
		logger.info("getPagingByState() - state : {}", state);
		
		//총 게시글 수 조회하기
		int totalCount = campDao.selectCntAllByState(state);
		logger.info("totalCount : {}", totalCount);
		
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage, 6);
		
		return paging;
	}
	
	@Override
	public List<Campaign> getListByState(Paging paging, String state) {
		logger.info("getListByState() - state : {}", state);
		
		Map<String, Object> param = new HashMap<>();
		param.put("paging", paging);
		param.put("state", state);
		
//		return campDao.selectCampListByState(param);
		return campDao.selectCampListByState(paging, state);
	}
	
}
