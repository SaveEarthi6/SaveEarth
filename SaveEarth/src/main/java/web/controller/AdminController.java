package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public void admin(Admin admin, HttpSession session) {
		logger.info("/admin/login");
		
		logger.info("/admin/main");
		logger.info("{}", admin);
		
//		boolean adminLogin = adminService.login(admin);
		
//		if(adminLogin) {
//			session.setAttribute("adminLogin", adminLogin);
//			session.setAttribute("adminLogin", admin.getAdminNo());
//			
//		} else {
//			session.invalidate();
//		}
//		
//		return "";
	}
	
	
	@RequestMapping("/logout")
	public void adminlogout() {
		logger.info("/admin/logout");
	}
	

			

}
