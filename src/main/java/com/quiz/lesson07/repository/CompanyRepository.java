package com.quiz.lesson07.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.entity.CompanyEntity;

@Repository
public interface CompanyRepository extends JpaRepository<CompanyEntity, Integer>{
	// JpaRepository : Spring Data JPA
	
	// Quiz02
	// 1) id로 조회
	public List<CompanyEntity> findCompanyById(int id);

}
