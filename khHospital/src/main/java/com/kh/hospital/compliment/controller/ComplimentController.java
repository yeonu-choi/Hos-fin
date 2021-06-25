package com.kh.hospital.compliment.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.hospital.compliment.Pagination;
import com.kh.hospital.common.model.vo.PageInfo;
import com.kh.hospital.compliment.model.exception.ComplimentException;
import com.kh.hospital.compliment.model.service.ComplimentService;
import com.kh.hospital.compliment.model.vo.Attachment;
import com.kh.hospital.compliment.model.vo.Compliment;
import com.kh.hospital.compliment.model.vo.Good;
import com.kh.hospital.compliment.model.vo.Reply;
import com.kh.hospital.compliment.model.vo.Search;
import com.kh.hospital.member.model.vo.Member;

@Controller
@RequestMapping("/compliment")
public class ComplimentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComplimentController.class);
	
	@Autowired
	private ComplimentService cService;
	
	// 칭찬 게시판 목록
	@GetMapping("/list")
	public String complimentList(@RequestParam(value="page", required=false, defaultValue="1") int currentPage, Model m){
		
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Compliment> clist = cService.selectList(pi);
		List<Compliment> tlist = new ArrayList<>();
		if(clist.size() > 3) {
			tlist = cService.selectTopList();
		}
		// logger.info(clist.toString());
		
		if(clist != null) {
			m.addAttribute("tlist", tlist);
			m.addAttribute("clist", clist);
			m.addAttribute("pi",pi);
		}
		return "compliment/listPage";
		/*
			 * else {
			 *  에러페이지 생성?
			 * return }
			 */
	}
	
	// 칭찬 게시글 등록 페이지로 이동
	@GetMapping("/insertPage")
	public String complimentWritePage() {
		return "compliment/writePage";
	}
	
	// 칭찬 게시글 등록
	@PostMapping("/insert")
	public String complimentInsert(@ModelAttribute Compliment c,
								   @RequestParam(value="uploadFile1") MultipartFile file1,
								   @RequestParam(value="uploadFile2") MultipartFile file2,
								   HttpServletRequest request, RedirectAttributes rd, HttpSession session){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		c.setUserId(loginUser.getUserId());
		
		Attachment a1 = new Attachment();
		Attachment a2 = new Attachment();
		
		if(!file1.getOriginalFilename().equals("")) {
			String changeName = saveFile(file1, request);
			if(changeName != null) {
				a1.setOriginName(file1.getOriginalFilename());
				a1.setChangeName(changeName);
			}
		}
		
		if(!file2.getOriginalFilename().equals("")) {
			String changeName = saveFile(file2, request);
			if(changeName != null) {
				a2.setOriginName(file2.getOriginalFilename());
				a2.setChangeName(changeName);
			}
		}
		
		int result = cService.insertCompliment(c, a1, a2);
		
		if( result > 0) {
			rd.addFlashAttribute("msg", "게시글 등록에 성공했습니다.");
		}else {
			rd.addFlashAttribute("msg", "게시글 등록에 실패했습니다.");
		}
		return "redirect:/compliment/list";
		
	}
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/image");
		String savePath = root + "\\cuploadFile";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_" + (int)(Math.random() * 100000) + "_"
											+ originalFileName.substring(originalFileName.lastIndexOf("."));
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 실패" + e.getMessage());
		}
		return renameFileName;
	}
	
	// 칭찬 게시글 상세보기
	@GetMapping("/detail")
	public String complimentDetail(int cno,
								   HttpServletRequest request, HttpServletResponse response,
								   HttpSession session, Model m) {
		
		boolean flagclist = false;
		boolean flagcno = false;
		
		Cookie[] cookies = request.getCookies();
		try {
			if(cookies != null) {
				for(Cookie c: cookies) {
					if(c.getName().equals("clist")) {
						flagclist = true;
						String clist = URLDecoder.decode(c.getValue(), "UTF-8");
						String [] list = clist.split(",");
						for(String st : list) {
							if(st.equals(String.valueOf(cno))) flagcno = true;
						}
						if(!flagcno) {
							c.setValue(URLEncoder.encode(clist+"," + cno, "UTF-8"));
							response.addCookie(c);
						}
					} 
				}
				if(!flagclist) {
					Cookie c1 = new Cookie("clist", URLEncoder.encode(String.valueOf(cno), "UTF-8"));
					response.addCookie(c1);
				}
			}
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// flagcno = true면 읽었던 게시판, flagcno = false면 읽지 않은 게시판
		// !flagcno = true면 조회수 증가, !flagcno = false면 조회수 증가 X
		Compliment c = cService.selectCompliment(cno, !flagcno);
		c.setCcontent(c.getCcontent().replace("\n", "<br>"));
		
		List<Attachment> alist = cService.selectAttachment(cno); 
		
		int check = 0;
		Good g = new Good();
		
		if((Member)session.getAttribute("loginUser") != null) {
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			
			g.setUserId(userId);
			g.setCno(cno);
			
			check = cService.goodCheck(g);
		}
		
		List<Reply>	rlist = cService.selectReplyList(cno);
		
		if(c != null) {
			m.addAttribute("c", c);
			m.addAttribute("alist", alist);
			m.addAttribute("check", check);
			m.addAttribute("rlist", rlist);
			return "compliment/detailPage";
		} else {
			return "redirect:/compliment/list";
		}
	}
	
	// 칭찬 게시글 수정 페이지로 이동
	@GetMapping("/updatePage")
	public String complimentUpdatePage(int cno, Model m) {
		Compliment c = cService.selectCompliment(cno, false);
		List<Attachment> alist = cService.selectAttachment(cno);
		m.addAttribute("c", c);
		m.addAttribute("alist", alist);
		return "compliment/updatePage";
	}
	
	// 칭찬 게시글 수정
	@PostMapping("/update")
	public String complimentUpdate(@ModelAttribute Compliment c,
								   @RequestParam(value="uploadFile1") MultipartFile file1,
								   @RequestParam(value="uploadFile2") MultipartFile file2,
								   HttpSession session, HttpServletRequest request, RedirectAttributes rd) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		c.setUserId(loginUser.getUserId());
		
		Attachment a1 = new Attachment();
		Attachment a2 = new Attachment();
		
		if(!file1.getOriginalFilename().equals("") || !file2.getOriginalFilename().equals("")) {
			List<Attachment> alist = cService.selectAttachment(c.getCno());
			for(Attachment a : alist) {
				deleteFile(a.getChangeName(), request);
			}
			
			if(!file1.getOriginalFilename().equals("")) {
				String changeName = saveFile(file1, request);
				if(changeName != null) {
					a1.setOriginName(file1.getOriginalFilename());
					a1.setChangeName(changeName);
					a1.setCno(c.getCno());
				}
			}
			
			if(!file2.getOriginalFilename().equals("")) {
				String changeName = saveFile(file2, request);
				if(changeName != null) {
					a2.setOriginName(file2.getOriginalFilename());
					a2.setChangeName(changeName);
					a2.setCno(c.getCno());
				}
			}
		}
		
		int result = cService.updateCompliment(c, a1, a2, c.getCno());
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "게시글 수정에 성공했습니다.");
			return "redirect:/compliment/detail?cno=" + c.getCno();
		} else {
			rd.addFlashAttribute("msg", "게시글 수정에 실패했습니다.");
			return "redirect:/compliment/list";
		}
	}
	
	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/image");
		String savePath = root + "\\cuploadFile";
		File file = new File(savePath + "\\" + fileName);
		if(file.exists()) file.delete();
	}
	
	
	// 칭찬 게시글 삭제
	@GetMapping("/delete")
	public String complimentDelete(int cno, HttpServletRequest request, RedirectAttributes rd) {
		List<Attachment> alist = cService.selectAttachment(cno);
		for(Attachment a : alist) {
			deleteFile(a.getChangeName(), request);
		}
		
		int result = cService.deleteCompliment(cno);
		
		if(result > 0 ) {
			rd.addFlashAttribute("msg", "게시글 삭제에 성공했습니다.");
		} else {
			rd.addFlashAttribute("msg", "게시글 삭제에 실패했습니다.");
		}
		return "redirect:/compliment/list";
	}
	
	// 칭찬 게시판 검색
	@GetMapping("/search")
	public String complimentSearch(Search s, @RequestParam(value="page", required=false, defaultValue="1") int currentPage, Model m) {
		int listCount = cService.selectSearchCount(s);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Compliment> clist = cService.searchCompliment(s, pi);
		m.addAttribute("clist", clist);
		m.addAttribute("pi", pi);
		return "compliment/listPage";
	}
	
	// 좋아요 클릭
