package com.quiz.lesson03.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.domain.RealEstate;
import com.quiz.lesson03.mapper.RealEstateMapper;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateMapper realEstateMapper;
	public List<RealEstate> getRealEstate(int id){
		return realEstateMapper.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(Integer rent_price){
		return realEstateMapper.selectRealEstateListByRentPrice(rent_price);
	}
	
	public List<RealEstate> getRealEstateListByAreaPrice(Map<String, String> paramMap){
		return realEstateMapper.selectRealEstateListByAreaPrice(paramMap);
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
	public int addRealEstateAsFiled(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		return realEstateMapper.insertRealEstateAsFiled(realtorId, address, area, type, price, rentPrice);
	}
}
