package com.kh.hospital.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.member.model.vo.Member;
import com.kh.hospital.mypage.Pagination;
import com.kh.hospital.mypage.model.service.myPageService;
import com.kh.hospital.mypage.model.vo.PageInfo;

@Controller
@SessionAttributes({"loginUser"})
@RequestMapping("/mypage")
public class mypageController {

	@Autowired
	private myPageService myService;
	
	// 마이페이지
	@GetMapping("/modify")
	public String myPageView() {
		return "mypage/modify";
	}
		
	// 비밀번호 변경
	@GetMapping("/pwdUpdate")
	public String pwdUpdateView() {
		return "mypage/pwdUpdate";
	}
	
	@RequestMapping(value="/pwdUpdate")
	public @ResponseBody String pwdUpdate(String userPwd, String newPwd,
										  SessionStatus ss,
										  HttpSession session,
										  Model model) {
		
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
	
		String pwdConfirm = "";
		
		Member m = (Member)session.getAttribute("loginUser");
		
		if(pe.matches(userPwd, m.getUserPwd())) {
			m.setUserPwd(pe.encode(newPwd));
			int result = myService.pwdUpdate(m);
			
			if(result > 0) {
				pwdConfirm = "confirm";
				ss.setComplete();
			} else {
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다.");
			}	
		} else {
			pwdConfirm = "denied";
		} 
		return pwdConfirm;
	}
	

	@PostMapping("/update")
	public String memberUpdate(@ModelAttribute("loginUser") Member m,
							   RedirectAttributes rd,
							   Model model) {
		
		int result = myService.updateMember(m);
			
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원 정보가 수정되었습니다.");
			return "redirect:/mypage/modify";
		} else {
			model.addAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			return "redirect:/mypage/modify";
			}
			
		}
	
	//탈퇴
	@RequestMapping(value="/delete")
	public String deleteMember(@ModelAttribute("loginUser") Member m,
							   SessionStatus ss,
 							   RedirectAttributes rd,
 							   Model model) {
		
		int result = myService.deleteMember(m.getUserId());
		
		if(result > 0) {
			ss.setComplete();
			rd.addFlashAttribute("msg", "회원 탈퇴가 완료되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다.");
			return "redirect:/mypage/modify";
		}
	}
	
	//상담
	@GetMapping("/counsel")
	public ModelAndView counselList(@ModelAttribute("loginUser") Member m,
									HttpSession session,
									ModelAndView mv,
									RedirectAttributes ra,
									@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int listCount = myService.selectListCount(userId);
	
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Counsel> list = myService.selectList(pi, userId);
		
		System.out.println(list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/counsel");
		} else {
			ra.addFlashAttribute("msg", "목록 조회에 실패했습니다.");
			mv.setViewName("redirect:/");
		}
		
		return mv;
		
	}
	
	//예약
	@GetMapping("/reservation")
	public ModelAndView reservation(@ModelAttribute("loginUser") Member m,
									  HttpSession session,
									  ModelAndView mv,
									  RedirectAttributes ra,
									  @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		System.out.println(userId);
		
		int listCount = myService.selectoListCount(userId);
		System.out.println(listCount);
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<OnlineAppointment> onlist = myService.selectoList(pi, userId);
		
		if(onlist != null) {
			mv.addObject("onlist", onlist);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/reservation");
		} else {
			ra.addFlashAttribute("msg", "목록 조회에 실패했습니다.");
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@GetMapping("/reservation/cancel")
	public String onlineUpdate(int aid, RedirectAttributes rd) {
		int result = myService.updateOnline(aid);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "예약 취소하셨습니다.");
		} else {
			rd.addFlashAttribute("msg", "예약 취소에 실패하셨습니다.");
		}
		
		return "redirect:/mypage/reservation";
	}
	

	
		
}
