package com.quiz.store_review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.quiz.store_review.bo.StoreReviewBO;
import com.quiz.store_review.domain.StoreVO;

@Controller
public class StoreReviewController {
	
	@Autowired
	private StoreReviewBO storeReviewBO;
//	private StoreVO storeVO;
	
	@GetMapping("/store-review/store-list")
	public String storeList(Model model) {
		List<StoreVO> storeList = new ArrayList<>();
		storeList = storeReviewBO.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "store_review/storeList";
	}

}
