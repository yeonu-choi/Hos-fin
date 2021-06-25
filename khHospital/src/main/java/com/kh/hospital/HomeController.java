package com.kh.hospital;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.hospital.main.model.service.MainService;
import com.kh.hospital.main.model.vo.News;
import com.kh.hospital.notice.model.vo.Notice;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MainService nService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<News> list = nService.selectNewsList();
		List<Notice> nlist = nService.selectNoticeList();
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("nlist", nlist);
		}

		return "home";
	}
	
}
