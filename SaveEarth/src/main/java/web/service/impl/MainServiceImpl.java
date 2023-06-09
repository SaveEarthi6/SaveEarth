package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MainDao;
import web.dto.Calendar;
import web.dto.Quiz;
import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	
	@Override
	public List<Quiz>selectAllQuiz() {
		
		return mainDao.selectAllQuiz();
	}

	@Override
	public List<Calendar> getCalendar() {
		return mainDao.selectCalList();
	}

}
