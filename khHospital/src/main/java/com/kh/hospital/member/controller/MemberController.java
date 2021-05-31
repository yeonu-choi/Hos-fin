package com.kh.hospital.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hospital.member.model.service.MemberService;
import com.kh.hospital.member.model.vo.Coolsms;
import com.kh.hospital.member.model.vo.Member;


@Controller
@SessionAttributes({"loginUser"})
@RequestMapping("/member")
public class MemberController {

	@Inject
	JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService mService;
	
	@GetMapping("/joinPage1")
	public String joinPage1() {
		return "member/join1";
	}
	
	@GetMapping("/joinPage2")
	public String joinPage2(@RequestParam("type") String jType, Model model) {
			model.addAttribute("type", jType);
			return "member/join2";
	}
	
	@GetMapping("/joinPage3")
	public String joinPage3(@RequestParam(value="type") String jType, Model model) {
		if(jType.equals("mail")) {
			return "member/join4";
		} else {
			return "member/join3";
		}
	}
	
	@GetMapping("/confirm")
	public String confirm() {
		return "member/confirmPage";
	}
	
	@ResponseBody
	   @RequestMapping(value = "confirmPage", method = RequestMethod.POST)
	     public JSONObject sendSms(HttpServletRequest request) throws Exception {

	       String api_key = "NCSOLTIA7S53CHBO";
	       String api_secret = "EETOAL0L5KDXBUG0OWUT6B0MJUOHAFDB";

	       Coolsms coolsms = new Coolsms(api_key, api_secret);
	       
	       HashMap<String, String> set = new HashMap<String, String>();
	      
	       String p = (String)request.getParameter("phone");
	       Member m = mService.phoneCheck(p);
	       JSONObject result = new JSONObject();

	       if(m != null) {
	    	   result.put("duplicate", "중복");
	       } else {
	    	   set.put("to", p);
		       set.put("from", "01073561267");
		       set.put("text", "인증번호 ["+(String)request.getParameter("realNo")+"] 입력시 인증 처리됩니다");
		       set.put("type", "sms");
		       
		       System.out.println(set);

		       JSONObject resultCode = coolsms.send(set);

		       if ((boolean)resultCode.get("status") == true) {
		         System.out.println("성공");
		         System.out.println(resultCode.get("result_message"));
		         result.put("success", "성공");
		       } else {
		         System.out.println("실패");
		         System.out.println(resultCode.get("code"));
		         System.out.println(resultCode.get("message"));
		         result.put("fail", "실패");
		       }
	       }
	       
	       return result;
	     }
	
	
    @RequestMapping(value = "/sendMail" , method=RequestMethod.POST )
    public ModelAndView mailSending(HttpServletRequest request, String email, String userName,
    								HttpServletResponse response_email) throws IOException {

    	ModelAndView mv = new ModelAndView();
    	
    	Member m = mService.emaiiCheck(email);
    	
    	if(m == null) {
    		Random r = new Random();
            int verifyNo = r.nextInt(458936) + 135792;
            
            String setfrom = "khhospital16@gamil.com";
            String tomail = email;
            String title = "KH대학병원 회원가입 인증 이메일 입니다.";
            String content =
            System.getProperty("line.separator")+  
            System.getProperty("line.separator")+
                    
            "안녕하세요 회원님 저희 KH 대학병원을 찾아주셔서 감사합니다."
            
            +System.getProperty("line.separator")+         
            System.getProperty("line.separator")+

            " 인증번호는 " +verifyNo+ " 입니다. "
            
            +System.getProperty("line.separator")+
            System.getProperty("line.separator")+
            
            "받으신 인증번호를 홈페이지에 입력해 주시면 인증 완료됩니다.";

            try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                        true, "UTF-8");

                messageHelper.setFrom(setfrom); 
                messageHelper.setTo(tomail); 
                messageHelper.setSubject(title); 
                messageHelper.setText(content);
                
                mailSender.send(message);
            } catch (Exception e) {
                System.out.println(e);
            }
            
            mv.setViewName("/member/confirmPage2"); 
            mv.addObject("verifyNo", verifyNo);
            mv.addObject("userName", userName);
            mv.addObject("email", email);

            response_email.setContentType("text/html; charset=UTF-8");
            PrintWriter out_email = response_email.getWriter();
            out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
            out_email.flush();
    	} else {
    		mv.setViewName("/member/confirmPage2");
    		mv.addObject("msg", "이미 가입된 이메일 주소입니다.");
    	}
 
        return mv;   
    }

	@RequestMapping("/confirm2")
	public String confirm2() {
	    return "member/confirmPage2";
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String userId) {
        int count = 0;
        
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        Member m = mService.idCheck(userId);
        
        if(m!= null) {
        	count = 1;
        }
        
        map.put("cnt", count);
 
        return map;
    }
	
	@PostMapping("/insert")
	public String memberInsert(@ModelAttribute Member m,
							@RequestParam("year") String year,
							@RequestParam("month") String month,
							@RequestParam("days") String days,
							Model model, RedirectAttributes rd) {
		
		String mon = "";
		String day = "";
		
		if(Integer.parseInt(month)<10 && Integer.parseInt(days)<10) {
			mon = "0"+ month;
			day = "0"+ days;
			m.setBirth(year + mon + day);
		} else if(Integer.parseInt(month)<10 && Integer.parseInt(days)>10) {
			mon = "0"+ month;
			m.setBirth(year + mon + days);
		} else if(Integer.parseInt(days)<10 && Integer.parseInt(month)>10) {
			day = "0"+ days;
			m.setBirth(year + month + day);
		} else {
			m.setBirth(year + month + days);
		}
		
		m.setUserPwd(bcryptPasswordEncoder.encode(m.getUserPwd()));
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원 가입이 완료되었습니다. 로그인 해주세요.");
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			return "member/join1";
		}
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "/member/loginPage";
	}
	
	@PostMapping("/login")
	public String memberlogin(@ModelAttribute Member m, Model model) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return "/member/loginPage";
		}
	}
	
	@GetMapping("/logout")
	public String memberLogout(SessionStatus ss) {
		ss.setComplete();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/gLogin", method = RequestMethod.POST)
	public String googleLogin(Member m, Member mvo, Model model) throws Exception{
		Member returnVO = mService.loginMemberByGoogle(m);
		String mvo_id = mvo.getUserId(); 
		//System.out.println("db에서 가져온 member "+ m);
		//System.out.println("ajax에서 가져온 id "+ mvo_id);
		
		if(returnVO == null) {
			mService.joinMemberByGoogle(m);				
			returnVO = mService.loginMemberByGoogle(m);		
			model.addAttribute("loginUser", returnVO);
		} else {
			mService.loginMemberByGoogle(m);		
			model.addAttribute("loginUser", returnVO);
		}

		return "redirect:/";
	}
	
}

