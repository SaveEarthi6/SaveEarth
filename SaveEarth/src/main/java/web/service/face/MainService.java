package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Calendar;
import web.dto.Quiz;

public interface MainService {
	
	/**
	 * 퀴즈 전체 조회
	 * @return
	 */
	public List<Quiz> selectAllQuiz();
	
	/**
	 * DB에서 달력 기념일 불러오기
	 * 
	 * @return 달력 DB에 존재하는 기념일 리스트
	 */
	public List<Calendar> getCalendar();
	
	/**
	 * 굿즈 상품 다 가져오기
	 * @return
	 */
	public List<Map<String, Object>> getProduct();
	
	/**
	 * 캠페인 참여 파일 가져오기
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getCert();

}
