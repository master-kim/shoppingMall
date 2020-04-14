package com.jica.springshoppingmall.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jica.springshoppingmall.beans.UserBean;


// 로그인 여부를 확인처리 Interceptor
// Interceptor 등록은 appServlet/servlet-context.xml
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	// 요청에 의해 호출되는 메서드 전에 호출
	// 반환 : true - 인터셉터 수행 후 컨트롤러의 메서드가 호출
	//       false - 인터셉터 수행 후 컨트롤러의 메서드가 호출되지 않는다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// 로그인 확인 처리
		HttpSession session = request.getSession();
		UserBean login_bean = (UserBean)session.getAttribute("login_bean");
		
		if(login_bean != null && login_bean.isLogin() == true) {		// 로그인을 했을 때
			return true;
		} else {			// 로그인을 하지 않았을 경우
			response.sendRedirect("need_login.springshoppingmall");
			return false;
		}
		
	}
	
	// 요청에 의해 호출되는 메서드가 호출된 후에 호출
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}
}





