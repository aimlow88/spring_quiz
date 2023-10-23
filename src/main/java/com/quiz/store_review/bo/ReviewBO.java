package com.quiz.store_review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.store_review.domain.ReviewVO;
import com.quiz.store_review.mapper.ReviewMapper;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<ReviewVO> getReviewList(int id){
		return reviewMapper.selectReviewList(id);
	}

}
