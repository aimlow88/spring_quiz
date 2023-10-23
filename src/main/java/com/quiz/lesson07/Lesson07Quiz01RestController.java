package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RequestMapping("/lesson07/quiz01")
@Controller
public class Lesson07Quiz01RestController {
	
	@Autowired
	private CompanyBO companyBO;
	
	@GetMapping("/save1")
	@ResponseBody
	public CompanyEntity create1() {
		
		String name = "넥손";
		String business = "컨텐츠 게임";
		String scale = "대기업";
		int headcount = 3585;
		
		return companyBO.addCompany(name, business, scale, headcount);
	}
	
	@GetMapping("/save2")
	public String create2(
			@ModelAttribute CompanyEntity companyEntity
			, Model model
			) {
		
		String name = "버블팡";
		String business = "여신 금융업";
		String scale = "대기업";
		int headcount = 6834;
		
		companyEntity = companyBO.addCompany(name, business, scale, headcount);
		
		model.addAttribute("result", companyEntity);
		
		return "lesson07/save";
	}
	
	@GetMapping("/update")
	@ResponseBody
	public CompanyEntity update() {
		
		return companyBO.updateScaleHeadcountById(8, "중소기업", 34);
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String delete() {
		companyBO.deleteCompany(20);
		return "삭제";
	}

}
