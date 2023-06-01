package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.CampDao;
import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.Certification;
import web.dto.CertificationFile;
import web.service.face.CampService;
import web.util.Paging;

@Service
public class CampServiceImpl implements CampService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CampDao campDao;
	@Autowired ServletContext context;
	
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
	public List<Campaign> getCampList(Paging paging) {

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
	
	@Override
	public void writePart(Certification certification, MultipartFile partFile) {

		//partNo 조회해오기
		int nextVal = campDao.selectPartNo();
		
		logger.info("writePart() - nextVal : {}", nextVal);
		
		certification.setPartNo(nextVal);
		
		//인증 테이블 삽입
		campDao.insertCert(certification);
		
		//파일 테이블 삽입
		if(partFile.getSize() <= 0) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();		
		}
		
		String originName = partFile.getOriginalFilename();
		String storedName = null; 
		
		//실제 저장될 파일 정보 객체
		File dest = null;
		
		do {
			storedName = UUID.randomUUID().toString().split("-")[0];
			dest = new File(storedFolder, storedName);
			
		} while (dest.exists());
		
		try {
			partFile.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		CertificationFile certFile = new CertificationFile();
		
		certFile.setPartNo(nextVal);
		certFile.setCampNo(certification.getCampNo());
		certFile.setPartOriginName(originName);
		certFile.setPartStoredName(storedName);
		
		campDao.insertFile(certFile);
	}
	
	@Override
	public List<Calendar> getCalendar() {

		return campDao.selectCalList();
	}
	
	@Override
	public List<Campaign> getIngList() {

		return campDao.selectIngList();
	}

	@Override
	public List<Certification> getcertList(int userNo) {

		return campDao.selectCertByUserNo(userNo);
	}
	
	@Override
	public List<Map<String, Object>> getcertList(int userNo, String calDate) {

		return campDao.selectCertByDate(userNo, calDate);
	}
	
	@Override
	public void deleteCert(int partNo, int partFileNo) {

		campDao.deleteCert(partNo, partFileNo);
	}
	
	
}
