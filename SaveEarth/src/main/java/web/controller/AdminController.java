package web.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Admin;
import web.service.face.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

   private final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Autowired AdminService adminService;
   
   @RequestMapping("/main")
   public void main() {
      
   }
   
   @GetMapping("/login")
   public void loginpage() {
      logger.info("admin/login[Get]");
   }
   
   @PostMapping("/login")
   public String login(HttpSession session, Admin adminParam) {
      logger.info("admin/login [POST]");
      logger.info( "관리자 로그인 ;{}", adminParam);
      
      boolean isLogin = adminService.login(adminParam);
      logger.info("isLogin : {}", isLogin);
      
      if( isLogin) { 
         logger.info("로그인 성공");
         session.setAttribute("isLogin", isLogin);
         session.setAttribute("admin", true);
         return "redirect: ./main";
         
      } else {
         logger.info("로그인 실패");
         session.invalidate();
         return "redirect: ./login";
      }
      
      
   }

   
}