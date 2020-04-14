package com.jica.springshoppingmall;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jica.springshoppingmall.beans.UserBean;
import com.jica.springshoppingmall.beans.ValueBean;

@Controller
// login_bean은 세션에 저장할 이름으로 지정한다
@SessionAttributes("login_bean")
public class ClientUserController {
	
	// DAO Bean을 주입받는다.
	@Autowired
	private SqlSessionTemplate db;
	
	// 로그인
	@RequestMapping(value = "user_login.springshoppingmall", method = RequestMethod.GET)
	public String user_login() {
		return "client/user/user_login";
	}

	// 아이디 비밀번호 찾기
	@RequestMapping(value = "user_search.springshoppingmall", method = RequestMethod.GET)
	public String user_search() {
		return "client/user/user_search";
	}

	// 로그인 처리
	@RequestMapping(value = "user_login_pro.springshoppingmall", method = RequestMethod.POST)
	// model : request, session 관리 객체
	// user_bean : 파라미터 데이터를 주입받기 위한 객체
	public String user_login_pro(Model model, UserBean user_bean) {
		
		// 로그인 정보를 확인한다.
		user_bean.setUser_status(ValueBean.STATUS_ENABLED);
		UserBean login_bean = db.selectOne("user_db.user_login_pro", user_bean);
		
		if(login_bean == null) {	// 로그인 실패
			model.addAttribute("result", "NO");
		} else {			// 로그인 성공
			login_bean.setLogin(true);
			model.addAttribute("login_bean", login_bean);
			model.addAttribute("result", "YES");
		}
		
		return "common/result";
	}
	
	// 회원가입
	@RequestMapping(value = "user_join.springshoppingmall", method = RequestMethod.GET)
	public String user_join() {
		return "client/user/user_join";
	}
	
	// 마이페이지 메인
	@RequestMapping(value = "user_info_main.springshoppingmall", method = RequestMethod.GET)
	// model : session, request 관리 객체
	// login_bean : 로그인한 사용자 정보
	public String user_info_main(Model model, @ModelAttribute("login_bean") UserBean login_bean) {
		
		// 사용자 정보를 가져온다.
		UserBean user_bean = db.selectOne("user_db.get_user_info", login_bean.getUser_idx());
		model.addAttribute("user_bean", user_bean);

		return "client/user/user_info_main";
	}
	
	// 내정보
	@RequestMapping(value = "user_info.springshoppingmall", method = RequestMethod.GET)
	// model : session, request 관리 객체
	// login_bean : 로그인한 사용자 정보
	public String user_info(Model model, @ModelAttribute("login_bean") UserBean login_bean) {
		
		// 사용자 정보를 가져온다.
		UserBean user_bean = db.selectOne("user_db.get_user_info", login_bean.getUser_idx());
		model.addAttribute("user_bean", user_bean);
		
		return "client/user/user_info";
	}
	
	// 로그아웃
	@RequestMapping(value = "logout.springshoppingmall", method = RequestMethod.GET)
	// model : session, request 관리 객체
	// login_bean : 세션에 저장되어 있는 로그인 사용자 정보 객체
	public String logout(Model model, @ModelAttribute("login_bean") UserBean login_bean) {
		login_bean.setLogin(false);
		
		return "client/user/logout";
	}
	
	// 아이디 중복 확인
	@RequestMapping(value = "check_user_id.springshoppingmall", method = RequestMethod.POST)
	// model : request, session 관리객체
	// user_id : 중복 체크할 사용자 아이디
	public String check_user_id(Model model, @RequestParam("user_id") String user_id) {
		
		// 사용자 아이디를 가져와본다.
		String result_id = db.selectOne("user_db.check_user_id", user_id);
		
		if(result_id == null) {	// 사용가능한 아이디
			model.addAttribute("result", "YES");
		} else {
			model.addAttribute("result", "NO");
		}
		
		return "common/result";
	}
	
	@RequestMapping(value = "join_user.springshoppingmall", method = RequestMethod.POST)
	// model : request, session 관리 객체
	// user_bean : 파라미터로 넘어온 정보를 주입받은 사용자 정보 객체
	public String join_user(Model model, UserBean user_bean) {
		
		user_bean.setUser_status(ValueBean.STATUS_ENABLED);
		user_bean.setUser_grade(ValueBean.USER_GRADE_NORMAL);
		
		db.insert("user_db.join_user", user_bean);
		
		model.addAttribute("result", "OK");
		return "common/result";
	}
	
	@RequestMapping(value = "need_login.springshoppingmall", method = RequestMethod.GET)
	public String need_login() {
		
		return "common/need_login";
	}
	
	// 회원 정보 수정 처리
	@RequestMapping(value = "modify_user_info.springshoppingmall", method = RequestMethod.POST)
	// model : session, request 관리 객체 
	// user_bean : 수정할 정보가 담긴 객체(파라미터)
	public String modify_user_info(Model model, UserBean user_bean) {
		
		db.update("user_db.modify_user_info", user_bean);
		
		model.addAttribute("result", "OK");
		return "common/result";	
	}
	
}










