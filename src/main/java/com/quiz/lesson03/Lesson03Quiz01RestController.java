package com.quiz.lesson03;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.domain.RealEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	@RequestMapping("/1")
	public List<RealEstate> quiz01_1(@RequestParam(value="id", required=false) int id){
		return realEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(@RequestParam(value="rentPrice", required=false) Integer rentPrice){
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(@RequestParam Map<String,String> paramMap){
		return realEstateBO.getRealEstateListByAreaPrice(paramMap);
	}

}
