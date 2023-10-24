package com.quiz.lesson07;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.bo.RecruitInfoBO;
import com.quiz.lesson07.entity.CompanyEntity;
import com.quiz.lesson07.entity.RecruitInfoEntity;

@RequestMapping("/lesson07/quiz02")
@RestController
public class Lesson07Quiz02RestController {
	
	@Autowired
	private CompanyBO companyBO;
	
	@Autowired
	private RecruitInfoBO recruitInfoBO;
	
	List<CompanyEntity> companyList = new ArrayList<>();
	List<RecruitInfoEntity> recruitInfoList = new ArrayList<>();
	
	@GetMapping("/1")
	public List<CompanyEntity> getCompany () {
		
		// 1) id로 조회 : id=8
		companyList = companyBO.getCompanyById(8);
		return companyList;
	}
	
	@GetMapping("/2")
	public List<RecruitInfoEntity> getRecruitInfoByCompanyId (@RequestParam("companyId") int companyId ) {
		// 2) companyId로 조회 : companyId=8
		recruitInfoList = recruitInfoBO.getRecruitInfoListByCompanyId(companyId);
		return recruitInfoList;
	}
	
	@GetMapping("/3")
	public List<RecruitInfoEntity> getRecruitInfoByTypeAndPositionContaining () {
		// 3) 정규직 & back-end
		recruitInfoList = recruitInfoBO.getRecruitInfoByTypeAndPositionContaining("정규직", "back-end");
		return recruitInfoList;
	}
	
	@GetMapping("/4")
	public List<RecruitInfoEntity> getRecruitInfoByTypeAndSalary () {
		// 4) 정규직 || 연봉 9000 이상
		recruitInfoList = recruitInfoBO.getRecruitInfoByTypeOrSalary("정규직", 9000);
		return recruitInfoList;
	}
	
	@GetMapping("/5")
	public List<RecruitInfoEntity> getRecruitInfoTop3ByTypeAndSalaryDesc () {
		// 5) 계약직 & 연봉상위 3개
		recruitInfoList = recruitInfoBO.getRecruitInfoTop3ByTypeOrderBySalaryDesc("계약직");
		return recruitInfoList;
	}
	
	@GetMapping("/6")
	public List<RecruitInfoEntity> getRecruitInfoByRegionAndSalaryBetween () {
		// 6) 성남시 분당구 & 연봉 7000 ~ 8500
		recruitInfoList = recruitInfoBO.getRecruitInfoByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
		return recruitInfoList;
	}
	
	@GetMapping("/7")
	public List<RecruitInfoEntity> getRecruitInfoByTypeAndSalaryGreaterThanAndDeadlineGreaterThan () {
		// 7) 정규직 & 연봉 8100 ~ & 2026-04-10~
		recruitInfoList = recruitInfoBO.getRecruitInfoByTypeAndSalaryGreaterThanAndDeadlineGreaterThan("정규직", 8100, "2026-04-10");
		return recruitInfoList;
	}

}
