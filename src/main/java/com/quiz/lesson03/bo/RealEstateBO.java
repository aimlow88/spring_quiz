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
	
	public List<RealEstate> getRealEstateListByAreaPrice(int area, int price){
		return realEstateMapper.selectRealEstateListByAreaPrice(area, price);
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
	public int addRealEstateAsFiled(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		return realEstateMapper.insertRealEstateAsFiled(realtorId, address, area, type, price, rentPrice);
	}
	
	public int changeRealEstateAsId(int id, String type, int price) {
		return realEstateMapper.updateRealEstateAsId(id, type, price);
	}
	
	public int subtrtRealEstateById(int id) {
		return realEstateMapper.deleteRealEstateById(id);
	}
}
