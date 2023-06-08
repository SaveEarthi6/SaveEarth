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
import web.dto.Product;
import web.dto.ProductFile;
import web.util.Paging;

public interface AdminDao {

   public int selectCntByIdPw(Admin admin);

   public int selectCntAll();


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


   public void deleteCam(Campaign campNo);

   
//   public List<Product> selectProdList(Paging paging);

   public void insertProductFile(ProductFile productFile);

   public void insertProduct(Product product);
   
   /**
    * 공지사항 수정
    * 
    * @param freeBoard - 수정할 게시글 정보
    */
   public void updateBoard(Free freeBoard);

   /**
    * 굿즈 게시판 삭제 
    * @param prodNo - 굿즈게시판 번호
    */
   public void deleteGoods(Product prodNo);

   /**
    * 쇼핑몰 리스트로 보여주기
    * @param paging
    * @return
    */
   public List<Map<String, Object>> selectProductList(Paging paging);

   public List<Map<String, Object>> selectList(Paging paging);




}