package com.kh.hospital.appointment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.hospital.appointment.model.service.AppointmentService;
import com.kh.hospital.appointment.model.vo.Department;
import com.kh.hospital.appointment.model.vo.Doctor;
import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.appointment.model.vo.QuickAppointment;
import com.kh.hospital.compliment.Pagination;
import com.kh.hospital.common.model.vo.PageInfo;
import com.kh.hospital.member.model.vo.Member;

@Controller
@RequestMapping("/appoint")
public class AppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppointmentController.class);
	
	@Autowired
	private AppointmentService aService;
	
	// 예약 안내페이지 이동
	@GetMapping("/info")
	public String infoPage(){
		return "appointment/infoPage";
	}
	
	// 빠른 예약 페이지로 이동
	@GetMapping("/quick")
	public String quickPage() {
		return "appointment/quickPage";
	}
	
	// 빠른 예약 등록
	@PostMapping("/quick/insert")
	public String quickInsert(@ModelAttribute QuickAppointment qa, Model m, RedirectAttributes rd) {
		int result = aService.insertQuick(qa);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "예약에 성공하였습니다.");
			return "redirect:/appoint/quick";
		} else {
			m.addAttribute("msg", "예약에 실패하였습니다.");
			return "appointment/quickPage";
		}
	}
	
	// 빠른 예약 조회 페이지로 이동
	@GetMapping("/quick/search")
	public String quickSearchPage(Model m){
		return "appointment/quickSearchPage";
	}
	
	// 빠른 예약 조회 
	@GetMapping("/quick/list")
	public String quickList(@ModelAttribute QuickAppointment qa, @RequestParam(value="page", required=false, defaultValue="1") int currentPage, 
							 Model m, RedirectAttributes rd){
		
		int listCount = aService.quickListCount(qa);
		
		if(listCount > 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<QuickAppointment> qalist = aService.selectQuickList(qa, pi);
			
			if(qalist != null)
				m.addAttribute("qalist", qalist);
				m.addAttribute("pi", pi);
				return "appointment/quickListPage";
				
		} else { 
			rd.addFlashAttribute("msg", "입력하신 정보에 대한 예약건이 없습니다."); 
			return "redirect:/appoint/quick/search"; 
		}
		
	}
	
	// 빠른 예약 취소
	@GetMapping("/quick/update")
	public String quickUpdate(int qid, RedirectAttributes rd) {
		
		int result = aService.updateQuick(qid);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "예약 취소하셨습니다.");
		} else {
			rd.addFlashAttribute("msg", "예약 취소에 실패하셨습니다.");
		}
		
		return "redirect:/appoint/quick/search";
	}
	
	// 온라인 예약 페이지로 이동
	@GetMapping("/online")
	public String onlinePage(Model m) {
		List <Department> deptList = aService.selectDeptList();
		m.addAttribute("deptList", deptList);
		return "appointment/onlinePage";
	}
	
	// 의사 목록 가져오기
	@GetMapping(value="/doctor", produces="application/json; charset=utf-8")
	@ResponseBody
	public String doctorList(int did) {
		List<Doctor> dlist = aService.selectDoctorList(did);	// 선택되어있을 때 
		return new Gson().toJson(dlist);
	}
	
	// 온라인 예약 페이지2로 이동
	@GetMapping("/online2")
	public String onlinePage2(OnlineAppointment o, Doctor d, Model m) {
		o.setDeptName(aService.searchDepartment(o.getDid()));
		d.setUserName(o.getDname());
		Doctor doctor = aService.selectDoctor(d);
		
		String dOff = doctor.getDayOff();
		
		//List<String> dayOff = new ArrayList<>();
		List<Integer> dayOff= new ArrayList<>();
		
		if(dOff.contains(",")) {
			String[] dayOffarr = dOff.split(",");
			for(String doa : dayOffarr) {
				dayOff.addAll(getDayOff(doa));
			}
		} else {
			dayOff = getDayOff(dOff);
		}
		
		m.addAttribute("dayOff", dayOff);
		m.addAttribute("o", o);
		return "appointment/onlinePage2";
	}
	
	public List<Integer> getDayOff(String dOff){
		//List<LocalDate> dayOff = new ArrayList<>();
		//List<String> dayOff = new ArrayList<>();
		List<Integer> dayOff= new ArrayList<>();
		
		int day = 0;
		//LocalDate day = null;
		
		switch(dOff) {
		case "일" :
			day = 0;
			break;
		case "월" : 
			day = 1;
			break;
		case "화" : 
			day = 2;
			break;
		case "수" : 	 
			day = 3;
			break;
		case "목" : 
			day = 4;
			break;
		case "금" : 
			day = 5;
			break;
		case "토" : 
			day = 6;
			break;
		}
		/*
		 day = LocalDate.now().with(TemporalAdjusters.next(DayOfWeek.SATURDAY));
		 
		 String sDay = null;
		
		for(int i = 0; i < 13; i++) {
			sDay = day.plusDays(7*i).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			dayOff.add(sDay);
		}*/
		dayOff.add(day);
			
		return dayOff;
	}
	
	// 시간 가져오기
	@GetMapping(value="/time", produces="application/json; charset=utf-8")
	@ResponseBody
	public String timeList(OnlineAppointment o) {
		List<OnlineAppointment> tlist = aService.selectTimeList(o); 
		return new Gson().toJson(tlist);
	}
	
	// 온라인 예약 등록
	@PostMapping("/online/insert")
	public String onlineInsert(OnlineAppointment o, RedirectAttributes rd, Model m) {
		int result = aService.insertOnline(o);
		
		if(result > 0) {
			m.addAttribute("msg", "예약에 성공했습니다.");
			m.addAttribute("o", o);
			return "appointment/onlinePage3";
		} else {
			rd.addFlashAttribute("msg", "예약에 실패했습니다.");
			return "redirect://";
		}
	}
	
	
	
	// 온라인 예약 내역 조회
	@GetMapping("/online/list")
	public String onlineList(@RequestParam(value="page", required=false, defaultValue="1") int currentPage
							, HttpServletRequest request, Model m) {
		String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
		
		int listCount = aService.onlineListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<OnlineAppointment> oalist = aService.selectOnlineList(userId, pi);
		
		m.addAttribute("oalist", oalist);
		m.addAttribute("pi", pi);
		
		return "appointment/onlineListPage";
	}
	
	// 온라인 예약 취소
	@GetMapping("/online/update")
	public String onlineUpdate(int aid, RedirectAttributes rd) {
		int result = aService.updateOnline(aid);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "예약 취소하셨습니다.");
		} else {
			rd.addFlashAttribute("msg", "예약 취소에 실패하셨습니다.");
		}
		
		return "redirect:/appoint/online/list";
	}
	
	
}
