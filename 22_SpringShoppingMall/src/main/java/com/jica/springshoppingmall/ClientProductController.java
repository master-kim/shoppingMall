package com.jica.springshoppingmall;

import java.util.HashMap;
import java.util.List;

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
import com.jica.springshoppingmall.beans.ProductBean;
import com.jica.springshoppingmall.beans.ProductCategoryBean;
import com.jica.springshoppingmall.beans.UserBean;

@Controller
//login_bean은 세션에 저장할 이름으로 지정한다
@SessionAttributes("login_bean")
public class ClientProductController {
	
	// DAO Bean을 주입받는다.(자동 주입)
	@Autowired
	private SqlSessionTemplate db;
	
	// 메인화면 (나만의상품,패키지상품 누르고 나오는 화면 컨트롤러)
	@RequestMapping(value = "main_product_box.springshoppingmall", method = RequestMethod.GET)
	public String main_product_box(Model model,
				
		@RequestParam(value = "product_main_idx") int product_main_idx) {
			
		model.addAttribute("product_main_idx", product_main_idx);
			
			
		return "client/product/main_product_box";
	}
	
	// 상품 리스트
	@RequestMapping(value = "product_list.springshoppingmall", method = RequestMethod.GET)
	public String product_list(Model model,
			
			@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
            @RequestParam(value = "product_category_idx") int product_category_idx) {
			
			// 페이지 네이션 설정
			int min = ((page_num - 1) * 8) + 1;
			int max = min + 8 - 1;
			
			int cnt = db.selectOne("product_db.product_cnt");
			PageBean page_bean = new PageBean(page_num, cnt, 8, 10);
					
			model.addAttribute("page_bean", page_bean);
			model.addAttribute("page_num", page_num);
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("min", min);
			map.put("max", max);
			map.put("product_category_idx", product_category_idx);
		
			// 제품 리스트 가져오기 쿼리문 
			List<ProductBean> list = db.selectList("product_db.product_list" ,map);
			model.addAttribute("product_list", list);
			
			// 제품 이름 가져오기 쿼리문
			ProductCategoryBean bean = db.selectOne("product_db.product_info", product_category_idx);
			
			model.addAttribute("product_category_bean", bean);
			model.addAttribute("product_category_idx", product_category_idx);
			

		return "client/product/product_list";
	}
	
	// 상품 상세 정보
	@RequestMapping(value = "product_detail.springshoppingmall", method = RequestMethod.GET)
	public String product_detail(Model model,
			
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "product_category_idx") int product_category_idx,
		@RequestParam(value = "product_idx") int product_idx)
		{

		ProductCategoryBean bean = db.selectOne("product_db.product_info", product_category_idx);
		
		model.addAttribute("page_num", page_num);
		model.addAttribute("product_category_bean", bean);
		model.addAttribute("product_category_idx", product_category_idx);
		model.addAttribute("product_idx", product_idx);
		
		
		ProductBean bean2 = db.selectOne("product_db.product_info_detail", product_idx);
		model.addAttribute("product_info_bean", bean2);
		

		return "client/product/product_detail";
	}
	
	// 베스트 상품 상세정보 보기
		@RequestMapping(value = "product_best_detail.springshoppingmall", method = RequestMethod.GET)
		public String product_best_detail(){		
		return "client/product/product_best_detail";
	}
	
	// 구매하기 (제품 구매하기 누르고 나오는 구매리스트 및 회원정보 등등)
	@RequestMapping(value = "product_buy.springshoppingmall", method = RequestMethod.GET)
	public String product_buy(Model model, UserBean user_bean,
			
		@ModelAttribute("login_bean") UserBean login_bean,
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "product_category_idx") int product_category_idx,
		@RequestParam(value = "product_idx") int product_idx,
		@RequestParam(value = "product_cnt") int product_cnt){

		// 구매자 정보 가져오는 컨트롤러 및 쿼리문 세팅
		user_bean.setUser_idx(login_bean.getUser_idx());
		UserBean user_info = db.selectOne("product_db.buyer_info", user_bean);
		model.addAttribute("user_info", user_info);
		
		// 제품 카테고리 및 제품번호
		ProductBean bean = db.selectOne("product_db.product_info_detail", product_idx);
		
		model.addAttribute("page_num", page_num);
		model.addAttribute("product_category_bean", bean);
		model.addAttribute("product_category_idx", product_category_idx);
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("product_cnt", product_cnt);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_cnt", product_cnt);
		map.put("product_idx", product_idx);
		
		BuyCompleteBean bean2 = db.selectOne("product_db.buy_sum", map);
		model.addAttribute("total_price", bean2);

		return "client/product/product_buy";
	}

}






