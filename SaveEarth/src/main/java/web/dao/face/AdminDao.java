package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
import web.dto.Product;
import web.dto.ProductFile;
import web.util.Paging;

public interface AdminDao {

   public int selectCntByIdPw(Admin admin);

   public int selectCntAll();

   public List<Map<String, Object>> selectList(Paging paging);

   public void updateHit(Free freeBoard);

   public Map<String, Object> selectFreeBoard(@Param("freeBoard") Free freeBoard);

   public List<FreeFile> selectFreeFile(Free freeBoard);

   public int selectCntAll2();

   /**
    * 관리자 페이지 - 글작성
    * 
    * @param loginId
    * @return
    */
   public Admin selectById(String loginId);
   
   /**
    * 게시글 내용 삽입
    * 
    * @param free - 작성한 게시글 내용
    */
   public void insertFree(Free free);

   /**
    * 자유 게시판 첨부파일 삽입
    * 
    * @param e
    */
   public void insertFreeFile(FreeFile freeFile);
   
   /**
    * 게시글을 참조하고 있는 모든 첨부파일을 삭제한다
    * 
    * @param free - 첨부파일을 삭제할 자유게시판 번호 객체
    */
   public void deleteFile(Free free);
   
   /**
    * 게시글 정보 삭제
    * 
    * @param free - 삭제할 자유게시글의 글번호
    */
   public void delete(Free free);

   public List<Campaign> selectCampList(Paging paging);

   public List<Calendar> selectCalList();

   public int selectPartNo();

   public void insertCert(Certification certification);




   /**
    * 캠페인 게시판 글작성
    * @param campaign
    */
   public void insertCampaign(Campaign campaign);

   public void insertCampaignFile(CampaignFile campaignFile);


   public List<Map<String, Object>> selectCamList(Paging paging);

   /**
    * 관리자 정보 조회
    * @param loginId - 로그인한 관리자 아이디
    * @return - 로그인한 관리자 정보
    */
   public Admin selectAdmin(String loginId);

   //캠페인 게시글 삭제

   //public void deleteCam(int campNo);

   public void deleteCam(Campaign campNo);

   
   public List<Product> selectProdList(Paging paging);

   public void insertProductFile(ProductFile productFile);

   public void insertProduct(Product product);

   /**
	 * 정보게시판에 입력한 게시글 정보를 삽입한다
	 * @param info - 게시글 제목, 내용
	 */
	public void insertInfo(Info info);

	/**
	 * 썸네일 파일 정보를 삽입한다
	 * @param thumbnail - 첨부한 썸네일 정보
	 */
	public void insertinfoThumb(InfoThumbnail thumbnail);

	/**
	 * 정보게시판에 첨부한 파일 정보를 삽입한다
	 * @param infoFiles - 첨부한 파일 정보
	 */
	public void insertInfoFile(InfoFile e);
	
	/**
	 * 게시글 번호가 일치하는 썸네일을 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteThumb(int infoNo);
	
	/**
	 * 게시글 번호가 일치하는 파일(정보)를 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteInfoFile(int infoNo);
	
	/**
	 * 게시글 번호가 일치하는 게시글 내용을 삭제한다
	 * @param infoNo - 게시글 번호
	 */
	public void deleteInfo(int infoNo);

	/**
	 * 게시글 번호와 일치하는 게시글 내용을 조회한다
	 * @param infoNo - 게시글 번호
	 * @return - 게시글 번호가 일치하는 게시글 내용
	 */
	public List<Map<String, Object>> selectInfoByInfoNo(int infoNo);

	/**
	 * 관리자페이지 정보게시판 게시글 조회
	 * @param paging - 페이징 객체
	 * @return - 정보게시판 게시글
	 */
	public List<Map<String, Object>> selectInfoList(Paging paging);

	/**
	 * 정보게시판 총 개수
	 * @return - 게시글 총 개수
	 */
	public int selectCntInfo();
	
	


}