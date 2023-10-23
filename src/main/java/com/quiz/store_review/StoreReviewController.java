package com.quiz.store_review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;
import com.quiz.store_review.bo.ReviewBO;
import com.quiz.store_review.domain.ReviewVO;

@Controller
public class StoreReviewController {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/store-review/store-list")
	public String storeList(Model model) {
		List<Store> storeList = new ArrayList<>();
		storeList = storeBO.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "store_review/storeList";
	}
	
	@GetMapping("/store-review/review-view")
	public String storeReview(
			@RequestParam("id") int id
			, @RequestParam("name") String name
			, Model model 
			) {
		
		List<ReviewVO> reviewList = new ArrayList<>();
		reviewList = reviewBO.getReviewList(id);
		model.addAttribute("title", name);
		model.addAttribute("reviewList", reviewList);
		
		return "store_review/reviewList";
	}

}
