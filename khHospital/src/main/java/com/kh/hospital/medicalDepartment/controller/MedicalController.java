package com.kh.hospital.medicalDepartment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/medical")
public class MedicalController {
	
	@GetMapping("/department")
	public String departmentList() {
		return "medicalDepartment/medicalMain";
	}
	
	@GetMapping("/d1")
	public String d1() {
		return "medicalDepartment/d1Page";
	}
	
	@GetMapping("/d2")
	public String d2() {
		return "medicalDepartment/d2Page";
	}
	
	@GetMapping("/d3")
	public String d3() {
		return "medicalDepartment/d3Page";
	}
	
	@GetMapping("/d4")
	public String d4() {
		return "medicalDepartment/d4Page";
	}
	
	@GetMapping("/d5")
	public String d5() {
		return "medicalDepartment/d5Page";
	}
	
	@GetMapping("/d6")
	public String d6() {
		return "medicalDepartment/d6Page";
	}
	
	@GetMapping("/d7")
	public String d7() {
		return "medicalDepartment/d7Page";
	}
	
	@GetMapping("/d8")
	public String d8() {
		return "medicalDepartment/d8Page";
	}
	
	@GetMapping("/d9")
	public String d9() {
		return "medicalDepartment/d9Page";
	}
	
	@GetMapping("/d10")
	public String d10() {
		return "medicalDepartment/d10Page";
	}
	
	@GetMapping("/d11")
	public String d11() {
		return "medicalDepartment/d11Page";
	}
	
	@GetMapping("/d12")
	public String d12() {
		return "medicalDepartment/d12Page";
	}
	
	@GetMapping("/d13")
	public String d13() {
		return "medicalDepartment/d13Page";
	}
	
	@GetMapping("/d14")
	public String d14() {
		return "medicalDepartment/d14Page";
	}
	
	@GetMapping("/d15")
	public String d15() {
		return "medicalDepartment/d15Page";
	}
	
	@GetMapping("/c31")
	public String c31() {
		return "medicalDepartment/c31Page";
	}
	
	@GetMapping("/c32")
	public String c32() {
		return "medicalDepartment/c32Page";
	}
	
	@GetMapping("/c33")
	public String c33() {
		return "medicalDepartment/c33Page";
	}
	
	@GetMapping("/c34")
	public String c34() {
		return "medicalDepartment/c34Page";
	}
	
	@GetMapping("/c35")
	public String c35() {
		return "medicalDepartment/c35Page";
	}

}
