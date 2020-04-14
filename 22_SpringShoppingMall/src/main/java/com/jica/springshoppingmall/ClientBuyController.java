package com.jica.springshoppingmall;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jica.springshoppingmall.beans.BuyCompleteBean;
import com.jica.springshoppingmall.beans.CartBean;
import com.jica.springshoppingmall.beans.PageBean;
import com.jica.springshoppingmall.beans.UserBean;

@Controller
//login_bean은 세션에 저장할 이름으로 지정한다
@SessionAttributes("login_bean")
public class ClientBuyController {
	
	// DAO Bean을 주입받는다.(자동 주입)
	@Autowired
	private SqlSessionTemplate db;
	
	// 장바구니 가기 (장바구니 리스트 불러오기)
	@RequestMapping(value = "buy_cart.springshoppingmall", method = RequestMethod.GET)
	public String buy_cart(Model model,
		
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num){
		
		// 페이지 네이션 설정
		int min = ((page_num - 1) * 5) + 1;
		int max = min + 5 - 1;

		// 페이지 네이션 구성을 위한 데이터를 가져온다.
		int cnt = db.selectOne("buy_db.cart_cnt");
		PageBean page_bean = new PageBean(page_num, cnt, 5, 5);
		model.addAttribute("page_bean", page_bean);
		model.addAttribute("page_num", page_num);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("min", min);
		map.put("max", max);
		
		// 장바구니 리스트 가져오기 쿼리문 
		List<CartBean> cart_list = db.selectList("buy_db.cart_list" ,map);		
		model.addAttribute("cart_list", cart_list);
		
		return "client/buy/buy_cart";
	}

	// 구매하기 장바구니 담기 클릭 처리
	@RequestMapping(value = "buy_cart_pro.springshoppingmall", method = RequestMethod.POST)
	public String buy_cart_pro(Model model, CartBean cart_bean,
		@ModelAttribute("login_bean") UserBean login_bean ) {
		
		cart_bean.setCart_user_idx(login_bean.getUser_idx());
		db.insert("buy_db.cart_insert", cart_bean);
		model.addAttribute("result", "OK");
		
		return "common/result";
	}
	
	// 장바구니 한개 삭제 처리
	@RequestMapping(value = "buy_delete.springshoppingmall", method = RequestMethod.POST)
	public String buy_delete(Model model,
		@RequestParam("cart_idx") int cart_idx){
	
		db.delete("buy_db.cart_delete", cart_idx);
		
		model.addAttribute("result", "OK");
		return "common/result";
	}

	// 장바구니 전체 삭제 처리
	@RequestMapping(value = "buy_delete_pro.springshoppingmall", method = RequestMethod.POST)
	public String buy_delete_pro(Model model,CartBean cart_bean,
			
		@ModelAttribute("login_bean") UserBean login_bean ) {

		cart_bean.setCart_user_idx(login_bean.getUser_idx());
		
		db.delete("buy_db.cart_all_delete", cart_bean);
		
		model.addAttribute("result", "OK");

		return "common/result";
	}
	
	// 장바구니 구매하기
	@RequestMapping(value = "product_cart_buy.springshoppingmall", method = RequestMethod.GET)
	public String product_cart_buy(Model model,UserBean user_bean,
			
			
			@ModelAttribute("login_bean") UserBean login_bean,
			@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num){
			
			// 구매자 정보 가져오는 컨트롤러 및 쿼리문 세팅
			user_bean.setUser_idx(login_bean.getUser_idx());
			UserBean user_info = db.selectOne("product_db.buyer_info", user_bean);
			model.addAttribute("user_info", user_info);
				
				
			// 페이지 네이션 설정
			int min = ((page_num - 1) * 5) + 1;
			int max = min + 5 - 1;

			// 페이지 네이션 구성을 위한 데이터를 가져온다.
			int cnt = db.selectOne("buy_db.cart_cnt");
			PageBean page_bean = new PageBean(page_num, cnt, 5, 5);
			model.addAttribute("page_bean", page_bean);
			model.addAttribute("page_num", page_num);
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("min", min);
			map.put("max", max);
			
			
			// 장바구니 리스트 가져오기 쿼리문 
			List<CartBean> cart_list = db.selectList("buy_db.cart_list" ,map);		
			model.addAttribute("cart_list", cart_list);
			
			// 장바구니 구매확정시 결정 금액
			int cart_buy_sum = db.selectOne("buy_db.cart_buy_sum", login_bean.getUser_idx());
			model.addAttribute("cart_buy_sum", cart_buy_sum);
			
		return "client/product/product_cart_buy";
	}
	
