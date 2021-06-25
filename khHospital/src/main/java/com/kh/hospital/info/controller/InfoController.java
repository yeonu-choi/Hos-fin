package com.kh.hospital.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@GetMapping("/pharmacy")
	public String pharmacyInfo() {
		return "info/pharmacyInfo";
	}
}
