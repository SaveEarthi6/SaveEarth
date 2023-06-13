package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Calendar;
import web.dto.Quiz;

public interface MainDao {
	
	/**
	 * 퀴즈 전체 조회
	 * @return
	 */
	public List<Quiz> selectAllQuiz();
	
	/**
	 * 캘린더 조회
	 * @return
	 */
	public List<Calendar> selectCalList();
	
	/**
	 * 굿즈 전체 조회
	 * @return
	 */
	public List<Map<String, Object>> selectAllProduct();
	
	/**
	 * 캠페인 참여 파일 모두 조회
	 * 
	 * @return
	 */
	public List<Map<String, Object>> selectAllCertFile();

}
