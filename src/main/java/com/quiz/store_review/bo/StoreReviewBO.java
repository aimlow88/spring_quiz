package com.quiz.store_review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.store_review.domain.StoreVO;
import com.quiz.store_review.mapper.StoreReviewMapper;

@Service
public class StoreReviewBO {
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	public List<StoreVO> getStoreList(){
		return storeReviewMapper.selectStoreList();
	}

}
