package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import web.controller.AdminController;
import web.dao.face.InfoDao;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Info;
import web.dto.InfoFile;
import web.dto.InfoThumbnail;
import web.service.face.InfoService;
import web.util.Paging;

@Service
public class InfoServiceImpl implements InfoService {
	
	private final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	InfoDao infoDao;
	
	@Autowired
	ServletContext context;

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = infoDao.selectCntAll();
		logger.info("totalCount{}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage, 3);
		
		logger.info("infoServiceImpl paging{}", paging);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> getInfoList(Paging paging) {
		
		logger.info("infoServiceImpl getInfoList()");
		
		return infoDao.selectList(paging);
		
		
	}

	@Override
	public List<Map<String, Object>> getTopRecommend(int count) {
		return infoDao.getTopFreeRecommend(count);
	}
	
	
	@Override
	public void infoWrite(int adminNo, Info info, List<MultipartFile> files, MultipartFile thumb) {
		
		info.setAdminNo(adminNo);
		
		logger.info("info {}", info);
		logger.info("files {}", files);
		
		
		infoDao.insertInfo(info);
		
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 


		//썸네일
		if(thumb.getSize() <= 0) {
			logger.info("0보다 작음, 처리 중단");
			return;
		}
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		//thumb폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		File dest = null;
		String storedName = null;
		
			//저장할 파일 이름 생성하기
			storedName = thumb.getOriginalFilename();//원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; //UUID추가
			logger.info("storedName : {}", storedName);
			
			//실제 저장될 파일 객체
			dest = new File(storedFolder, storedName);
		
		//-> 중복 이름 검증 코드 do while
		//이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기
		
		try {
			
			//업로드된 파일을 thumb폴더에 저장하기
			//여기서 저장
			thumb.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------------------
		
		//DB에 기록할 정보 객체
		
		//첨부한 파일 삽입(파일 정보)
		InfoThumbnail thumbnail = new InfoThumbnail();
		
		thumbnail.setInfoNo(info.getInfoNo());
		thumbnail.setThumbOriginName(thumb.getOriginalFilename());
		thumbnail.setThumbStoredName(storedName);
		logger.info("thumbnail : {}", thumbnail );
		
		infoDao.insertinfoThumb(thumbnail);
		
		
		//================================================
		
		
		//(첨부파일(들))
		for(MultipartFile m : files) {
			if(m.getSize() <= 0) {
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}
		
		
		List<InfoFile> upfiles= new ArrayList<>();
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath1 = context.getRealPath("upload");
		logger.info("storedPath1 : {}", storedPath1);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder1 = new File(storedPath1);
		storedFolder1.mkdir();
		
		for(int i=0 ; i < files.size() ; i++) {
			
		File dest1 = null;
		String storedName1 = null;
		
			//저장할 파일 이름 생성하기
			storedName1 = files.get(i).getOriginalFilename();//원본 파일명
			storedName1 += UUID.randomUUID().toString().split("-")[0]; //UUID추가
			logger.info("storedName1 : {}", storedName1);
			
			//실제 저장될 파일 객체
			dest1 = new File(storedFolder1, storedName1);
		
		//-> 중복 이름 검증 코드 do while
		//이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기
		
		try {
			
			//업로드된 파일을 upload폴더에 저장하기
			//여기서 저장
			files.get(i).transferTo(dest1);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------------------
		
		//DB에 기록할 정보 객체
		
		//첨부한 파일 삽입(파일 정보)
		InfoFile infoFiles = new InfoFile();
		
		infoFiles.setInfoNo(info.getInfoNo());
		infoFiles.setInfoOriginName(files.get(i).getOriginalFilename());;
		infoFiles.setInfoStroedName(storedName1);
		logger.info("infoFiles : {}", infoFiles );
		
		upfiles.add(infoFiles);
		
		}
		
		for( InfoFile e : upfiles) {
			infoDao.insertInfoFile(e);
		}
		
	}
	
	@Override
	public List<Map<String, Object>> getInfo(int infoNo) {
		
		logger.info("infoServiceImpl getInfo()");
		
		return infoDao.selectInfoByInfoNo(infoNo);
		
	}
	
	
	@Override
	public Paging getPagingByKeyword(int curPage, String keyword) {
		
		int totalCount = infoDao.selectCntAllSearch(keyword);
		
		Paging paging = new Paging(curPage, totalCount);
		
		return paging;
	}
	
	
	@Override
	public List<Map<String, Object>> search(Paging paging, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("keyword", keyword);
		
		return infoDao.selectInfoByKeyword(map);
		
	}
	
	
	@Override
	public void deleteInfo(int infoNo) {
		
		infoDao.deleteThumb(infoNo);
		infoDao.deleteInfoFile(infoNo);
		infoDao.deleteInfo(infoNo);
		
	}
	
	@Override
	public void deleteThumb(int infoNo) {

		infoDao.deleteThumb(infoNo);
		
	}
	
	@Override
	public List<InfoThumbnail> getInfoThumb(int infoNo) {
		
		return infoDao.selectThumbByInfoNo(infoNo);
		
	}
	
	
	@Override
	public void deleteFile(int infoFileNo) {
		
		infoDao.deleteFile(infoFileNo);
		
	}
	
	
	@Override
	public List<InfoFile> getInfoFile(int infoNo) {
		
		return infoDao.selectFileByInfoNo(infoNo);
	}
	
	@Override
	public void updateInfo(Info info, List<MultipartFile> infoFiles, MultipartFile thumb) {

		//게시글 내용 수정
		
		//지금 들어온 파일 있는지 검사하고 삭제 후 새로 넣기
		
		
	}
	
	
	@Override
	public List<Map<String, Object>> getfreeTopDetail(int freeNo) {
		return infoDao.selectInfoByfreeNo(freeNo);
	}
	
	
}
