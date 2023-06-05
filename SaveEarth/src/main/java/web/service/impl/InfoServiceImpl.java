package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import web.dto.FreeFile;
import web.dto.Info;
import web.dto.InfoFile;
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
		
		return paging;
	}

	@Override
	public List<Info> getInfoList(Paging paging) {
		
		logger.info("infolist{}", paging);
		
		return infoDao.selectList(paging);
		
		
	}
	
	@Override
	public void infoWrite(int adminNo, Info info, List<MultipartFile> files) {
		
		info.setAdminNo(adminNo);
		
		logger.info("info {}", info);
		logger.info("files {}", files);
		
		
		infoDao.insertInfo(info);
		
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
		for(MultipartFile m : files) {
			if(m.getSize() <= 0) {
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}
		
		List<InfoFile> upfiles= new ArrayList<>();
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		for(int i=0 ; i < files.size() ; i++) {
			
		File dest = null;
		String storedName = null;
		
			//저장할 파일 이름 생성하기
			storedName = files.get(i).getOriginalFilename();//원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; //UUID추가
			logger.info("storedName : {}", storedName);
			
			//실제 저장될 파일 객체
			dest = new File(storedFolder, storedName);
		
		//-> 중복 이름 검증 코드 do while
		//이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기
		
		try {
			
			//업로드된 파일을 upload폴더에 저장하기
			//여기서 저장
			files.get(i).transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------------------
		
		//DB에 기록할 정보 객체
		
		//첨부한 파일 삽입(파일 정보)
		InfoFile infoFiles = new InfoFile();
		
		infoFiles.setInfoNo(info.getInfoNo());
		infoFiles.setInfoOriginName(files.get(i).getOriginalFilename());;
		infoFiles.setInfoStroedName(storedName);
		logger.info("infoFiles : {}", infoFiles );
		
		upfiles.add(infoFiles);
		
		}
		
		for( InfoFile e : upfiles) {
			infoDao.insertInfoFile(e);
		}
		
	}
	
	
}
