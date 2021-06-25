package com.kh.hospital.culture.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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

import com.kh.hospital.culture.exception.CultureException;
import com.kh.hospital.culture.model.service.CultureService;
import com.kh.hospital.culture.model.vo.Culture;

@Controller
@RequestMapping("/culture")
public class CultureController {

	@Autowired
	private CultureService cService;

	
	  @GetMapping("/culturelist") public ModelAndView CultureList(ModelAndView mv)
	  // <페이징 처리 변환 ajax비동기로 바꿈>
	  
	 /* @RequestParam(value="page", required = false, defaultValue = "1") int
	  currentPage)*/ {
	  
	  //int listCount = cService.selectListCount();
	  //System.out.println(listCount);
	  
	  //PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	  
	  //System.out.println(pi);
	  
	  List<Culture> list = cService.selectList(); // System.out.println(list);
	  if(list != null) { mv.addObject("list", list); // mv.addObject("pi", pi);
	  mv.setViewName("culture/culturelist");
	  
	  } else { mv.addObject("msg","목록 조회 실패 하였습니다.");
	  mv.setViewName("common/errorPage"); }
	  
	  
	  return mv;
	  }
	 
	

	@GetMapping("/write")
	public String cultureWritePage() {

		return "culture/cultureWrite";
	}
	
	// 작성하기
	@PostMapping("/insert")
	public String insertCulture(Culture c, @RequestParam(value = "uploadFile") MultipartFile file,
			HttpServletRequest request) throws CultureException {

		System.out.println("c에 대한 정보 :" + c);

		// 1. 파일 저장
		if (!file.getOriginalFilename().equals("")) {

			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				c.setOriginalFileName(file.getOriginalFilename());
				c.setRenameFileName(renameFileName);
			}

		}

		// 2. db
		int result = cService.insertCulture(c);
		
		if (result > 0) {
			return "redirect:/culture/culturelist";

		} else {
			throw new CultureException("등록에 실패하였습니다.");
		}

	}

	// 파일 저장 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\cuploadFiles";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdirs();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_" + (int) (Math.random() * 100000)
				+ originalFileName.substring(originalFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}

		return renameFileName;
	}

	/* 상세보기 */
	@GetMapping("/detail")
	public String cultureDetail(int cid, Model model) {

		Culture c = cService.selectCulture(cid);

		// System.out.println("Culture : " + c);

		if (c != null) {
			model.addAttribute("Culture", c);
			return "culture/cultureDetail";

		} else {
			model.addAttribute("msg", "게시글 보기에 실패했습니다.");
			return "common/errorPage";
		}

	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\cuploadFiles";
		File f = new File(savePath + "\\" + fileName);
		if (f.exists())
			f.delete();
	}

	/* delete */
	@GetMapping("/delete")
	public String cultureDelete(int cid, HttpServletRequest request) throws CultureException {

		Culture c = cService.selectCulture(cid);
		int result = cService.deleteCulture(cid);

		// System.out.println("c" + c);

		if (c.getRenameFileName() != null) {
			// 서버에서 파일 삭제
			deleteFile(c.getRenameFileName(), request);
		}

		if (result > 0) {
			return "redirect:/culture/culturelist";
		} else {
			throw new CultureException("삭제에 실패하였습니다.");
		}

	}

	// 수정 페이지
	@GetMapping("updatePage")
	public String cultureUpdatePage(@RequestParam int cid, Model model) {

		Culture c = cService.selectCulture(cid);
		model.addAttribute("Culture", c);
		
		return "/culture/cultureUpdate";
	}

	// 수정 하기
	@PostMapping("/update")
	public String cultureUpdate(@ModelAttribute Culture c,
								@RequestParam(value="uploadFile")
								MultipartFile file,
            					HttpServletRequest request) throws CultureException {
		
		
		//System.out.println("파일네임" +file.getOriginalFilename());
		// 파일 네임이 없다면 유지 , 있다면 db들어가서 rename조회후 삭제 + 그리고 변경
		
		Culture cc = cService.selectCulture(c.getCid());
		
		//System.out.println("c :" + c);
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(c.getRenameFileName() != null) {
				deleteFile(c.getRenameFileName(), request);	
			}
			
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				c.setOriginalFileName(file.getOriginalFilename());
				c.setRenameFileName(renameFileName);
			}
			
			//System.out.println(c);
		
		}
		
		int result = cService.updateCulture(c);
		//System.out.println(result);
		if(result > 0) {
			return "redirect:/culture/detail?cid=" + c.getCid();
		} else {
			throw new CultureException("수정에 실패하였습니다.");
		}
				
	}
	
	
	  // ajax로 더보기!! 받기
	  
	  @PostMapping("/morelist")
	  @ResponseBody  
	  public List<Culture> morelist(int stepIndex, HttpServletResponse response, HttpServletRequest request) {
		  // response.setContentType("application/json; charset=utf-8");
		  System.out.println("stepIndex : " + stepIndex);
		  List<Culture> list = cService.moreList(stepIndex);
		  
		  // System.out.println("list :" + list);
		  
		 /*
		  JSONArray jarr = new JSONArray();
		  for(Culture rlist : list) {
			  JSONObject mlist = new JSONObject();
			  mlist.put("ctitle", rlist.getCtitle());
			  mlist.put("csubtitle", rlist.getCsubtitle());
			  mlist.put("renameFileName", rlist.getRenameFileName());
			  
			  jarr.add(mlist);
		  } 
			  JSONObject sendJson = new JSONObject();
			  sendJson.put("list",jarr);
		  
			  System.out.println("sendJson : "+sendJson);
		*/	  
			  
			  
	
			  return list;
		  	  
	  }
	  		

}
