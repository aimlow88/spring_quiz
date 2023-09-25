package com.quiz.lesson03.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;

@Repository
public interface RealEstateMapper {
	
	public List<RealEstate> selectRealEstate(int id);
	
	public List<RealEstate> selectRealEstateListByRentPrice(Integer rentPrice);
	
	public List<RealEstate> selectRealEstateListByAreaPrice(Map<String, String> paramMap);
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateAsFiled(
				@Param("realtorId") int realtorId,
				@Param("address") String address,
				@Param("area") int area,
				@Param("type") String type,
				@Param("price") int price,
				@Param("rentPrice") Integer rentPrice
			);

}
