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

import oracle.net.aso.f;
import web.controller.AdminController;
import web.dao.face.AdminDao;
import web.dao.face.FreeDao;
import web.dto.Admin;
import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.CampaignFile;
import web.dto.Certification;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Info;
import web.dto.InfoFile;
import web.dto.InfoThumbnail;
import web.dto.Member;
import web.dto.ProdInq;
import web.dto.ProdInqAnswer;
import web.dto.ProdOption;
import web.dto.Product;
import web.dto.ProductFile;
import web.service.face.AdminService;
import web.service.face.MemberService;
import web.util.Paging;

@Service
public class AdminServiceimpl implements AdminService {

	private final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminDao adminDao;
	@Autowired
	ServletContext context;
	@Autowired
	MemberService memberService;

	// 자유게시판
	@Override
	public Paging getPaging(int curPage) {

		int totalCount = adminDao.selectCntAll();
		// 페이징 객체
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	@Override
	public List<Map<String, Object>> list(Paging paging) {

		return adminDao.selectList(paging);
	}

	@Override
	public Map<String, Object> getView(Free freeBoard) {

		adminDao.updateHit(freeBoard);

		return adminDao.selectFreeBoard(freeBoard);

	}

	@Override
	public List<FreeFile> getFreeFile(Free freeBoard) {

		return adminDao.selectFreeFile(freeBoard);

	}

	// 관리자로그인
	@Override
	public boolean login(Admin admin) {
		logger.info("login() - {}", admin);

		int result = adminDao.selectCntByIdPw(admin);
		logger.info("login() - result : {}", result);

		if (result > 0) {
			return true; // 로그인 인증 성공
		}

		return false; // 로그인 인증 실패
	}

	// 켐페인
	@Override
	public Paging getPaging2(int curPage) {
		logger.info("getPaging() - curPage : {}", curPage);

		// 총 게시글 수 조회하기
		int totalCount = adminDao.selectCntAll2();
		logger.info("totalCount : {}", totalCount);

		// 페이징 객체
		Paging paging = new Paging(totalCount, curPage, 6);

		return paging;
	}

	@Override
	public void freeWrite(Free free, List<MultipartFile> files, Admin adminInfo, Member member) {

		free.setAdminNo(adminInfo.getAdminNo());
		free.setUserNo(member.getUserNo());

//   free.setUserNo(2);
		logger.info("ServiceImpl free :  {}", free);
		logger.info("ServiceImple files :  {}", files);
		logger.info("ServiceImple adminInfo : {}", adminInfo);
		logger.info("ServiceImple member : {}", member);

		adminDao.insertFree(free);
		logger.info("size {}", files.get(0).getSize());


		// 파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록
		for (MultipartFile m : files) {
			if (m.getSize() <= 0) {
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}

		List<FreeFile> upfiles = new ArrayList<>();

		// 파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);

		// upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();

		for (int i = 0; i < files.size(); i++) {

			File dest = null;
			String storedName = null;

			// 저장할 파일 이름 생성하기
			storedName = files.get(i).getOriginalFilename();// 원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; // UUID추가
			logger.info("storedName : {}", storedName);

			// 실제 저장될 파일 객체
			dest = new File(storedFolder, storedName);

			// -> 중복 이름 검증 코드 do while
			// 이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기

			try {

				// 업로드된 파일을 upload폴더에 저장하기
				// 여기서 저장
				files.get(i).transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			// -------------------------------------------------

			// DB에 기록할 정보 객체

			// 첨부한 파일 삽입(파일 정보)
			FreeFile freeFiles = new FreeFile();

			freeFiles.setFreeNo(free.getFreeNo());
			freeFiles.setFreeOriginName(files.get(i).getOriginalFilename());
			freeFiles.setFreeStoredName(storedName);
			logger.info("boardFile : {}", freeFiles);

			upfiles.add(freeFiles);

		}

		for (FreeFile e : upfiles) {
			adminDao.insertFreeFile(e);
		}

	}

	@Override
	public Admin info(String loginId) {

		return adminDao.selectById(loginId);
	}

	@Override
	public void delete(Free free) {

		adminDao.deleteFile(free);
		adminDao.delete(free);

	}

	@Override
	public List<Campaign> getCampList(Paging paging) {

		logger.info("getList() - paging : {}", paging);

		return adminDao.selectCampList(paging);
	}

	@Override
	public List<Calendar> getCalendar() {

		return adminDao.selectCalList();
	}

	@Override
	public void writePart(Certification certification, MultipartFile partFile) {

		// partNo 조회해오기
		int nextVal = adminDao.selectPartNo();

		logger.info("writePart() - nextVal : {}", nextVal);

		certification.setPartNo(nextVal);

		// 인증 테이블 삽입
		adminDao.insertCert(certification);

		// 파일 테이블 삽입
		if (partFile.getSize() <= 0) {
			return;
		}
	}

	@Override
	public void campaignWrite(Campaign campaign, List<MultipartFile> files, Admin memberInfo) {

		campaign.setAdminNo(memberInfo.getAdminNo());

//      free.setUserNo(2);
		logger.info("ServiceImpl campaign :  {}", campaign);
		logger.info("ServiceImple files :  {}", files);
//      logger.info("ServiceImple adminInfo : {}", adminInfo);

		adminDao.insertCampaign(campaign);
		logger.info("size {}", files.get(0).getSize());


		// 파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록
		for (MultipartFile m : files) {
			if (m.getSize() <= 0) {
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}

		List<CampaignFile> upfiles = new ArrayList<>();

		// 파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);

		// upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();

		for (int i = 0; i < files.size(); i++) {

			File dest = null;
			String storedName = null;

			// 저장할 파일 이름 생성하기
			storedName = files.get(i).getOriginalFilename();// 원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; // UUID추가
			logger.info("storedName : {}", storedName);

			// 실제 저장될 파일 객체
			dest = new File(storedFolder, storedName);

			// -> 중복 이름 검증 코드 do while
			// 이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기

			try {

				// 업로드된 파일을 upload폴더에 저장하기
				// 여기서 저장
				files.get(i).transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			// -------------------------------------------------

			// DB에 기록할 정보 객체

			// 첨부한 파일 삽입(파일 정보)
			CampaignFile campaignFiles = new CampaignFile();

			campaignFiles.setCampNo(campaign.getCampNo());
			campaignFiles.setCampOriginName(files.get(i).getOriginalFilename());
			campaignFiles.setCampStoredName(storedName);
			logger.info("boardFile : {}", campaignFiles);

			upfiles.add(campaignFiles);

		}

		for (CampaignFile e : upfiles) {
			adminDao.insertCampaignFile(e);
		}

	}
	
	//캠페인 수정
	@Override
	public List<Map<String, Object>> Camlist(Paging paging) {

		return adminDao.selectCamList(paging);
	}
	//캠페인 수정
	@Override
	public Admin getAdmin(String loginId) {
		return adminDao.selectAdmin(loginId);
	}
	
	//캠페인 삭제
	@Override
	public void deleteCam(Campaign campNo) {
		adminDao.deleteCam(campNo);

	}
	//캠페인 삭제
	@Override
	public void campDelete(Campaign campaign) {
		// TODO Auto-generated method stub

	}
	//캠페인 수정
	@Override
	public Map<String, Object> getView(Campaign campaign) {
		
		
		return adminDao.selectCampBoard(campaign);
	}
	//캠페인 수정
	@Override
	public List<CampaignFile> getCampFile(Campaign campaign) {
		return adminDao.selectCampFile(campaign);
		
	}
	//캠페인 수정
	@Override
	public void updateCamp(Campaign campaign, List<MultipartFile> files, List<CampaignFile> campFile) {
		
		logger.info("updateCamp campaign {}", campaign);
		logger.info("files {}", files);
		
		//수정한 게시글 내용
		adminDao.updateCamp(campaign);
		
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 설정
		for(MultipartFile m : files) {
			if(m.getSize() <= 0 ) {
				logger.info("0보다 작음, 처리 중단");
				return;
		}
	}
		
		List<CampaignFile> upfiles= new ArrayList<>();
		
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
		CampaignFile campFiles = new CampaignFile();
		
		campFiles.setCampNo(campaign.getCampNo());
		campFiles.setCampOriginName(files.get(i).getOriginalFilename());
		campFiles.setCampStoredName(storedName);
		logger.info("campFiles : {}", campFiles );
		
		upfiles.add(campFiles);
		
		}
		
		//기존에 첨부되어있는 파일을 삭제한다
		adminDao.deleteCampFile(campaign);
		
		//새로 첨부된 파일들을 저장한다
		for( CampaignFile e : upfiles) {
			adminDao.insertCampFile(e);
		}		
		
	}
	

	@Override
	public void productnWrite(Product product, List<MultipartFile> files, Admin memberInfo, ProdOption prodOption) {

	     product.setAdminNo(memberInfo.getAdminNo());
//	     product.setProdNo(1);

	     
	     System.out.println("서비스임플 product :" + product);
	     System.out.println("서비스 임플 files :" + files);
	      
	     adminDao.insertProduct(product);
	      logger.info("서비스 임플 파일 사이즈 {}", files.get(0).getSize());

	      // 파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록
	      for (MultipartFile m : files) {
	         if (m.getSize() <= 0) {
	            logger.info("0보다 작음, 처리 중단");
	            return;
	         }
	      }

	      List<ProductFile> upfiles = new ArrayList<>();

	      // 파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
	      String storedPath = context.getRealPath("upload");
	      logger.info("storedPath : {}", storedPath);

	      // upload폴더가 존재하지 않으면 생성한다
	      File storedFolder = new File(storedPath);
	      storedFolder.mkdir();

	      for (int i = 0; i < files.size(); i++) {

	         File dest = null;
	         String storedName = null;

	         // 저장할 파일 이름 생성하기
	         storedName = files.get(i).getOriginalFilename();// 원본 파일명
	         storedName += UUID.randomUUID().toString().split("-")[0]; // UUID추가
	         logger.info("storedName : {}", storedName);

	         // 실제 저장될 파일 객체
	         dest = new File(storedFolder, storedName);

	         // -> 중복 이름 검증 코드 do while
	         // 이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기

	         try {

	            // 업로드된 파일을 upload폴더에 저장하기
	            // 여기서 저장
	            files.get(i).transferTo(dest);
	         } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	         }

	         // -------------------------------------------------

	         // DB에 기록할 정보 객체

	         // 첨부한 파일 삽입(파일 정보)
	         ProductFile productFile = new ProductFile();
	         
	         
	         productFile.setProdNo(product.getProdNo());
	         System.out.println("product 테스트"+product.getProdNo());
	         productFile.setProdOriginName(files.get(i).getOriginalFilename());
	         productFile.setProdStroedName(storedName);
	         System.out.println("productfile임"+productFile);
	         
	         upfiles.add(productFile);

	      }

	      for (ProductFile e : upfiles) {
	         adminDao.insertProductFile(e);
	      }
	      
	      prodOption.setProdNo(product.getProdNo());
	      adminDao.insertProdoption(prodOption);

	   }
	
	//테스트
	@Override
	public void insertOtherfiles(Product product, List<MultipartFile> otherfiles) {

		
	      // 파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록
	      for (MultipartFile m : otherfiles) {
	         if (m.getSize() <= 0) {
	            logger.info("0보다 작음, 처리 중단");
	            return;
	         }
	      }

	      List<ProductFile> upfiles = new ArrayList<>();

	      // 파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
	      String storedPath = context.getRealPath("upload");
	      logger.info("storedPath : {}", storedPath);

	      // upload폴더가 존재하지 않으면 생성한다
	      File storedFolder = new File(storedPath);
	      storedFolder.mkdir();

	      for (int i = 0; i < otherfiles.size(); i++) {

	         File dest = null;
	         String storedName = null;

	         // 저장할 파일 이름 생성하기
	         storedName = otherfiles.get(i).getOriginalFilename();// 원본 파일명
	         storedName += UUID.randomUUID().toString().split("-")[0]; // UUID추가
	         logger.info("storedName : {}", storedName);

	         // 실제 저장될 파일 객체
	         dest = new File(storedFolder, storedName);

	         // -> 중복 이름 검증 코드 do while
	         // 이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기

	         try {

	            // 업로드된 파일을 upload폴더에 저장하기
	            // 여기서 저장
	        	 otherfiles.get(i).transferTo(dest);
	         } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	         }

	         // -------------------------------------------------

	         // DB에 기록할 정보 객체

	         // 첨부한 파일 삽입(파일 정보)
	         ProductFile productFile = new ProductFile();
	         
	         
	         productFile.setProdNo(product.getProdNo());
	         System.out.println("product 테스트"+product.getProdNo());
	         productFile.setProdOriginName(otherfiles.get(i).getOriginalFilename());
	         productFile.setProdStroedName(storedName);
	         System.out.println("productfile임"+productFile);
	         
	         upfiles.add(productFile);

	      }

	      for (ProductFile e : upfiles) {
	         adminDao.insertProductFile(e);
	      }
	      
	    
	   		
		
		
	}
	
	
	

	@Override
	public void infoWrite(int adminNo, Info info, List<MultipartFile> files, MultipartFile thumb) {
		
		info.setAdminNo(adminNo);
		
		logger.info("info {}", info);
		logger.info("files {}", files);
		
		//게시글 내용 삽입
		adminDao.insertInfo(info);
		

		//썸네일
		//썸네일 없을 때 썸네일 삽입하는 메소드 처리되지 않도록 
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
		
		adminDao.insertinfoThumb(thumbnail);
		
		
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
		infoFiles.setInfoStoredName(storedName1);
		logger.info("infoFiles : {}", infoFiles );
		
		upfiles.add(infoFiles);
		
		}
		
		for( InfoFile e : upfiles) {
			adminDao.insertInfoFile(e);
		}
		
	}

		@Override
		public void deleteInfo(int infoNo) {
		
			adminDao.deleteThumb(infoNo);
			adminDao.deleteInfoFile(infoNo);
			adminDao.deleteInfo(infoNo);
		
		}
		
		@Override
		public List<Map<String, Object>> getInfo(int infoNo) {
			
			logger.info("infoServiceImpl getInfo()");
			
			return adminDao.selectInfoByInfoNo(infoNo);
		
		}


	 @Override
		public void updateFree(Free freeBoard, List<MultipartFile> files, List<FreeFile> freeFile) {
			
		 	adminDao.updateBoard(freeBoard);
		 	
		 	//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
			
			for(MultipartFile m : files) {
				if(m.getSize() <= 0 ) {
					logger.info("0보다 작음, 처리 중단");
					return;
				}
			}
			
			
			List<FreeFile> upfiles = new ArrayList<>();
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
//					freeFiles.setFreeFileNo(freeFile.get(i).getFreeFileNo());
				logger.info("freeFiles : {}", freeFiles );
				
				upfiles.add(freeFiles);
				
				}
				
				//기존에 첨부되어있는 파일을 삭제한다
				adminDao.deleteFile(freeBoard);
				
				//새로 첨부된 파일들을 저장한다
				for( FreeFile e : upfiles) {
					adminDao.insertFreeFile(e);
				}
					
					
				}
	 
	 
		@Override
		public void deleteGoods(Product prodNo) {
			System.out.println("서비스임플 굿즈삭제 prodNo : " + prodNo);
			adminDao.deleteGoods(prodNo);
		}