/*	@PostMapping(value="/good", produces="application/json; charset=utf-8")
	@ResponseBody
	public String goodClick(Good g) throws IOException {
		int check = cService.goodCheck(g);
		int result = 0;
		if(check > 0) {
			result = cService.goodDown(g);
		} else {
			result = cService.goodUp(g);
		}
		int count = cService.selectGoodCount(g.getCno());
		check = cService.goodCheck(g);
		int[] cc = { count, check };
		return new Gson().toJson(cc);
	}*/
	
	@RequestMapping("/good")
	@ResponseBody
	public HashMap<String, Object> goodClick(@RequestBody Good g) throws IOException {
		int check = cService.goodCheck(g);
		int result = 0;
		if(check > 0) {
			result = cService.goodDown(g);
		} else {
			result = cService.goodUp(g);
		}
		int count = cService.selectGoodCount(g.getCno());
		check = cService.goodCheck(g);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", count);
		map.put("check", check);
		return map;	
		
	}
	
	
	// 댓글 작성
	@PostMapping(value="/reply/insert", produces="application/json; charset=utf-8")
	@ResponseBody
	public String replyInsert(Reply r) {
		List<Reply> rlist = cService.insertReply(r);
		return new Gson().toJson(rlist);
	}
	
	// 댓글 수정
	@PostMapping(value="/reply/update", produces="application/json; charset=utf-8")
	@ResponseBody
	public String replyUpdate(Reply r) {
		List<Reply> rlist = cService.updateReply(r);
		return new Gson().toJson(rlist);
	}
	
	// 댓글 삭제
	@PostMapping(value="/reply/check", produces="application/json; charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> replyCheck(Reply r) {
		int result = cService.checkReply(r);
		HashMap<String, Object> map= new HashMap<>();
		if( result > 0) {
			map.put("result", result);
		} else {
			List<Reply> rlist = cService.deleteReply(r.getRno(), r.getCno());
			map.put("rlist", rlist); 
		}
		return map;
	}
		
}
