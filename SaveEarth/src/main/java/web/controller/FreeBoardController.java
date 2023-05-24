package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FreeBoardController {

	@GetMapping("/free/main")
	public void free() {}
	
	@GetMapping("free/detail")
	public void detail() {}
	
	@GetMapping("free/write")
	public void write() {}
}
