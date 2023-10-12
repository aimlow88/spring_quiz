package com.quiz.store_review.mapper;

import java.util.List;

import com.quiz.store_review.domain.StoreVO;

public interface StoreReviewMapper {
	
	public List<StoreVO> selectStoreList();

}
