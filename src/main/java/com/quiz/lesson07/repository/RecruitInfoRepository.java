package com.quiz.lesson07.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.entity.RecruitInfoEntity;

@Repository
public interface RecruitInfoRepository extends JpaRepository<RecruitInfoEntity, Integer>{
	
	public List<RecruitInfoEntity> findByCompanyId(int companyId);
	
	public List<RecruitInfoEntity> findByTypeAndPositionContaining(String type, String position);
	
	public List<RecruitInfoEntity> findByTypeOrSalaryGreaterThan(String type, int salary);
	
	public List<RecruitInfoEntity> findTop3ByTypeOrderBySalaryDesc(String type);
	
	public List<RecruitInfoEntity> findByRegionAndSalaryBetween(String region, int start, int end);
	
//	@Query(value = "select ri from recruit_info ri where ri.salary >= :salary and ri.type = :type and deadline > :deadline")
	@Query(value = "select * from recruit_info where salary >= :salary and type = :type and deadline > :deadline", nativeQuery=true)
	public List<RecruitInfoEntity> findByTypeAndSalaryGreaterThanAndDeadlineGreaterThan(
			@Param("type") String type,
			@Param("salary") int salary,
			@Param("deadline") String deadline);

}
