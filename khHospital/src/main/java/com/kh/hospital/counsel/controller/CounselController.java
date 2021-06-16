package com.kh.hospital.counsel.controller;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hospital.counsel.Pagination;
import com.kh.hospital.counsel.model.service.CounselService;
import com.kh.hospital.counsel.model.vo.Attachment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.counsel.model.vo.PageInfo;
import com.kh.hospital.counsel.model.vo.Reply;
import com.kh.hospital.counsel.model.vo.Search;
import com.kh.hospital.member.model.vo.Member;

@Controller
@RequestMapping("/counsel")
public class CounselController {

	@Autowired
	private CounselService cService;
	
	@GetMapping("/list")
	public ModelAndView counselList(int did, ModelAndView mv, 
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = cService.selectListCount(did);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Counsel> list = cService.selectList(pi, did);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("did", did);
			mv.setViewName("/counsel/counselList");
		} else {
			mv.addObject("msg", "게시글 조회에 실패하였습니다.");
			mv.setViewName("/counsel/counselSelect");
		}
		return mv;
	}
	
	@GetMapping("/select")
	public String counselSelect() {
		return "/counsel/counselSelect";
	}
	
	@GetMapping("/write")
	public String counselWritePage(Model model, int did) {
		model.addAttribute("did", did);
		return "/counsel/counselWrite";
	}
	
	@PostMapping("/insert")
	public String counselInsert(Counsel c, @RequestParam(value="f1") MultipartFile file1,
			@RequestParam(value="f2") MultipartFile file2, HttpServletRequest request, Model model) {
		Attachment f1 = new Attachment();
		Attachment f2 = new Attachment();
		
		int result = cService.insertCounsel(c);
		
		if(!file1.getOriginalFilename().equals("")) {
			String renameFileName1 = saveFile(file1, request);
			int fResult = 0;
			
			if(renameFileName1 != null) {
				f1.setOriginName(file1.getOriginalFilename());
				f1.setChangeName(renameFileName1);
				f1.setCid(c.getCid());
				fResult = cService.insertFile(f1);
				
				if(fResult > 0) {
					System.out.println("file1 등록 완료");
				} else {
					System.out.println("file1 등록 실패");
				}
			}
			
			if(!file2.getOriginalFilename().equals("")) {
				String renameFileName2 = saveFile(file2, request);

				if(renameFileName2 != null) {
					f2.setOriginName(file2.getOriginalFilename());
					f2.setChangeName(renameFileName2);
					f2.setCid(c.getCid());
					fResult = cService.insertFile(f2);
					
					if(fResult > 0) {
						System.out.println("file2 등록 완료");
					} else {
						System.out.println("file2 등록 실패");
					}
				}
			}
		}
		if(result > 0) {
			model.addAttribute("did", c.getDid());
			return "redirect:/counsel/list";
		} else {
			model.addAttribute("did", c.getDid());
			model.addAttribute("msg", "게시글 작성에 실패했습니다.");
			return "/counsel/counselList";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\counselFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) folder.mkdirs();	
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_" 
					+ (int)(Math.random() * 100000) 
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}
		return renameFileName;
	}
	
	@GetMapping("/detail")
	public String counselDetail(int cid, int did, HttpServletRequest request, 
			  HttpServletResponse response, Model model) {
		boolean flagclist = false; 
		boolean flagcid = false; 
		
		Cookie[] cookies = request.getCookies();
		
		try {
			if(cookies != null) {
				for(Cookie coo : cookies) {
					if(coo.getName().equals("clist")) {
						flagclist = true;
						
							String clist = URLDecoder.decode(coo.getValue(), "UTF-8");
							String[] list = clist.split(",");
							for(String st : list) {
								if(st.equals(String.valueOf(cid))) flagcid = true;
							}
							
							if(!flagcid) {
								coo.setValue(URLEncoder.encode(clist + "," + cid, "UTF-8"));
								response.addCookie(coo);
							}
						}	
					}
				
					if(!flagclist) {	
						Cookie coo1 = new Cookie("clist", URLEncoder.encode(String.valueOf(cid), "UTF-8"));
						response.addCookie(coo1);
					}
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		Counsel c = cService.selectCounsel(cid, !flagcid);
		List<Attachment> flist = cService.selectFile(cid); 
		List<Reply> rlist = cService.selectReplyList(cid);
		
		if(c != null) {
			model.addAttribute("c", c);
			if(flist != null)
				model.addAttribute("flist", flist);
			if(rlist != null) 
				model.addAttribute("rlist", rlist);
			return "/counsel/counselDetail";
		} else {
			model.addAttribute("did", did);
			model.addAttribute("msg", "게시글 상세 표시에 실패했습니다.");
			return "/counsel/counselList";
		}
	}
	
	@GetMapping("/modifyPage")
	public String modifyPage(int cid, Model model) {
		Counsel c = cService.selectCounsel(cid, false);
		List<Attachment> flist = cService.selectFile(cid); 
		
		if(c != null) {
			model.addAttribute("c", c);
			if(flist != null) {
				model.addAttribute("flist", flist);
			}
		}
		return "/counsel/counselUpdate";
	}
	
	@PostMapping("/modify")
	public String CounselModify(Counsel c, @RequestParam(value="f1") MultipartFile file1,
			@RequestParam(value="f2") MultipartFile file2, HttpServletRequest request) {
		
			String[] files = request.getParameterValues("fid");
			Attachment fi1 = null;
			Attachment fi2 = null;
			int fResult = 0;
			
			if(files != null) {
				if(files.length == 1) {	
					fi1 = cService.selectFileByFid(files[0]);
					
					if(fi1 != null) {
						if(!file1.getOriginalFilename().equals("")) {
							if(fi1.getChangeName() != null) {
								deleteFile(fi1.getChangeName(), request);
							}

							String renameFileName = saveFile(file1, request);
							if(renameFileName != null) {
								fi1.setOriginName(file1.getOriginalFilename());
								fi1.setChangeName(renameFileName);
								fResult = cService.updateFile(fi1);
								
								if(fResult > 0) {
									System.out.println("첨부파일 1 변경 성공");
								} else {
									System.out.println("첨부파일 1 변경 실패");
								}
							}
						}
						
						if(!file2.getOriginalFilename().equals("")) {
							String renameFileName2 = saveFile(file2, request);

							if(renameFileName2 != null) {
								fi2 = new Attachment();
								fi2.setOriginName(file2.getOriginalFilename());
								fi2.setChangeName(renameFileName2);
								fi2.setCid(c.getCid());
								fResult = cService.insertFileFromModify(fi2);
								
								if(fResult > 0) {
									System.out.println("첨부파일 2 등록 완료");
								} else {
									System.out.println("첨부파일 2 등록 실패");
								}
							}
						}
					} 
			} else if(files.length == 2) {		
					fi1 = cService.selectFileByFid(files[0]);
					fi2 = cService.selectFileByFid(files[1]);
					
					if(fi1 != null && fi2 != null) {
						if(!file1.getOriginalFilename().equals("")) {
							if(fi1.getChangeName() != null) {
								deleteFile(fi1.getChangeName(), request);
							}

							String renameFileName = saveFile(file1, request);
							if(renameFileName != null) {
								fi1.setOriginName(file1.getOriginalFilename());
								fi1.setChangeName(renameFileName);
								fResult = cService.updateFile(fi1);
								
								if(fResult > 0) {
									System.out.println("첨부파일 1 변경 성공");
								} else {
									System.out.println("첨부파일 1 변경 실패");
								}
							}
						}
						
						if(!file2.getOriginalFilename().equals("")) {
							if(fi2.getChangeName() != null) {
								deleteFile(fi2.getChangeName(), request);
							}

							String renameFileName2 = saveFile(file2, request);
							if(renameFileName2 != null) {
								fi2.setOriginName(file2.getOriginalFilename());
								fi2.setChangeName(renameFileName2);
								fResult = cService.updateFile(fi2);
								
								if(fResult > 0) {
									System.out.println("첨부파일 2 변경 성공");
								} else {
									System.out.println("첨부파일 2 변경 실패");
								}
							}			
						}
					} 
				} 
			} else {
				if(!file1.getOriginalFilename().equals("")) {
					String renameFileName1 = saveFile(file1, request);
					if(renameFileName1 != null) {
						fi1 = new Attachment();
						fi1.setOriginName(file1.getOriginalFilename());
						fi1.setChangeName(renameFileName1);
						fi1.setCid(c.getCid());
						fResult = cService.insertFileFromModify(fi1);
						
						if(fResult > 0) {
							System.out.println("첨부파일 1 등록 완료");
						} else {
							System.out.println("첨부파일 1 등록 실패");
						}
					}
				}
						
				if(!file2.getOriginalFilename().equals("")) {
					String renameFileName2 = saveFile(file2, request);

					if(renameFileName2 != null) {
						fi2 = new Attachment();
						fi2.setOriginName(file2.getOriginalFilename());
						fi2.setChangeName(renameFileName2);
						fi2.setCid(c.getCid());
						fResult = cService.insertFileFromModify(fi2);
						
						if(fResult > 0) {
							System.out.println("첨부파일 2 등록 완료");
						} else {
							System.out.println("첨부파일 2 등록 실패");
						}
					}
				}
			}
			int result = cService.updateCounsel(c);
			
			if(result > 0) {
				return "redirect:/counsel/detail?cid=" + c.getCid() + "&did=" + c.getDid();
			} else {
				return "redirect:/counsel/list?did=" + c.getDid();
			}
		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\counselFiles";
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) f.delete();
	}
	
	@GetMapping("/delete")
	public String counselDelete(int cid, int did, HttpServletRequest request, Model model) {
		Counsel c = cService.selectCounsel(cid, false);
		List<Attachment> flist = cService.selectFile(cid); 
		int result = cService.deleteCounsel(cid);
		
		if(result > 0) {
			if(flist != null) {	
				for(Attachment f : flist) {
					if(f.getChangeName() != null) {
						deleteFile(f.getChangeName(), request);
					}
				}
			}
			model.addAttribute("did", did);
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			return "/counsel/counselList";
		} else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
			model.addAttribute("did", did);
			model.addAttribute("cid", cid);
			return "/counsel/counselDetail";
		}
	}
	
	@PostMapping(value="/insertReply" , produces ="application/json; charset=utf-8")
	public @ResponseBody String insertReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		r.setUserId(userId);
		
		List<Reply> rlist = cService.insertReply(r);
		
		if(rlist != null) {
			int result = cService.modifyCounselStatus(r.getCid());
			if(result > 0){
				System.out.println("상담글 상태 변경 성공");
			} else {
				System.out.println("상담글 상태 변경 실패");
			}
		}
		
		Gson gson = new GsonBuilder()
				.setDateFormat("yyyy.MM.dd")
				.create();
		
		return gson.toJson(rlist);
	}
	
	@PostMapping("/deleteReply")
	public void deleteReply(int rid, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		int result = cService.deleteReply(rid);
		
		if(result > 0) {
			out.write("성공");
		} else {
			out.write("실패");
		}
		
		out.flush();
		out.close();
	}
	
	@PostMapping("/modifyReply")
	public void modifyReply(Reply r, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		System.out.println(r.getRid() + r.getRcontent());
		
		int result = cService.updateReply(r);
		JSONObject con = new JSONObject();
		
		if(result > 0) {
			con.put("rcontent", r.getRcontent());
		}
		
		out.print(con);
		out.flush();
		out.close();
	}
	
	@GetMapping("/search")
	public String counselSearch(@ModelAttribute Search s, int did, Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		s.setDid(did);
	
		int listCount = cService.selectSearchListCount(s);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Counsel> slist = cService.selectSearchList(pi, s);
		
		if(slist != null) {
			model.addAttribute("list", slist);
			model.addAttribute("pi", pi);
		}
			
		model.addAttribute("did", did);
		return "/counsel/counselList";
	}
}
