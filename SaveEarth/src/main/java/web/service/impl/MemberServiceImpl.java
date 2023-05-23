package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberDao memberDao;
	
	@Override
	public void join(Member memberParam) {
		
		memberDao.insert(memberParam);
		
	}

	@Override
	public boolean login(Member member) {
		
		int result = memberDao.selectCntByIdPw(member);
		
		if(result>0) {
			return true;
		} else {
		
		return false;
		 }
	}

	@Override
	public Member info(String loginid) {
		logger.info("loginid : {}", loginid);
		return memberDao.selectById(loginid);
	}

}
