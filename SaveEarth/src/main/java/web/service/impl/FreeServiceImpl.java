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
	public void freeWrite(Free free, MultipartFile file, Member memberInfo) {
		
		free.setAdminNo(1);
		free.setUserNo(memberInfo.getUserno());
		System.out.println();
		
//		free.setUserNo(2);
		logger.info("free {}", free);
		logger.info("file {}", file);
		logger.info("memberInfo {}", memberInfo);
		
		freeDao.insertFree(free);
		
		if(file.getSize() <= 0) {
			logger.info("파일의 크기가 0이다, 처리 중단!");
			
			//filesave() 메소드 중단
			return;
		
		}
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		File dest = null;
		String storedName = null;
		do {
		
			//저장할 파일 이름 생성하기
			storedName = file.getOriginalFilename();//원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; //UUID추가
			logger.info("storedName : {}", storedName);
			
			//실제 저장될 파일 객체
			dest = new File(storedFolder, storedName);
		
		} while ( dest.exists() );
		//-> 중복 이름 검증 코드 do while
		//이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기
		
		try {
			
			//업로드된 파일을 upload폴더에 저장하기
			//여기서 저장
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------------------
		
		//DB에 기록할 정보 객체
		
		//게시글 내용 삽입(제목 + 내용)
//		board.setTitle(board.getTitle());
//		board.setContent(board.getContent());
//		boardDao.insertBoard(board);
		
		//첨부한 파일 삽입(파일 정보)
		FreeFile freeFile = new FreeFile();
		
		freeFile.setFreeNo(free.getFreeNo());
		freeFile.setFreeOriginName(file.getOriginalFilename());
		freeFile.setFreeStoredName(storedName);
		logger.info("boardFile : {}", freeFile );
		
		freeDao.insertFreeFile(freeFile);
		
	}
	
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = freeDao.selectCntAll();

		//페이징 객체
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> list(Paging paging, String freeHead) {
		
		return freeDao.selectList(paging, freeHead);
	}

	
	@Override
	public Free getView(Free freeBoard) {
		
		freeDao.updateHit(freeBoard);
		
		return freeDao.selectFreeBoard(freeBoard);
		
	}

	@Override
	public void delete(Free free, FreeFile freeFile) {
		
		freeDao.deleteFile(freeFile);
		freeDao.delete(free);
		
	}
	
	@Override
	public FreeFile getFreeFile(Free freeBoard) {
		
		return freeDao.selectFreeFile(freeBoard);
		
	}
	
	@Override
	public void update(Free freeBoard) {
		
		freeDao.updateFree(freeBoard);
		
		
	}
	

	

}
