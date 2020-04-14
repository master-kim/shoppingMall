package com.jica.springshoppingmall;

import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jica.springshoppingmall.beans.UserBean;
import com.jica.springshoppingmall.beans.ValueBean;

/**
 * Handles requests for the application home page.
 */
@Controller
// login_bean은 세션에서 객체를 관리할 이름으로 지정한다.
@SessionAttributes("login_bean")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 세션에 저장할 객체를 생성하여 반환한다.
	@ModelAttribute("login_bean")
	public UserBean login_bean() {
		UserBean login_bean = new UserBean();
		login_bean.setLogin(false);
		return login_bean;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		
		// JSP 파일에서 사용하기 위해 application 영역에 ValueBean 객체를 저장한다.
		ServletContext context = request.getServletContext();
		if(context.getAttribute("value") == null) {
			context.setAttribute("value", new ValueBean());
		}
		
		return "redirect:main.springshoppingmall";
	}
	
}







