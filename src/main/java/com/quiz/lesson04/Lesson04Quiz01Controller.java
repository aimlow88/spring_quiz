package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.domain.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	@GetMapping("/add-seller-view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}

	@PostMapping("/add-seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="temperature", required=false) Double temperature
			) {
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/afterAddSeller";
	}
	
	//연습문제 1-2 seller 정보 출력
	@GetMapping("/seller-info")
//	public String sellerInfo(Model model) {
//		Seller seller = sellerBO.getLatestSellerInfo();
//		model.addAttribute("result", seller);
//		model.addAttribute("title", "판매자 정보");
//		return "lesson04/sellerInfo";
//	}
	
	//연습문재 1-3
	public String sellerInfo(Model model, @RequestParam(value="id", required=false) Integer id) {
		if (id == null) {
			Seller seller = sellerBO.getLatestSellerInfo();
			model.addAttribute("result", seller);
		} else {
			Seller seller = sellerBO.getSellerById(id);
			model.addAttribute("result", seller);
		}
		model.addAttribute("title", "판매자 정보");
		return "lesson04/sellerInfo";
	}

}
