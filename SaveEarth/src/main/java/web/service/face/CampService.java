package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Calendar;
import web.dto.Campaign;
import web.dto.Certification;
import web.util.Paging;

public interface CampService {

	/**
	 * 전달받은 현재페이지를 이용하여 페이징 객체 얻기
	 * 
	 * @param curPage - 전달받은 현재페이지값
	 * @return 계산된 페이징객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징 객체를 이용하여 해당 페이지에 로드될 캠페인 목록 얻어오기
	 * 
	 * @param paging - 계산된 페이징 객체
	 * @return 해당 페이지에 로드될 캠페인 목록
	 */
	public List<Campaign> getCampList(Paging paging);

	/**
	 * 전달파라미터로 전달된 캠페인 번호와 일치하는 캠페인 정보 얻기
	 * 
	 * @param campno - 캠페인 번호
	 * @return 일치하는 캠페인 정보
	 */
	public Map<String, Object> getCampDetail(int campno);

	/**
	 * 전달받은 현재페이지와 말머리를 이용하여 페이징 객체 얻기
	 * 
	 * @param curPage - 전달받은 현재 페이지값
	 * @param state - 말머리
	 * @return 계산된 페이징 객체
	 */
	public Paging getPagingByState(int curPage, String state);

	/**
	 * 페이징 객체와 말머리를 이용하여 해당 페이지에 로드될 캠페인 목록 얻어오기
	 * 
	 * @param paging - 페이징 객체
	 * @param state - 말머리
	 * @return 페이지에 로드될 캠페인 목록
	 */
	public List<Campaign> getListByState(Paging paging, String state);

	/**
	 * 입력받은 인증글 객체와 첨부파일을 DB에 저장하기
	 * 
	 * @param certification - 입력받은 인증글 정보가 담긴 DTO
	 * @param partFile - 첨부파일
	 */
	public void writePart(Certification certification, MultipartFile partFile);

	/**
	 * DB에서 달력 기념일 불러오기
	 * 
	 * @return 달력 DB에 존재하는 기념일 리스트
	 */
	public List<Calendar> getCalendar();

	/**
	 * [진행중] 상태인 캠페인 불러오기
	 * 
	 * @return [진행중] 상태인 캠페인 리스트
	 */
	public List<Campaign> getIngList(int userNo);

	/**
	 * 회원번호와 일치하는 인증글 불러오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @return 일치하는 인증글 리스트
	 */
	public List<Certification> getcertList(int userNo);

	/**
	 * userNo과 일치하는 회원의 calDate에 작성한 인증글 목록 불러오기
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @param calDate - 클릭한 날
	 * @return 해당 날짜에 작성된 인증글의 목록
	 */
	public List<Map<String, Object>> getcertList(int userNo, String calDate);

	/**
	 * 파라미터와 일치하는 인증글, 인증글 파일 지우기
	 * 
	 * @param partNo - 인증글 PK
	 * @param partFileNo - 인증글 파일 PK
	 */
	public void deleteCert(int partNo, int partFileNo);

	/**
	 * userNo과 일치하는 회원의 
	 * 
	 * @param userNo - 로그인한 회원의 번호
	 * @param partNo - 클릭한 인증글의 번호
	 * @return 인증글 정보
	 */
	public Map<String, Object> getCert(int userNo, int partNo);

}
