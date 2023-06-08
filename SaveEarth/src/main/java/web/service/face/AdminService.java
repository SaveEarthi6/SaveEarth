package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Admin;
import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.CampaignFile;
import web.dto.Certification;
import web.dto.Free;
import web.dto.FreeFile;
import web.dto.Info;
import web.dto.Member;
import web.dto.Product;
import web.util.Paging;

public interface AdminService {
   
   /**
    * 관리자
    * @param adminParam
    * @return
    */
    public boolean login(Admin admin);

    /**
     * 페이징 
     * @param curPage
     * @return
     */
   public Paging getPaging(int curPage);

   public List<Map<String, Object>> list(Paging paging);

   public Map<String, Object> getView(Free freeBoard);

   public List<FreeFile> getFreeFile(Free freeBoard);

   public Paging getPaging2(int curPage);

   /**
    * 게시글 작성 
    * @param free - 작성한 게시글 정보
    * @param files - 파일 정보
    * @param memberInfo - 로그인 회원정보
    */
   public void freeWrite(Free free, List<MultipartFile> files, Admin memberInfo, Member member);

   /**
    * 관리자 정보 불러오기
    * @param loginId
    * @return
    */
   public Admin info(String loginId);

   /**
    * 관리자페이지 - 회원게시글 삭제
    * @param free
    */
   public void delete(Free free);

   public List<Campaign> getCampList(Paging paging);

   public List<Calendar> getCalendar();

   public void writePart(Certification certification, MultipartFile partFile);

   /**
    * 캠페인 게시판 글쓰기
    * @param campaign
    * @param files
    * @param memberInfo
    * @param member
    */
   public void campaignWrite(Campaign campaign, List<MultipartFile> files, Admin memberInfo);

   

   public List<Map<String, Object>> Camlist(Paging paging);
 
   public void campDelete(Campaign campaign);

   public Admin getAdmin(String loginId);


   /**
    * 로그인한 관리자 아이디로 관리자 정보를 조회한다
    * @param loginId - 로그인한 관리자 아이디
    * @return - 로그인한 관리자 정보
    */
   public void deleteCam(Campaign campNo);


   
   /**
    * 굿즈 게시판 상품 불러오기 
    * @param paging
    * @return
    */
   public List<Product> getproductList(Paging paging);

   /**
    * 관리자 페이지 - 굿즈샵 상품등록
    * @param product
    * @param files
    * @param memberInfo
    */
   public void productnWrite(Product product, List<MultipartFile> files, Admin memberInfo);

   public Map<String, Object> getView(Campaign campaign);

   public List<CampaignFile> getCampFile(Campaign campaign);
   
	/**
	 * 게시글 정보 수정하기   
	 * @param campaign - 입력한 게시글 정보
	 * @param files - 수정한 파일
	 * @param campFile - 수정할 파일 번호
	 */
   public void updateCamp(Campaign campaign, List<MultipartFile> files, List<CampaignFile> campFile);
   

   
   


   

   

   




   
   




}