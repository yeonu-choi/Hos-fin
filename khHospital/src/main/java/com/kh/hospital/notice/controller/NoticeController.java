package com.kh.hospital.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hospital.common.PageInfo;
import com.kh.hospital.common.Pagination;
import com.kh.hospital.notice.model.service.NoticeService;
import com.kh.hospital.notice.model.vo.Notice;
import com.kh.hospital.notice.model.vo.Search;
import com.kh.hospital.notice.model.exception.NoticeException;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	@GetMapping("/list")
	public ModelAndView noticeList(ModelAndView mv,
								   @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = nService.selectListCount();
		
		// System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// System.out.println(pi);
		
		// 공지사항 리스트 조회
		List<Notice> list = nService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("notice/listPage");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("/write")
	public String writePageView() {
		
		return "notice/writePage";
	}
	
	@PostMapping("/insert")
	public String noticeInsert(@ModelAttribute Notice n,
							   @RequestParam(name="uploadFile") MultipartFile file,
							   HttpServletRequest request) {
		
		System.out.println("공지사항 작성 내용 : " + n );
		System.out.println("업로드 된 파일명 : " + file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) {
			// 파일업로드 안했을때
			String saveFile = saveFile(file, request);
			
			if(saveFile != null) {
				n.setNfile("/nuploadFiles/" + file.getOriginalFilename());
			}
		}
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:/notice/list";
		} else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}
	}
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
		
		System.out.println("savaPath : " + savePath);
		
		File folder = new File(savePath);
		
		if(!folder.exists()) 
			folder.mkdirs();
		
		String nfile = folder + "\\" + file.getOriginalFilename();
		
		try {
			file.transferTo(new File(nfile));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 저장 에러 : " + e.getMessage());
			nfile = null;
		}
		
		return nfile;
	}
	
	@GetMapping("/detail")
	public String noticeDetail(@RequestParam int nid,
								HttpServletRequest request,
								HttpServletResponse response,
							    Model model) {
		
		// Notice n = nService.selectNotice(nid);
		
		boolean flagnlist = false; 	
		boolean flagnid = false;	
		
		Cookie[] cookies = request.getCookies();
		try {
			if(cookies != null) {
				for(Cookie c : cookies) {
					if(c.getName().equals("nlist")) {
						flagnlist = true;
							String nlist = URLDecoder.decode(c.getValue(), "UTF-8");
						String[] list = nlist.split(",");
						for(String st : list) {
							if(st.equals(String.valueOf(nid))) flagnid = true;
						}
						if(!flagnid) {	
							c.setValue(URLEncoder.encode(nlist + "," + nid, "UTF-8"));
							response.addCookie(c); 	
						}
					}
				}
				if(!flagnlist) {
					Cookie c1 = new Cookie("nlist", URLEncoder.encode(String.valueOf(nid), "UTF-8"));
					response.addCookie(c1); 
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Notice n = nService.selectNotice(nid, !flagnid);
		
		// System.out.println("notice: " + n);
		
		if(n != null) {
			model.addAttribute("notice", n);
			return "notice/detailPage";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패하였습니다");
			return "common/errorPage";
		}
	}
	
	@GetMapping("/updatePage")
	public String updatePageView(@RequestParam int nid,
							     Model model) {
		Notice n = nService.selectNotice(nid);
		model.addAttribute("notice", n);
		return "notice/updatePage";
	}
	
	@PostMapping("/update")
	public String noticeUpdate(@ModelAttribute Notice n,
							   @RequestParam(value="uploadFile") MultipartFile file,
							   HttpServletRequest request) {
		
		if(!file.getOriginalFilename().equals("")) {
			if(n.getNfile() != null) {
				deleteFile(n.getNfile(), request);
			}
			
			String saveFile = saveFile(file, request);
			
			if(saveFile != null) 
				n.setNfile("/nuploadFiles/" + file.getOriginalFilename());
		}
		
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			return "redirect:/notice/list";
		} else {
			throw new NoticeException("공지사항 수정에 실패하였습니다.");
		}
		
	}
	
	public void deleteFile(String nfile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		File deleteFile = new File(root + nfile);
		
		if(deleteFile.exists())
			deleteFile.delete();
	}
	
	@GetMapping("/delete")
	public String noticeDelete(int nid, HttpServletRequest request, Model model) {
		Notice n = nService.selectNotice(nid);
		int result = nService.deleteNotice(nid);
		
		if(n.getNfile() != null) {
			deleteFile(n.getNfile(), request);
		}
		
		if(result > 0) {
			model.addAttribute("msg","정말 삭제하시겠 습니까?");
			return "redirect:/notice/list";			
		} else {
			throw new NoticeException("공지사항 삭제에 실패하였습니다.");
		}
		
	}
	
	
	@GetMapping("/search")
	public String noticeSearch(@ModelAttribute Search search,
							   RedirectAttributes rd,
							   Model model,
							   @RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = nService.searchListCount(search);
		
		if(listCount > 0) {
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Notice> searchList = nService.searchList(search, pi);
			
			if(searchList != null) 
				
				model.addAttribute("list", searchList);
				model.addAttribute("pi", pi);
				return "notice/listPage";
				
			} else {
				rd.addFlashAttribute("msg", "조회하신 검색이 목록에 없습니다.");
				return "redirect:/notice/list";
		
		
		}	
	}
	
	

	
	
	
	
	
	
	
}
