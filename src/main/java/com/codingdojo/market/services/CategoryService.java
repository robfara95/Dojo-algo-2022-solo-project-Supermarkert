package com.codingdojo.market.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.codingdojo.market.models.Category;
import com.codingdojo.market.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	CategoryRepository repository;
	
	public void validate (Category category, Errors errors) {
		if (errors.getErrorCount() > 0 ) {
			return;
		}		
		
		if (repository.findByCategory(category.getCategory()) != null) {
			errors.rejectValue("category", "Duplicate", "Category already defined1");
		}		
	}
	
	public List<Category> getAll() {
		return repository.findAllByOrderByCategoryAsc();
	}
	
	public Category findByName(String item) {
		return repository.findByCategory(item);
	}
	
	public Category create(Category item) {
		return repository.save(item);
	}   
}
