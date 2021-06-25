package com.kh.hospital.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.common.Pagination;
import com.kh.hospital.faq.model.exception.FaqException;
import com.kh.hospital.faq.model.service.FaqService;
import com.kh.hospital.faq.model.vo.Faq;
import com.kh.hospital.faq.model.vo.Search;
import com.kh.hospital.notice.model.exception.NoticeException;

@Controller
@RequestMapping("/faq")
public class FaqController {
	@Autowired
	private FaqService fService;

	@GetMapping("/list")
	public ModelAndView faqList(ModelAndView mv, @ModelAttribute Faq faq,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = fService.selectListCount();
		

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// List<Faq> list = fService.selectList(pi);
		
		List<Faq> adList = fService.selectAdList(pi);
		
		// System.out.println(adList);

		if (/* list != null || */ adList != null ) {
			// mv.addObject("list", list);
			// mv.addObject("pi", pi);
			// mv.setViewName("faq/listPage");
			
			mv.addObject("adList", adList);
			mv.addObject("pi", pi);
			mv.setViewName("faq/listPage");
			
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	@GetMapping("/write")
	public String writePageView() {

		return "faq/writePage";
	}

	@PostMapping("/insert")
	public String fqaInsert(@ModelAttribute Faq f, HttpServletRequest request) {

		// System.out.println("faq 작성 : " + f);

		
		int result = fService.insertFaq(f);
		 
		if(result > 0) { 
			return "redirect:/faq/list"; 
		} else { 
			throw new FaqException("faq 등록에 실패하였습니다."); 
		}
	}

	@GetMapping("/detail")
	public String faqDetail(@RequestParam int fid,
							Model model) {
		
		Faq f = fService.selectFaq(fid);
		
		System.out.println(f);
		
		if(f != null) {
			model.addAttribute("faq", f);
			return "faq/detailPage";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패하였습니다");
			return "common/errorPage";
		}
	}
	
	@GetMapping("/updatePage")
	public String updatePageView(@RequestParam int fid,
							   	 Model model) {	
		
		Faq f = fService.selectFaq(fid);
		model.addAttribute("faq", f);
		
		return "faq/updatePage";
	}
	
	@PostMapping("/update")
	public String faqUpdate(@ModelAttribute Faq f,
							HttpServletRequest request) {
		
		int result = fService.updateFaq(f);
		
		if(result > 0) {
			return "redirect:/faq/list";
		} else {
			throw new FaqException("Faq 수정에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("/delete")
	public String deleteFaq(int fid, HttpServletRequest request, Model model) {
		
		int result = fService.deleteFaq(fid);
		
		if(result > 0) {
			model.addAttribute("msg", "정말 삭제하시겠습니까?");
			return "redirect:/faq/list";
		} else {
			throw new FaqException("Faq 삭제에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("/search")
	public String faqSearch(@ModelAttribute Search search, Model model, RedirectAttributes rd,
							@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = fService.searchListCount(search);
		
		if(listCount > 0) {
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// System.out.println(pi);
		
		// List<Faq> searchAdList = fService.searchList(search);
		
		List<Faq> searchAdList2 = fService.searchList2(search, pi);
		
		
		if(searchAdList2 != null) 
			
			model.addAttribute("adList", searchAdList2);
			model.addAttribute("pi", pi);
			return "faq/listPage";
			
		} else {
			rd.addFlashAttribute("msg", " 조회하신 검색어가 없습니다.");
			return "redirect:/faq/list";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
