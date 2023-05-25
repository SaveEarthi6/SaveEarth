package web.service.impl;

import org.springframework.stereotype.Service;

import web.dto.Admin;
import web.service.face.AdminService;

@Service
public class AdminServiceimpl implements AdminService {

	@Override
	public boolean login(Admin admin) {
		return false;
	}

}