	// 장바구니 구매하기 누를시 이력테이블에 저장하는것
	@RequestMapping(value = "cart_complete_pro.springshoppingmall", method = RequestMethod.POST)
	public String cart_complete_pro(Model model,  UserBean user_bean, HttpServletRequest request ,	
					
		@ModelAttribute("login_bean") UserBean login_bean ) {
		// 구매자 정보 가져오는 컨트롤러 및 쿼리문 세팅
			user_bean.setUser_idx(login_bean.getUser_idx());
			UserBean user_info = db.selectOne("product_db.buyer_info", user_bean);
			model.addAttribute("user_info", user_info);
			
			String [] buy_complete_idx = request.getParameterValues("buy_complete_idx");
			String [] buy_complete_product_idx = request.getParameterValues("buy_complete_product_idx");
			String [] buy_complete_cnt = request.getParameterValues("buy_complete_cnt");
			String [] buy_complete_total_price = request.getParameterValues("buy_complete_total_price");
			String [] buy_complete_price = request.getParameterValues("buy_complete_price");
			
			for(int i = 0; i < buy_complete_idx.length; i++) {
				BuyCompleteBean bean1 = new BuyCompleteBean();
				bean1.setBuy_complete_idx(Integer.parseInt(buy_complete_idx[i]));
				
				bean1.setBuy_complete_product_idx(Integer.parseInt(buy_complete_product_idx[i]));
				
				bean1.setBuy_complete_cnt(Integer.parseInt(buy_complete_cnt[i]));
			
				bean1.setBuy_complete_total_price(Integer.parseInt(buy_complete_total_price[i]));
				
				bean1.setBuy_complete_price(Integer.parseInt(buy_complete_price[i]));
				
				
				db.insert("buy_db.cart_complete_insert",bean1 );
			}
			model.addAttribute("result", "OK");
			

		return "common/result";
	}	
		
		
	
	// 구매이력
	@RequestMapping(value = "buy_history.springshoppingmall", method = RequestMethod.GET)
	public String buy_histroy(Model model, UserBean user_bean,
			
		@ModelAttribute("login_bean") UserBean login_bean,
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num) {
		
		// 구매자 정보 가져오는 컨트롤러 및 쿼리문 세팅
		user_bean.setUser_idx(login_bean.getUser_idx());
		UserBean user_info = db.selectOne("product_db.buyer_info", user_bean);
		model.addAttribute("user_info", user_info);
		
		// 구매확정 누를시 구매이력리스트가져오는 쿼리문 세팅	
		// 페이지 네이션 설정
		int min = ((page_num - 1) * 20) + 1;
		int max = min + 20 - 1;

		// 페이지 네이션 구성을 위한 데이터를 가져온다.
		int cnt = db.selectOne("buy_db.buy_complete_cnt");
		PageBean page_bean = new PageBean(page_num, cnt,20, 10);
		model.addAttribute("page_bean", page_bean);
		model.addAttribute("page_num", page_num);

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("min", min);
		map.put("max", max);
				
		List<BuyCompleteBean> buy_complete_list = db.selectList("buy_db.buy_complete_list" ,map);		
		model.addAttribute("buy_complete_list", buy_complete_list);
		

		return "client/buy/buy_history";
	}
	
	// 구매하기 누를시 이력테이블에 저장하는것
	@RequestMapping(value = "buy_complete_pro.springshoppingmall", method = RequestMethod.POST)
	public String buy_complete_pro(Model model, UserBean user_bean, BuyCompleteBean buy_complete_bean,

		@ModelAttribute("login_bean") UserBean login_bean) {

		// 구매자 정보 가져오는 컨트롤러 및 쿼리문 세팅
		user_bean.setUser_idx(login_bean.getUser_idx());
		UserBean user_info = db.selectOne("product_db.buyer_info", user_bean);
		model.addAttribute("user_info", user_info);

		db.insert("buy_db.buy_insert", buy_complete_bean);
		model.addAttribute("result", "OK");

		return "common/result";
	}	
	
}
