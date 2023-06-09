package web.service.face;

import java.util.List;

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

}
