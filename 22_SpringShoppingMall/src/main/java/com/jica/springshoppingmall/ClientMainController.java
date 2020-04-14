package com.jica.springshoppingmall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ClientMainController {
	
	// 메인 페이지
	@RequestMapping(value = "main.springshoppingmall", method = RequestMethod.GET)
	public String main() {
		return "client/main/main";
	}
}
