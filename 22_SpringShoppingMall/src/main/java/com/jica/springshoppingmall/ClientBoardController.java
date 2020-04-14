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

import com.jica.springshoppingmall.beans.BoardCategoryBean;
import com.jica.springshoppingmall.beans.BoardContentBean;
import com.jica.springshoppingmall.beans.PageBean;
import com.jica.springshoppingmall.beans.UserBean;

@Controller
//login_bean은 세션에 저장할 이름으로 지정한다
@SessionAttributes("login_bean")
public class ClientBoardController {
	
	// DAO Bean을 주입받는다.(자동 주입)
	@Autowired
	private SqlSessionTemplate db;

	// 메인화면 = > 게시판으로 가는 페이지 컨트롤러
	@RequestMapping(value = "board_main.springshoppingmall", method = RequestMethod.GET)
	public String board_main(Model model) {
		
		List<BoardCategoryBean> board_category_list = db.selectList("board_db.board_info");		
		model.addAttribute("board_category_list", board_category_list);
		
		return "client/board/board_main";
	}
	
	// 게시판 메인화면 = > 게시판 리스트들 가져오는 컨트롤러
	@RequestMapping(value = "board_main_list.springshoppingmall", method = RequestMethod.GET)
	public String board_main_list(Model model,
			
			@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
            @RequestParam(value = "board_category_idx") int board_category_idx) {
			
			// 페이지 네이션 설정
			int min = ((page_num - 1) * 20) + 1;
			int max = min + 20 - 1;
			
			// 페이지 네이션 구성을 위한 데이터를 가져온다.
			int cnt = db.selectOne("board_db.board_cnt");
			PageBean page_bean = new PageBean(page_num, cnt, 20, 10);
			model.addAttribute("page_bean", page_bean);
			model.addAttribute("page_num", page_num);

			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("min", min);
			map.put("max", max);
			map.put("board_category_idx", board_category_idx);
		
			// 글 리스트 가져오기 쿼리문 
			List<BoardContentBean> list = db.selectList("board_db.board_list", map);
			model.addAttribute("board_list", list);
			
			// 게시판 이름 가져오기 쿼리문
			BoardCategoryBean bean = db.selectOne("board_db.board_info_name", board_category_idx);

			model.addAttribute("board_category_bean", bean);
			model.addAttribute("board_category_idx", board_category_idx);
		
		return "client/board/board_main_list";
	}
	
	// 글 보기
	@RequestMapping(value = "board_read.springshoppingmall", method = RequestMethod.GET)
	public String board_read(Model model,
			
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "board_category_idx") int board_category_idx,
		@RequestParam(value = "board_content_idx") int board_content_idx)	{

		BoardCategoryBean bean = db.selectOne("board_db.board_info_name", board_category_idx);
		
		model.addAttribute("page_num", page_num);
		model.addAttribute("board_category_bean", bean);
		model.addAttribute("board_category_idx", board_category_idx);
		model.addAttribute("board_content_idx", board_content_idx);
		
		// 게시글 내용 가져오기
		BoardContentBean bean2 = db.selectOne("board_db.board_info_list", board_content_idx);
		
		model.addAttribute("get_board_info_list", bean2);
		
		
		return "client/board/board_read";
	}

	// 글쓰기버튼 = > 글쓰기 페이지 넘어가는 페이지 
	@RequestMapping(value = "board_write.springshoppingmall", method = RequestMethod.GET)
	public String board_write(Model model,
			
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "board_category_idx") int board_category_idx) {

		BoardCategoryBean bean = db.selectOne("board_db.board_info_name", board_category_idx);
		
		model.addAttribute("board_category_bean", bean);
		model.addAttribute("page_num", page_num);
		model.addAttribute("board_category_idx", board_category_idx);
		
		return "client/board/board_write";
	}
	
	// 글쓰기 페이지 작성완료 처리 페이지 
	@RequestMapping(value = "board_write_pro.springshoppingmall", method = RequestMethod.POST)
	public String board_write_pro(Model model, BoardContentBean board_content_bean,
			
		@ModelAttribute("login_bean") UserBean login_bean,
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "board_category_idx") int board_category_idx) {
		
		board_content_bean.setBoard_writer_idx(login_bean.getUser_idx());
		
		db.update("board_db.add_content", board_content_bean);
		
		model.addAttribute("result", "OK");
		model.addAttribute("page_num", page_num);
		model.addAttribute("board_category_idx", board_category_idx);
		model.addAttribute("board_content_idx", board_content_bean.getBoard_content_idx());
		
		int board_content_idx = db.selectOne("board_db.board_content_idx");
		
		model.addAttribute("board_content_idx", board_content_idx);
		
		return "client/board/board_write_pro";

	}
	
	// 수정하기
	@RequestMapping(value = "board_modify.springshoppingmall", method = RequestMethod.GET)
	public String board_modify(Model model,

		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "board_category_idx") int board_category_idx,
		@RequestParam(value = "board_content_idx") int board_content_idx) {

		BoardCategoryBean bean = db.selectOne("board_db.board_info_name", board_category_idx);

		model.addAttribute("board_category_bean", bean);
		model.addAttribute("page_num", page_num);
		model.addAttribute("board_category_idx", board_category_idx);
		
		// 수정하기전 게시글 내용 가져오기
		BoardContentBean bean2 = db.selectOne("board_db.board_info_list", board_content_idx);
		model.addAttribute("board_info_list", bean2);
		

		return "client/board/board_modify";
	}
	
	// 수정하기 확인 처리 프로그램
	@RequestMapping(value = "board_modify_pro.springshoppingmall", method = RequestMethod.POST)
	public String board_modify_pro(Model model, BoardContentBean board_content_bean,
			
	@ModelAttribute("login_bean") UserBean login_bean,
	@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
	@RequestParam(value = "board_category_idx") int board_category_idx,
	@RequestParam(value = "board_content_idx") int board_content_idx) {
		
		
		db.update("board_db.board_content_modify", board_content_bean);
		
		model.addAttribute("result", "OK");
		model.addAttribute("page_num", page_num);
		model.addAttribute("board_category_idx", board_category_idx);
		model.addAttribute("board_content_idx", board_content_bean.getBoard_content_idx());
		
		return "common/result";

	}	
	
	// 삭제하기
	@RequestMapping(value = "board_delete.springshoppingmall", method = RequestMethod.GET)
	public String board_delete(Model model,BoardContentBean BoardContentBean,
		
		@ModelAttribute("login_bean") UserBean login_bean,
		@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
		@RequestParam(value = "board_category_idx") int board_category_idx) {
	
		BoardContentBean.setBoard_writer_idx(login_bean.getUser_idx());
		
		db.delete("board_db.board_content_delete", BoardContentBean);
		
		model.addAttribute("page_num", page_num);
		model.addAttribute("board_category_idx", board_category_idx);
		
	
		
		return "client/board/board_delete";
	}
	
}
