		@Override
		public List<Map<String, Object>> getProductList(Paging paging) {
			System.out.println(paging);
			
			return adminDao.selectProductList(paging);
		}


	   
		@Override
		public List<Map<String, Object>> getInfoList(Paging paging) {
			
			logger.info("adminServiceImpl getInfoList()");
			
			return adminDao.selectInfoList(paging);
		}
		
		@Override
		public Paging getInfoPaging(int curPage) {
			
			int totalCount = adminDao.selectCntInfo();
			
			logger.info("AdminServiceImpl getInfoPaging {}", totalCount);
			
			//한 페이지 당 보여질 게시글 수 listCount를 3으로 설정
			//파라미터 순서....
			Paging paging = new Paging(totalCount, curPage, 3);
			
			logger.info("AdminServiceImpl paging {}", paging);
			
			return paging;
		}
	
	@Override
	public void updateInfo(Info info, MultipartFile thumb) {
		
		logger.info("adminServiceImpl updateInfo()");
	
		//수정한 게시글 내용
		adminDao.updateInfoBoard(info);

		//=================썸네일 수정=================
		
		logger.info("썸네일 수정 동작!!!!!!!!");
		
		if(thumb.getSize() <= 0) {
			logger.info("썸네일 0보다 작음, 처리 중단");
			return;
		}
		
		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath1 = context.getRealPath("upload");
		logger.info("storedPath1 : {}", storedPath1);

		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder1 = new File(storedPath1);
		storedFolder1.mkdir();

		File dest1 = null;
		String storedName1 = null;

		//저장할 파일 이름 생성하기
		storedName1 = thumb.getOriginalFilename();//원본 파일명
		storedName1 += UUID.randomUUID().toString().split("-")[0]; //UUID추가
		logger.info("storedName1 : {}", storedName1);

		//실제 저장될 파일 객체
		dest1 = new File(storedFolder1, storedName1);

		//-> 중복 이름 검증 코드 do while
		//이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기

		try {

			//업로드된 파일을 upload폴더에 저장하기
			//여기서 저장
			thumb.transferTo(dest1);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		//-------------------------------------------------

		//DB에 기록할 정보 객체

		//첨부한 파일 삽입(파일 정보)
		InfoThumbnail infoThumb = new InfoThumbnail();

		infoThumb.setInfoNo(info.getInfoNo());
		infoThumb.setThumbOriginName(thumb.getOriginalFilename());
		infoThumb.setThumbStoredName(storedName1);
		logger.info("infoThumb : {}", infoThumb );

		//썸네일 삭제 후 삽입
		adminDao.deleteThumb(info.getInfoNo());
		
		adminDao.insertinfoThumb(infoThumb);
		
		
		
	
	}
	
 
	@Override
	public void updateFiles(Info info, List<MultipartFile> files) {
		
		//================첨부파일 수정===============
		
    	//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 

    	for(MultipartFile m : files) {
    		if(m.getSize() <= 0 ) {
    			logger.info("첨부파일 0보다 작음, 처리 중단");
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
    		InfoFile infoFiles = new InfoFile();

    		infoFiles.setInfoNo(info.getInfoNo());
    		infoFiles.setInfoOriginName(files.get(i).getOriginalFilename());
    		infoFiles.setInfoStoredName(storedName);
    		//여기서 에러
    		//				freeFiles.setFreeFileNo(freeFile.get(i).getFreeFileNo());
    		logger.info("infoFiles : {}", infoFiles );

    		upfiles.add(infoFiles);

    	}

    	//기존에 첨부되어있는 파일을 삭제한다
//    	adminDao.deleteInfoFile(info.getInfoNo());
    	//-> 삭제 안하고 추가로 첨부파일 넣을 수 있으려면 이 메소드 없어야 함

    	//새로 첨부된 파일들을 저장한다
    	for( InfoFile e : upfiles) {
    		adminDao.insertInfoFile(e);
    	}
    					
		
	}
	
	@Override
	public Info getContent(int infoNo) {
	
		return adminDao.selectContent(infoNo);
	}
	
	@Override
	public InfoThumbnail getThumb(int infoNo) {
		
		return adminDao.selectThumb(infoNo);
	}
	
	@Override
	public List<InfoFile> getFile(int infoNo) {
		
		return adminDao.selectFile(infoNo);
	}

	@Override
	public int deleteComm(int commNo) {
	
		int res = adminDao.deleteComment(commNo);
		
		return res;
		
	}
	
	@Override
	public List<Map<String, Object>> getCommentByFreeNo(int freeNo) {
		
		List<Map<String, Object>> commList = adminDao.selectCommByFreeNo(freeNo);
		
		return commList;
	}
	
	@Override
	public List<Map<String, Object>> getComment(Free freeBoard) {
		return adminDao.selectComment(freeBoard);
	}
	
	@Override
	public List<ProdInq> inquiryList(ProdInq prodinq) {
		return adminDao.ProdInq(prodinq);
	}

	@Override
	public void inquiryWrite(ProdInqAnswer prodInqAnswer) {
		adminDao.prodInqAnswer(prodInqAnswer);
		
	}

	@Override
		public int selectOne(int campno) {
			
			return adminDao.campParticipate(campno);
		}	
	
	@Override
	public void updateinquire(ProdInqAnswer prodInqAnswer) {
		adminDao.updateinquire(prodInqAnswer);
	}

	@Override
	public List<Map<String, Object>> getProdNoName() {
		
		return adminDao.getProdNoName();
	}

	@Override
	public void addopt(ProdOption prodOption) {
		
		adminDao.addopt(prodOption);
		
	}
	
	@Override
	public Paging getProductPaging(int curPage) {
		int totalCount = adminDao.selectCntAllProduct();
		// 페이징 객체
		Paging paging = new Paging(totalCount, curPage,6);
		

		return paging;
	}

	@Override
	public Paging getCampaignPaging(int curPage) {
		int totalCount = adminDao.selectCampaginCntAll();
		Paging paging = new Paging(totalCount, curPage);
		return paging;
	}


		
	
}
	
