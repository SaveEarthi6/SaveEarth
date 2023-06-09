package web.dao.face;

import java.util.List;

import web.dto.Calendar;
import web.dto.Quiz;

public interface MainDao {
	
	/**
	 * 퀴즈 전체 조회
	 * @return
	 */
	public List<Quiz> selectAllQuiz();

	public List<Calendar> selectCalList();

}
