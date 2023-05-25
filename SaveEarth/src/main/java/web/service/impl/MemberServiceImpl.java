package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Mail;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired private MemberDao memberDao;
	
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

	@Override
	public Member update(String loginid) {
		logger.info("loginid : {}", loginid);
		
		return memberDao.update(loginid);
	}


	
	@Override
	public boolean checkid(Member member) {
		
		int check = memberDao.checkid(member);
		
		if(check > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public Member findid(Member member) {
		
		return memberDao.selectIdByNameEmail(member);
			
	}

	@Override
	public Member delete(String loginid) {
		logger.info(loginid);
		
		return memberDao.delete(loginid);
	}

	@Override
	public int overlappedID(Member member) {
		
		int result = memberDao.overlappedID(member);
		return result;
	}

	@Override
	public void sendSimpleMessage(Mail mail) {
		// TODO Auto-generated method stub
		
	}













}
