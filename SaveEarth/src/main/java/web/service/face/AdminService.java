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
import web.dto.InfoFile;
import web.dto.InfoThumbnail;
import web.dto.Member;
import web.dto.ProdInq;
import web.dto.ProdInqAnswer;
import web.dto.ProdOption;
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
//   public List<Product> getproductList(Paging paging);

   /**
    * 관리자 페이지 - 굿즈샵 상품등록
    * @param product
    * @param files
    * @param memberInfo
    */
   public void productnWrite(Product product, List<MultipartFile> files, Admin memberInfo, ProdOption prodOption);
   
   /**
    *  게시글 수정
    * @param campaign
    * @return
    */
   public Map<String, Object> getView(Campaign campaign);
   
   /**
    * 게시글 수정
    * @param campaign
    * @return
    */
   public List<CampaignFile> getCampFile(Campaign campaign);
   
	/**
	 * 게시글 정보 수정하기   
	 * @param campaign - 입력한 게시글 정보
	 * @param files - 수정한 파일
	 * @param campFile - 수정할 파일 번호
	 */
   public void updateCamp(Campaign campaign, List<MultipartFile> files, List<CampaignFile> campFile);
   
   /**
    * 관리자 페이지에서 정보게시판 글 작성
    * @param adminNo - 관리자 번호
    * @param info - 작성한 게시글 내용
    * @param thumb - 썸네일
    * @param files - 첨부파일
    */
   public void infoWrite(int adminNo, Info info, List<MultipartFile> files, MultipartFile thumb);
   
   /**
    * 
    * @param infoNo
    */
   public void deleteInfo(int infoNo);

   /**
	 * 게시글 번호와 일치하는 게시글 내용 가져오기
	 * @param infoNo - 게시글 번호
	 * @return - 게시글 번호 일치하는 게시글 내용
	 */
   public List<Map<String, Object>> getInfo(int infoNo);
   
   /**
    * 정보게시판 게시글 조회
    * @param paging - 페이징 객체
    * @return - 정보게시판 게시글
    */
   public List<Map<String, Object>> getInfoList(Paging paging);
   
   /**
    * 정보게시판 게시글 총 개수 조회
    * @param curPage - 현재 페이지
    * @return - 페이징 객체
    */
   public Paging getInfoPaging(int curPage);


public void updateFree(Free freeBoard, List<MultipartFile> files, List<FreeFile> freeFile);

   /**
    * 굿즈 게시판 상품 삭제 
    * @param prodNo - 상품번호
    */
   public void deleteGoods(Product prodNo);

   /**
    * 리스트로 보여주기
    * @param paging
    * @return
    */
   public List<Map<String, Object>> getProductList(Paging paging);

   /**
    * 정보게시판 게시글 수정
    * @param info - 게시글 내용
    * @param thumb - 썸네일 파일
    */
   public void updateInfo(Info info, MultipartFile thumb);

   /**
    * 정보게시판 게시글 수정
    * @param info - 수정할 게시글 정보
    * @param files - 첨부파일들 정보
    */
   public void updateFiles(Info info, List<MultipartFile> files);
   
   
   /**
    * 정보게시판 게시글 내용 조회
    * @param infoNo - 게시글 번호
    * @return - 게시글 내용
    */
   public Info getContent(int infoNo);

   /**
    * 정보게시판 썸네일 정보 조회
    * @param infoNo - 게시글 번호
    * @return - 게시글 번호가 일치하는 썸네일 정보
    */
   public InfoThumbnail getThumb(int infoNo);

   /**
    * 정보게시판 첨부파일 정보 조회
    * @param infoNo - 게시글 번호
    * @return - 게시글 번호가 일치하는 파일 정보
    */
   public List<InfoFile> getFile(int infoNo);

   /**
    * 댓글 삭제
    * @param commNo 
 * @return 
    */
   public int deleteComm(int commNo);

/**
 * 게시글번호를 가지고 댓글 정보를 조회한다
 * 
 * @param freeNo
 * @return
 */
public List<Map<String, Object>> getCommentByFreeNo(int freeNo);

/**
 * 게시글 번호를 가지고 댓글 정보를 조회한다
 * @param freeBoard
 * @return
 */
public List<Map<String, Object>> getComment(Free freeBoard);

   /**
    * 관리자 페이지 - 문의내용 리스트로 불러오기
    * @param prodinq
    * @return
    */
   public List<ProdInq> inquiryList(ProdInq prodinq);

   public void inquiryWrite(ProdInqAnswer prodInqAnswer);


   
   public int selectOne(int campno);
   
   /**
    * 관리자 페이지 - 굿즈샵 상태변화
    * @param prodInqAnswer
    */
   public void updateinquire(ProdInqAnswer prodInqAnswer);

   
   /**
    * 옵션 추가를 위한 번호랑 상품이름 뽑기
    * @return
    */
   public List<Map<String, Object>> getProdNoName();

   /**
    * 상품 옵션 추가
    * @param prodOption
    */
   public void addopt(ProdOption prodOption);

   public void insertOtherfiles(Product product, List<MultipartFile> otherfiles);
   
   /**
    * 어드민 - 상품목록 불러오기 페이징
    * @param curPage
    * @return
    */
   public Paging getProductPaging(int curPage);
   
   /**
    * 관리자 - 캠페인 게시판 리스트로 글보여줌
    * @param curPage
    * @return
    */
   public Paging getCampaignPaging(int curPage);





   

	



}