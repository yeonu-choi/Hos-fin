
  package com.kh.hospital.infor.controller;
 
  import org.springframework.stereotype.Controller; import
  org.springframework.web.bind.annotation.GetMapping; import
  org.springframework.web.bind.annotation.RequestMapping;
 
  @Controller
  
  @RequestMapping("/infor") public class InforController {
  
	  /* 페이지 이동 */
	  @GetMapping("/location") public String inforlocationView() {
  
		  return "infor/locationInfo";
  
	  }
	  
	  /* 층별 안내 */
	  @GetMapping("/floor") public String floorView() {
		  
		  return "infor/floorInfo";
	  }
	  
	  /* 서류 첨부 */
	  
	  @GetMapping("/document") public String document() {
		  
		  return "infor/document";
	  }
	  
	  /* 진료 안내*/
	  
	  @GetMapping("diagnosis") public String diagnosis() {
		  
		  return "infor/diagnosis";
	  }
	  
	  
	  
  }
 