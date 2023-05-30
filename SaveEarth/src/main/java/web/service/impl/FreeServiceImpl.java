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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.FreeDao;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Member;
import web.service.face.FreeService;
import web.util.Paging;

@Service
public class FreeServiceImpl implements FreeService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	FreeDao freeDao;
	
	@Autowired
	ServletContext context;
	
	@Override
	public String getNick(String loginid) {
		
		return freeDao.selectNickById(loginid);
	}

	@Override
	public List<Map<String, Object>> list(Paging paging, String freeHead) {
		
		return freeDao.selectList(paging, freeHead);
	}

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = freeDao.selectCntAll();
		
		//페이징 객체
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public void freeWrite(Free free, List<MultipartFile> files, Member memberInfo) {
		
//		if(memberInfo.getUserNo() != 0) {
//			free.setUserNo(memberInfo.getUserNo());
//		} else if()
		
		free.setAdminNo(1);
		free.setUserNo(memberInfo.getUserNo());
		
//		free.setUserNo(2);
		logger.info("free {}", free);
		logger.info("files {}", files);
		logger.info("memberInfo {}", memberInfo);
		
		
		freeDao.insertFree(free);
		logger.info("size {}", files.get(0).getSize());
		
		
//		if(files.get(0).getSize() <= 0 ) {
//			logger.info("파일의 크기가 0이다, 처리 중단!");
//				freeWrite() 메소드 중단
//			return;
//		}
		
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
		for(MultipartFile m : files) {
			if(m.getSize() <= 0) {
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}
		
		List<FreeFile> upfiles= new ArrayList<>();
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		for(int i=0 ; i<files.size() ; i++) {
			
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
		FreeFile freeFiles = new FreeFile();
		
		freeFiles.setFreeNo(free.getFreeNo());
		freeFiles.setFreeOriginName(files.get(i).getOriginalFilename());
		freeFiles.setFreeStoredName(storedName);
		logger.info("boardFile : {}", freeFiles );
		
		upfiles.add(freeFiles);
		
		}
		
		for( FreeFile e : upfiles) {
			freeDao.insertFreeFile(e);
		}
	}
	

	@Override
	public Map<String, Object> getView(Free freeBoard) {
		
		freeDao.updateHit(freeBoard);
		
		return freeDao.selectFreeBoard(freeBoard);
		
	}

	@Override
	public void delete(Free free) {
		
		freeDao.deleteFile(free);
		freeDao.delete(free);
		
	}
	
	@Override
	public List<FreeFile> getFreeFile(Free freeBoard) {
		
		return freeDao.selectFreeFile(freeBoard);
		
	}
	
	@Override
	public void updateFree(Free freeBoard, List<MultipartFile> files) {
		
		logger.info("files {}", files);
		
		//수정한 게시글 내용
		freeDao.updateBoard(freeBoard);
		
		
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
		for(MultipartFile m : files) {
			if(m.getSize() <= 0 ) {
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}
		
		List<FreeFile> upfiles= new ArrayList<>();
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		for(int i=0 ; i<files.size() ; i++) {
			
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
		FreeFile freeFiles = new FreeFile();
		
		freeFiles.setFreeNo(freeFiles.getFreeNo());
		freeFiles.setFreeOriginName(files.get(i).getOriginalFilename());
		freeFiles.setFreeStoredName(storedName);
		logger.info("freeFiles : {}", freeFiles );
		
		upfiles.add(freeFiles);
		
		}
		
		//기존에 첨부되어있는 파일을 삭제한다
		freeDao.deleteFile(freeBoard);
		
		//새로 첨부된 파일들을 저장한다
		for( FreeFile e : upfiles) {
			freeDao.insertFreeFile(e);
		}
		
		
	}
	
	@Override
	public List<Map<String, Object>> search(Paging paging, String keyword, String freeHead) {
		
		return freeDao.selectFreeByKeyword(paging, keyword, freeHead);
	}

	@Override
	public List<Free> mypageList(int userno) {
		return freeDao.mypageList(userno);
}

	

}