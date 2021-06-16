package com.kh.hospital.main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hospital.main.model.service.MainService;
import com.kh.hospital.main.model.vo.News;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MainService nService;
	
	@GetMapping("/newsPage")
	public String newsInsertPage() {
		return "/main/newsInsert";
	}
	
	@GetMapping("/newsInsert")
	public void newsInsert(News n, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		if(n.getNtitle().length() > 30) {
			String title = n.getNtitle().substring(0, 27) + "…";
			n.setNtitle(title);
		}
		
		int result = nService.insertNews(n);
		
		if(result > 0) {
			out.write("success");
		} else {
			out.write("fail");
		}
		
		out.flush();
		out.close();
	}
}
