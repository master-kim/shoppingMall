package com.jica.springshoppingmall;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jica.springshoppingmall.beans.BoardContentBean;
import com.jica.springshoppingmall.beans.PageBean;
import com.jica.springshoppingmall.beans.ProductBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
//login_bean은 세션에 저장할 이름으로 지정한다
@SessionAttributes("login_bean")
public class ManagerController {

	// dao Bean을 주입받는다.
	@Autowired
	private SqlSessionTemplate db;

	// 관리자페이지로
	@RequestMapping(value = "manager_menu.springshoppingmall", method = RequestMethod.GET)
	public String manager_menu() {
		return "/manager/manager_main";
	}

	// 관리자 상품
	@RequestMapping(value = "manager_product.springshoppingmall", method = RequestMethod.GET)
	public String manager_product() {
		return "/manager/manager_product";
	}

	// 상품등록처리
	@RequestMapping(value = "manager_product_pro.springshoppingmall", method = RequestMethod.POST)
	public String manager_product_pro(HttpServletRequest request) {

		// 업로드 될 경로
		String path = request.getServletContext().getRealPath("/client/image");
		System.out.println(path);
		// 제한 용량
		int size = 1024 * 1024 * 500;
		// 이름 변경 정책
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		try {
			MultipartRequest mr = new MultipartRequest(request, path, size, "utf-8", policy);
			
			
			// 파라미터 추출

			String product_image_file = mr.getFilesystemName("product_image_file");
			String product_name = mr.getParameter("product_name");
			String product_price = mr.getParameter("product_price");
			String product_info = mr.getParameter("product_content");
			String inputGroupSelect01 = mr.getParameter("inputGroupSelect01");
			
			
			ProductBean bean1 = new ProductBean();
			bean1.setProduct_image_file(product_image_file);
			bean1.setProduct_name(product_name);
			bean1.setProduct_info(product_info);
			bean1.setProduct_category_idx(Integer.parseInt(inputGroupSelect01));
			bean1.setProduct_price(Integer.parseInt(product_price));
			
			db.insert("manager_db.add_content", bean1);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/manager/manager_product_pro";

	}
	
	// 회원관리페이지
	@RequestMapping(value = "manager_user.springshoppingmall", method = RequestMethod.GET)
	public String manager_user(Model model,
			@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num){
			
			int min = ((page_num - 1) * 20) + 1;
			int max = min + 20 - 1;
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("min", min);
			map.put("max", max);
	
			List<BoardContentBean> list = db.selectList("manager_db.get_user_list", map);
			model.addAttribute("user_list", list);
			
			
			

			
			// 페이지 네이션 구성을 위한 데이터를 가져온다.
			int cnt = db.selectOne("manager_db.get_user_cnt");
			PageBean page_bean = new PageBean(page_num, cnt, 20, 10);
			model.addAttribute("page_bean", page_bean);
			
			model.addAttribute("page_num", page_num);
			
			return "/manager/manager_user";
	}
	
	// 회원 등급 관리
	@RequestMapping(value = "manager_user_pro.springshoppingmall", method = RequestMethod.POST)
	public String manager_user_pro(Model model,
			@RequestParam("user_grade") int user_grade,
			@RequestParam("user_idx") int user_idx) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_grade", user_grade);
		map.put("user_idx", user_idx);
		
		
		db.update("manager_db.update_grade", map);
		
		
		model.addAttribute("result","OK");
		
		return "common/result";
	}
	
		@RequestMapping(value = "manager_user_pro2.springshoppingmall", method = RequestMethod.POST)
		public String manager_user_pro2(Model model,
				@RequestParam("user_idx") int user_idx,
				@RequestParam("user_status") int user_status) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_status", user_status);
		map.put("user_idx", user_idx);
		
		db.update("manager_db.update_status", map);
		
		
		
		model.addAttribute("result","OK");
		
		return "common/result";
	}
		
		
		@RequestMapping(value = "qna.springshoppingmall", method = RequestMethod.GET)
		public String qna() {
			return "/manager/qna";
		}
		@RequestMapping(value = "qna_pro.springshoppingmall", method = RequestMethod.GET)
		public String qna_pro() {
			return "/manager/qna_pro";
		}
		@RequestMapping(value = "search.springshoppingmall", method = RequestMethod.GET)
		public String search(Model model,
				@RequestParam(value = "search_field") String search_field,
				@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num){
			
			int min = ((page_num - 1) * 8) + 1;
			int max = min + 8 - 1;
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("min", min);
			map.put("max", max);
			map.put("keyword", search_field);
			if(search_field.length() > 1) {
				
			
			
			List<ProductBean> list = db.selectList("product_db.search_list", map);
			
			model.addAttribute("search_list",list);
			
			int cnt = db.selectOne("product_db.get_search_cnt", search_field);
			if(cnt == 0){
				return "common/no_result";
			}
			PageBean page_bean = new PageBean(page_num, cnt, 20, 10);
			model.addAttribute("page_bean", page_bean);
			
			model.addAttribute("page_num", page_num);
			
			
			
			return "/manager/search";
			}else {
				return "common/no_keyword";
			}
		}
		
		
		
}
