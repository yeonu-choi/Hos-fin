package com.kh.hospital.complain.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hospital.complain.Pagination;
import com.kh.hospital.complain.exception.ComplainException;
import com.kh.hospital.complain.model.service.ComplainService;
import com.kh.hospital.complain.model.vo.CB_Reply;
import com.kh.hospital.complain.model.vo.Complain;
import com.kh.hospital.complain.model.vo.PageInfo;
import com.kh.hospital.complain.model.vo.Search;
import com.kh.hospital.member.model.vo.Member;

@Controller
@RequestMapping("/complain")
public class ComplainController {
	@Autowired
	private ComplainService cService;
	
	@GetMapping("/list")
	public ModelAndView complainList(ModelAndView mv,
									 @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = cService.selectListCount();
		//System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Complain> list = cService.selectList(pi);
		//System.out.println(list);
		
	if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("complain/complainList");
		} else {
			mv.addObject("msg", "게시글 조회에 실패하였습니다.");
			mv.setViewName("redirect:/home");
		}
		
		return mv;
	}
	
	@GetMapping("/write")
	public String writePage() {
		return "complain/complainWrite";
	}
	
	@PostMapping("/insert")
	public String complainInsert(Complain c,
								 @RequestParam(value="uploadFile") MultipartFile file,
								 HttpServletRequest request,
								 RedirectAttributes ra) {
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				c.setOriginalfileName(file.getOriginalFilename());
				c.setRenamefileName(renameFileName);
			}
		}
		
		int result = cService.insertComplain(c);
		
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "게시글이 등록되었습니다.");
			return "redirect:/complain/list";
		} else {
			throw new ComplainException("게시글 등록에 실패하였습니다.");
				
			}
			
		}
	//
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/cbuploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_" + (int)(Math.random() * 100000)
								+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
		
	}
	
	@GetMapping("/detail")
	public String complainDetail(int cbid, 
							  HttpServletRequest request,
							  HttpServletResponse response, 
							  Model model) {
		
		boolean flagcblist = false;	
		boolean flagcbid = false;
		
		Cookie[] cookies = request.getCookies();
		try {
			if(cookies != null) {
				for(Cookie ck : cookies) {
					if(ck.getName().equals("clist")) {
						flagcblist = true;
						String clist = URLDecoder.decode(ck.getValue(), "UTF-8");
						
						String[] list = clist.split(",");
						for(String st : list) {
								
							if(st.equals(String.valueOf(cbid))) flagcbid = true;
						}
						if(!flagcbid) {
								ck.setValue(URLEncoder.encode(clist + "," + cbid, "UTF-8"));
								response.addCookie(ck);								}
						} 
					}
					if(!flagcblist) {	
						Cookie ck2 = new Cookie("clist", URLEncoder.encode(String.valueOf(cbid), "UTF-8"));
						response.addCookie(ck2);
					}
				}
			} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
			}
			
			Complain c = cService.selectComplain(cbid, !flagcbid);
			
			List<CB_Reply> rlist = cService.selectReplyList(cbid);

			
			if(c != null) {
				model.addAttribute("complain", c);
				model.addAttribute("rlist", rlist);
				return "complain/complainDetail";
			} else {
				model.addAttribute("msg", "게시글 상세보기에 실패하였습니다. 목록으로 돌아갑니다.");
				return "complain/complainList";
			}
	}
	
	@GetMapping("/updatePage")
	public String complainUpdate(int cbid,
								 Model model) {
		
		Complain c = cService.selectComplain(cbid, false);
		model.addAttribute("complain", c);
		return "complain/complainUpdate";
	}
	
	@PostMapping("/update")
	public String complainUpdate(Complain c,
								 @RequestParam(value="uploadFile") MultipartFile file,
								 HttpServletRequest request) {
		
		if(!file.getOriginalFilename().equals("")) {
			if(c.getRenamefileName() != null) {
				deleteFile(c.getRenamefileName(), request);
			}
			
			String renamefileName = saveFile(file, request);
			
			if(renamefileName != null) {
				c.setOriginalfileName(file.getOriginalFilename());
				c.setRenamefileName(renamefileName);
			}
		}
		int result = cService.updateComplain(c);
		
		if(result > 0) {
			return "redirect:/complain/detail?cbid=" + c.getCbid();
		} else {
			throw new ComplainException("게시글 수정에 실패하였습니다.");
		}
	}
	
	//
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/cbuploadFiles";
		File f = new File(savePath + "/" + fileName);
		if(f.exists()) f.delete();
	}
	
	@GetMapping("/delete")
	public String delectComplain(int cbid, 
							   	 HttpServletRequest request, 
							   	 RedirectAttributes ra) {
		
		Complain c = cService.selectComplain(cbid, false);
		if(c.getRenamefileName() != null)
			deleteFile(c.getRenamefileName(), request);
		
		int result = cService.deleteComplain(cbid);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
			return "redirect:/complain/list";
		} else {
			throw new ComplainException("게시글 삭제에 실패하였습니다.");
		}
	}
	
	@GetMapping("/search")
	public String complainSearch(@ModelAttribute Search search,
								 Model model) {
			
		List<Complain> searchList = cService.searchList(search);
		model.addAttribute("list", searchList);
		
		return "complain/complainList";
		
	}
	
	@PostMapping(value="/insertReply", produces="application/json; charset=utf-8")
	public @ResponseBody String insertReply(CB_Reply r, HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String rwriter = loginUser.getUserName();
		r.setRwriter(rwriter);
		
		List<CB_Reply> rlist = cService.insertReply(r);
		
		Gson gson = new GsonBuilder().setDateFormat("yy.MM.dd").create();
		
		return gson.toJson(rlist);
	}
	
	@PostMapping(value="/deleteReply", produces="application/json; charset=utf-8")
	public void deleteReply(int rno, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		
		int result = cService.deleteReply(rno);
		
		if(result > 0) {
			out.write("confirm");
		} else {
			out.write("denied");
		}
		
		out.flush();
		out.close();
		
		
	}
	
	@PostMapping("/updateReply")
	public void modifyReply(CB_Reply r, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		System.out.println(r.getRno() + r.getRcontent());
		
		int result = cService.updateReply(r);
		JSONObject con = new JSONObject();
		
		if(result > 0) {
			con.put("rcontent", r.getRcontent());
		}
		
		out.print(con);
		out.flush();
		out.close();
	}
	
	
	
}
	
	
	

	

