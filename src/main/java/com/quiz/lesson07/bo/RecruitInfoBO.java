package com.quiz.lesson07.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.entity.RecruitInfoEntity;
import com.quiz.lesson07.repository.RecruitInfoRepository;

@Service
public class RecruitInfoBO {
	
	@Autowired
	private RecruitInfoRepository recruitInfoRepository;
	
	public List<RecruitInfoEntity> getRecruitInfoListByCompanyId(int companyId){
		return recruitInfoRepository.findByCompanyId(companyId);
	}
	
	public List<RecruitInfoEntity> getRecruitInfoByTypeAndPositionContaining(String type, String position){
		return recruitInfoRepository.findByTypeAndPositionContaining(type, position);
	}
	
	public List<RecruitInfoEntity> getRecruitInfoByTypeOrSalary(String type, int salary){
		return recruitInfoRepository.findByTypeOrSalaryGreaterThan(type, salary);
	}
	
	public List<RecruitInfoEntity> getRecruitInfoTop3ByTypeOrderBySalaryDesc(String type){
		return recruitInfoRepository.findTop3ByTypeOrderBySalaryDesc(type);
	}
	
	public List<RecruitInfoEntity> getRecruitInfoByRegionAndSalaryBetween(String region, int start, int end){
		return recruitInfoRepository.findByRegionAndSalaryBetween(region, start, end);
	}
	
	public List<RecruitInfoEntity> getRecruitInfoByTypeAndSalaryGreaterThanAndDeadlineGreaterThan(String type, int salary, String deadline){
		return recruitInfoRepository.findByTypeAndSalaryGreaterThanAndDeadlineGreaterThan(type, salary, deadline);
	}
	
}
