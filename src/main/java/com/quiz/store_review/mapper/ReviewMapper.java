package com.quiz.store_review.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.store_review.domain.ReviewVO;

@Repository
public interface ReviewMapper {
	
	public List<ReviewVO> selectReviewList(int id);

}
