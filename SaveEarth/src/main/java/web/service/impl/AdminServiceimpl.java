package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.AdminController;
import web.dao.face.AdminDao;
import web.dto.Admin;
import web.service.face.AdminService;

@Service
public class AdminServiceimpl implements AdminService {

   private final Logger logger = LoggerFactory.getLogger(AdminController.class);

   @Autowired AdminDao adminDao;
   
   @Override
   public boolean login(Admin adminParam) {
logger.info("login() - {}", adminParam);
      
      int result = adminDao.selectCntByIdPw(adminParam);
      logger.info("login() - result : {}", result);
      
      if( result > 0 ) {
         return true; //로그인 인증 성공
      }      
      
      return false; //로그인 인증 실패
   }
}