package com.quiz.lesson07.bo;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.entity.CompanyEntity;
import com.quiz.lesson07.repository.CompanyRepository;

@Service
public class CompanyBO {
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public CompanyEntity addCompany(String name, String business, String scale, Integer headcount) {
//		CompanyEntity company = CompanyEntity.builder()
//				.name(name)
//				.business(business)
//				.scale(scale)
//				.headcount(headcount)
//				.build();
		return companyRepository.save(
				CompanyEntity.builder()
				.name(name)
				.business(business)
				.scale(scale)
				.headcount(headcount)
				.build()
				);
	}
	
	public CompanyEntity updateScaleHeadcountById(int id, String scale, int headcount) {
		
		CompanyEntity company = companyRepository.findById(id).orElse(null);
		if (company != null) {
			company.toBuilder()
			.scale(scale)
			.headcount(headcount)
			.build();
			
			companyRepository.save(company);
		}
		return company;
	}
	
	public void deleteCompany(int id) {
		
		Optional<CompanyEntity> company = companyRepository.findById(id);
		company.ifPresent(c -> companyRepository.delete(c));
		
	}
	
	public List<CompanyEntity> getCompanyById(int id){
		
		return companyRepository.findCompanyById(id) ;
	}

}
