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

import web.dao.face.FreeDao;
import web.dto.Free;
import web.dto.FreeComment;
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
	public String getNick(String loginId) {
		
		return freeDao.selectNickById(loginId);
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
		
		
		free.setUserNo(memberInfo.getUserNo());
		
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
	public void deleteFree(Free free) {
		
		freeDao.delete(free);
		
	}
	
	public void deleteFreeFile(Free free) {
		
		freeDao.deleteFile(free);
	}
	
	@Override
	public List<FreeFile> getFreeFile(Free freeBoard) {
		
		return freeDao.selectFreeFile(freeBoard);
		
	}
	
	@Override
	public void updateFree(Free freeBoard, List<MultipartFile> files, List<FreeFile> freeFile) {
		
		logger.info("updateFree freeBoard {}", freeBoard);
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
		
		for(int i=0 ; i< files.size() ; i++) {
			
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
		
		freeFiles.setFreeNo(freeBoard.getFreeNo());
		freeFiles.setFreeOriginName(files.get(i).getOriginalFilename());
		freeFiles.setFreeStoredName(storedName);
		//여기서 에러
//		freeFiles.setFreeFileNo(freeFile.get(i).getFreeFileNo());
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("keyword", keyword);
		map.put("freeHead", freeHead);
		
		
		return freeDao.selectFreeByKeyword(map);
	}


	@Override
	public List<Free> mypageList(int userno) {
		return freeDao.mypageList(userno);
}
	
	//추천기능
	@Override
	public void checkRecommend(Free free) {
		
		int check = freeDao.cntRecommend(free);
		
		System.out.println(check);
		
		if(check <= 0) {
			
			freeDao.insertRecommend(free);
			freeDao.plusRecommend(free);
			
		} else {
			
			freeDao.deleteRecommend(free);
			freeDao.minusRecommend(free);
		}
		
		

	
	}

	
	//댓글 작성
	@Override
	public int writeComment(String commContent, int freeNo, int userNo) {
		
		logger.info("commContent {}", commContent);
		
		FreeComment freeComment = new FreeComment();
		freeComment.setCommContent(commContent);
		freeComment.setFreeNo(freeNo);
		freeComment.setUserNo(userNo);
		
		logger.info("freeComment {} ", freeComment);
		
		int res = freeDao.insertComment(freeComment);
		
		return res;
		
	}


	//댓글 조회
	@Override
	public List<Map<String, Object>> getComment(Free freeBoard) {
		
		return freeDao.selectComment(freeBoard);
	}
	
	@Override
	public List<Map<String, Object>> getCommentByFreeNo(int freeNo) {
		
		List<Map<String, Object>> commList = freeDao.selectCommentByFreeNo(freeNo);
		
		return commList;
	}
	
	//수정 페이지에서 파일 삭제
	@Override
	public int deleteFile(FreeFile freeFile) {
		
		return freeDao.deleteFileByFreeFileNo(freeFile);
	}
	
	@Override
	public int deleteComm(int commNo) {
		
		int res = freeDao.deleteComm(commNo);
		
		return res;
	}

}